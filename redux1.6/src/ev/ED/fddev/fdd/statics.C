#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "logfile.h"
#include "tree.h"

unsigned long tree::MaxLevel		= 0;

unsigned long tree::next_node_id	= 0;

treenode *tree::free_node_list		= 0;
unsigned long tree::free_node_list_length = 0;

sim_grp *tree::free_sim_grp_list	= 0;
unsigned long tree::free_sim_grp_list_length = 0;

char *tree::MessageHead			= "Module Tree";
char *tree::printline			= 0;

#ifdef __GNUC__
treenode tree::leaf = {0, 0, 0, 0, 0, 0, 0, {0, 0}, {0}};
treenode tree::mpty = {0, 0, 0, 0, 0, 0, 0, {0, 0}, {0}};
#else
treenode tree::leaf = {0, 0, 0, 0, 0, 0, 0, {0, 0}};
treenode tree::mpty = {0, 0, 0, 0, 0, 0, 0, {0, 0}};
#endif

treenode *tree::Leaf			= &tree::leaf;
treenode *tree::Mpty			= &tree::mpty;

treenode **tree::zeropaths		= 0;
treenode **tree::leaf_sim_group         = 0;
treenode **tree::mpty_sim_group         = 0;

unsigned long tree::overall_node_no	= 0;

unsigned long tree::tp_mode		= 0;
int           tree::tp_verbo            = 0;
unsigned long tree::tp_sink		= 0;
unsigned long tree::tp_no_inputs	= 0;
unsigned long tree::tp_no_outputs	= 0;
unsigned long tree::tp_no_cubes_max	= 0;
unsigned long tree::tp_cube_cnt		= 0;
char	     *tree::tp_tag		= 0;
char	    **tree::tp_in_cubes		= 0;
char	    **tree::tp_out_cubes	= 0;
FILE	     *tree::tp_stream		= 0;

unsigned long tree::sim_grp_changes	= 0;
unsigned long tree::sim_grp_reads	= 0;
unsigned long tree::sim_grp_read_steps	= 0;
unsigned long tree::sim_grp_true_alloc	= 0;
unsigned long tree::sim_grp_true_free	= 0;
unsigned long tree::sim_grp_virt_alloc	= 0;
unsigned long tree::sim_grp_virt_free	= 0;

unsigned long tree::node_true_alloc	= 0;
unsigned long tree::node_true_free	= 0;
unsigned long tree::node_virt_alloc	= 0;
unsigned long tree::node_virt_free	= 0;

sim_grp *tree::sim_groups		= 0;
treenode *tree::nodes_not_sim		= 0;

int tree::flag_threshold                = 1;

AVL<tn_ptr_triple, tn_ptr_pair> tree::spread_cache;

AVL<tn_ptr, tn_ptr_pair> tree::union_cache;
AVL<tn_ptr, tn_ptr_pair> tree::xunion_cache;
AVL<tn_ptr, tn_ptr_pair> tree::intersect_cache;
AVL<tn_ptr, tn_ptr_pair> tree::crossmerge_cache;

AVL<tn_ptr, tn_ptr_int> tree::filter_level_cache;
AVL<tn_ptr, tn_ptr_int> tree::filter_paths_cache;
AVL<tn_ptr, tn_ptr_int> tree::flip_zeropath_cache;
AVL<tn_ptr, tn_ptr_int> tree::flip_0dc_cache;
AVL<tn_ptr, tn_ptr_int> tree::flip_1dc_cache;
AVL<tn_ptr, tn_ptr_int> tree::sel_flip_1dc_cache;

AVL<int_c, tn_ptr_int> tree::count_paths_cache;

AVL<tn_ptr, tn_ptr> tree::cut_literal_paths_cache;
AVL<tn_ptr, tn_ptr> tree::cut_dc_paths_cache;
AVL<tn_ptr, tn_ptr> tree::sel_flip_01_cache;
AVL<tn_ptr, tn_ptr> tree::flip_01_atlevel_cache;
AVL<tn_ptr, tn_ptr> tree::flip_1dc_atlevel_cache;
AVL<tn_ptr, tn_ptr> tree::exchange_levels_cache;

AVL<int_c, tn_ptr> tree::count_localrefs_cache;
AVL<int_c, tn_ptr> tree::norefs_cache;
AVL<int_c, tn_ptr> tree::count_cubes_cache;
AVL<int_c, tn_ptr> tree::count_cubes_disj_opti_cache;

int
clear_caches()
{
  static tree
    dummy_tree;
  
  dummy_tree.flip_zeropath_cache.clear();
  dummy_tree.flip_0dc_cache.clear();
  dummy_tree.flip_1dc_cache.clear();
  dummy_tree.sel_flip_01_cache.clear();
  dummy_tree.flip_01_atlevel_cache.clear();
  dummy_tree.sel_flip_1dc_cache.clear();
  dummy_tree.flip_1dc_atlevel_cache.clear();
  dummy_tree.exchange_levels_cache.clear();
  
  dummy_tree.cut_literal_paths_cache.clear();
  dummy_tree.cut_dc_paths_cache.clear();
  
  dummy_tree.filter_level_cache.clear();
  dummy_tree.filter_paths_cache.clear();

  dummy_tree.spread_cache.clear();

  dummy_tree.union_cache.clear();
  dummy_tree.xunion_cache.clear();
  dummy_tree.intersect_cache.clear();
  dummy_tree.crossmerge_cache.clear();
  
  dummy_tree.count_paths_cache.clear();
  dummy_tree.count_cubes_cache.clear();
  dummy_tree.count_cubes_disj_opti_cache.clear();
  dummy_tree.count_localrefs_cache.clear();
  dummy_tree.norefs_cache.clear();
  
  return 0;
};

void
tree::set_glob_levels(unsigned long Levels)
{
  unsigned long i;
  treenode
    **new_zeropaths,
    **new_leaf_sim_group,
    **new_mpty_sim_group;
  
//#define TEST_TREE_MAX_LEVEL
#ifdef TEST_TREE_MAX_LEVEL
  static unsigned long xxx[1000] = {0, };
  if(xxx[500] != MaxLevel) {
    logprintf(ERROR_MSG,
	      "Internal error: tree::MaxLevel has changed.\n"
	      "   actual value: %lu\n"
	      "   expected value: %lu\n",
	      MaxLevel, xxx[500]);
  }
#endif
    
  if(MaxLevel < Levels) {
    new_leaf_sim_group = new treenode *[Levels + 1]; 
    new_mpty_sim_group = new treenode *[Levels + 1];
    new_zeropaths      = new treenode *[Levels + 1];
    
    new_zeropaths[0] = Leaf;
    if(MaxLevel > 0) {
      for(i = 1; i <= MaxLevel; i++) {
	new_leaf_sim_group[i] = leaf_sim_group[i];
	new_mpty_sim_group[i] = mpty_sim_group[i];
	new_zeropaths[i]      = zeropaths[i];
      }
      delete [] leaf_sim_group;
      delete [] mpty_sim_group;
      delete [] zeropaths;
      delete [] printline;
    }
    
    leaf_sim_group = new_leaf_sim_group;
    mpty_sim_group = new_mpty_sim_group;
    zeropaths      = new_zeropaths;
    
    for(i = MaxLevel + 1; i <= Levels; i++) {
      leaf_sim_group[i] = mpty_sim_group[i] = 0;
      zeropaths[i] = create_node(zeropaths[i - 1], Mpty, i);
    }
    
    MaxLevel  = Levels;
#ifdef TEST_TREE_MAX_LEVEL
    xxx[500]  = MaxLevel;
#endif
    printline = new char [Levels + 1];
  }

  level_no = Levels;
}

#define PROFILE_RESOLUTION 1000
void
tree_sim_grp_info()
{
  long
    i, j,
//    countall,
//    countoptbl,
    sim_count;
  long
    new_count,
    *refs_0,
    profile[PROFILE_RESOLUTION],
    leaf_refs_0 = 0,
    mpty_refs_0 = 0;
  sim_grp
    *sim_list;
  treenode
    *node;
  
  sim_count  = 0; // Count the sim-classes
  
  logprintf(RESULT_MSG, "===== Node-Similiarity-Group Information =====\n");
  logprintf(RESULT_MSG, "Nodes in system: %ld\n", tree::overall_node_no);

  if((refs_0 = new long[tree::overall_node_no]) == 0) {
    logprintf(ERROR_MSG, "%s: memory full in tree_sim_grp_info().\n",
	      tree::MessageHead);
    exit(1);
  }

  for(i = 0; i < tree::overall_node_no; i++)
    refs_0[i] = 0;
  for(i = 0; i < PROFILE_RESOLUTION; i++)
    profile[i] = 0;

  new_count = 0; // Renumber the nodes

  for(node = tree::nodes_not_sim; node != 0; node = node->next)
    node->id = new_count++;

  for(j = 1; j <= tree::MaxLevel; j++) {
    for(node = tree::mpty_sim_group[j]; node != 0; node = node->next)
      node->id = new_count++;
    for(node = tree::leaf_sim_group[j]; node != 0; node = node->next)
      node->id = new_count++;
  }
  
  for(sim_list = tree::sim_groups; sim_list != 0; sim_list = sim_list->next)
    for(node = sim_list->list; node != 0; node = node->next)
      node->id = new_count++;

  if(new_count != tree::overall_node_no)
    logprintf(ERROR_MSG, "%s: inconsistency found in tree_sim_grp_info().\n",
	      tree::MessageHead);
    
  for(sim_list = tree::sim_groups; sim_list != 0; sim_list = sim_list->next) {
    ++sim_count;
    for(node = sim_list->list; node != 0; node = node->next) {
      if(node->son[0] == tree::Mpty)
	mpty_refs_0 += 1;
      else if(node->son[0] == tree::Leaf)
	leaf_refs_0 += 1;
      else if(node->son[0]->level > 0)
	refs_0[node->son[0]->id] += 1;
    }
  }

  for(i = 0; i < tree::overall_node_no; i++) {
    if(refs_0[i] >= PROFILE_RESOLUTION)
      profile[0] += 1;
    else if(refs_0[i])
      profile[refs_0[i]] += 1;
  }
  
  logprintf(RESULT_MSG, "Profile:\n");
  logprintf(RESULT_MSG,
	    "<GR>(<SZ>) : there are <GR> simgroups of size <SZ>.\n");
  for(i = 1; i < PROFILE_RESOLUTION; i++)
    if(profile[i])
      logprintf(RESULT_MSG, "%ld(%ld) ", profile[i], i);
  if(profile[0])
    logprintf(RESULT_MSG, "%ld(>=%ld) ", profile[0], PROFILE_RESOLUTION);
  logprintf(RESULT_MSG, "Leaf(%ld) ", leaf_refs_0);
  logprintf(RESULT_MSG, "Mpty(%ld)\n", mpty_refs_0);
  logprintf(RESULT_MSG, "Level-0-partitioning:\n");
  logprintf(RESULT_MSG, "Leaf: {");
  for(i = 1; i <= tree::MaxLevel; i++) {
    for(j = 0, node = tree::leaf_sim_group[i]; node; node = node->next, j++);
    logprintf(RESULT_MSG, "%lu%s", j, i == tree::MaxLevel ? "}\n" : ", ");
  }
  logprintf(RESULT_MSG, "Mpty: {");
  for(i = 1; i <= tree::MaxLevel; i++) {
    for(j = 0, node = tree::mpty_sim_group[i]; node; node = node->next, j++);
    logprintf(RESULT_MSG, "%lu%s", j, i == tree::MaxLevel ? "}\n" : ", ");
  }
  
  delete [] refs_0;
}

#ifdef trallallallalala
void
tree_sim_grp_info()
{
  long
    i, j,
    countall,
    countoptbl,
    sim_count;
#ifdef DB_CLASS_PROFILE
  long
    new_count,
    *refs_0,
    profile[PROFILE_RESOLUTION],
    leaf_refs_0 = 0,
    mpty_refs_0 = 0;
#endif
  sim_grp
    *sim_list;
  treenode
# ifdef DB_SIM_GRP_LIST
    *node1,
# endif
    *node;
  
  sim_count  = 0; // Count the sim-classes
  
  logprintf(RESULT_MSG, "===== Node-Similiarity-Group Information =====\n");
  logprintf(RESULT_MSG, "Nodes in system: %ld\n", tree::overall_node_no);

#ifdef DB_CLASS_PROFILE
  if((refs_0 = new long[tree::overall_node_no]) == 0) {
    logprintf(ERROR_MSG, "%s: memory full in tree_sim_grp_info().\n",
	      tree::MessageHead);
    exit(1);
  }

  for(i = 0; i < tree::overall_node_no; i++)
    refs_0[i] = 0;
  for(i = 0; i < PROFILE_RESOLUTION; i++)
    profile[i] = 0;

  new_count = 0; // Renumber the nodes

  for(node = tree::nodes_not_sim; node != 0; node = node->next)
    node->id = new_count++;

  for(j = 1; j <= Maxlevel; j++) {
    for(node = mpty_sim_group; node != 0; node = node->next)
      node->id = new_count++;
    for(node = leaf_sim_group; node != 0; node = node->next)
      node->id = new_count++;
  }
  
  for(sim_list = tree::sim_groups; sim_list != 0; sim_list = sim_list->next)
    for(node = sim_list->list; node != 0; node = node->next)
      node->id = new_count++;

  if(new_count != tree::overall_node_no)
    logprintf(ERROR_MSG, "%s: inconsistency found in tree_sim_grp_info().\n",
	      tree::MessageHead);
#endif
    
#ifdef DB_SHOW_SIM_GRPS
  if(tree::nodes_not_sim != 0) {
    countall = countoptbl = 0;
    for(node = tree::nodes_not_sim; node != 0; node = node->next) {
      if(node->son[0] == tree::Mpty)
        logprintf(RESULT_MSG, "%ld.%ld(%ld)son[0]=Mpty ",
		  node->id, node->level, node->no_refs);
      else if(node->son[0] == tree::Leaf)
        logprintf(RESULT_MSG, "%ld.%ld(%ld)son[0]=Leaf ",
		  node->id, node->level, node->no_refs);
      else
        logprintf(RESULT_MSG, "%ld.%ld(%ld)son[0]=%ld ",
		  node->id, node->level, node->no_refs, node->son[0]->id);
      countall += 1;
      countoptbl+=((node->son[0]->level == 0 || node->son[0]->no_refs > 1) &&
                   (node->son[1]->level == 0 || node->son[1]->no_refs > 1));
    }
    logprintf(RESULT_MSG, "[all: %ld, optbl: %ld].\n", countall, countoptbl);
  }
#endif

  for(sim_list = tree::sim_groups; sim_list != 0; sim_list = sim_list->next) {
    countall = countoptbl = 0;
#   ifdef DB_SIM_GRP_LIST
      node1 = 0;
#   endif
    ++sim_count;

#   ifdef DB_SHOW_SIM_GRPS
    if(sim_list->list->son[0] == tree::Mpty)
      logprintf(RESULT_MSG, "%ld (son[0] = Mpty): ", sim_count);
    else if(sim_list->list->son[0] == tree::Leaf)
      logprintf(RESULT_MSG, "%ld (son[0] = Leaf): ", sim_count);
    else
      logprintf(RESULT_MSG, "%ld (son[0] = %ld): ",
		sim_count, sim_list->list->son[0]->id);
#   endif
    
    for(node = sim_list->list; node != 0; node = node->next) {
#     ifdef DB_CLASS_PROFILE
        if(node->son[0] == tree::Mpty)
          mpty_refs_0 += 1;
        else if(node->son[0] == tree::Leaf)
          leaf_refs_0 += 1;
        else if(node->son[0]->level > 0)
          refs_0[node->son[0]->id] += 1;
#     endif

#   ifdef DB_SHOW_SIM_GRPS
      countall += 1;
      countoptbl+=((node->son[0]->level == 0 || node->son[0]->no_refs > 1) &&
                   (node->son[1]->level == 0 || node->son[1]->no_refs > 1));

      logprintf(RESULT_MSG, "%ld.%ld(%ld) ",
		node->id, node->level, node->no_refs);
#     ifdef DB_SIM_GRP_LIST
        if(node->next==0)
          node1 = node;
#     endif
#   endif
    }

#   ifdef DB_SHOW_SIM_GRPS
#   ifdef DB_SIM_GRP_LIST
      logprintf(RESULT_MSG, " -");
      while(node1!=0) {
        logprintf(RESULT_MSG, " %lu", node1->id);
        node1 = node1->prev;
      }
#   endif

    logprintf(RESULT_MSG, "[all: %ld, optbl: %ld].\n", countall, countoptbl);
#   endif
  }

# ifdef DB_CLASS_PROFILE
    for(i = 0; i < tree::overall_node_no; i++) {
      if(refs_0[i] >= PROFILE_RESOLUTION)
        profile[0] += 1;
      else if(refs_0[i])
        profile[refs_0[i]] += 1;
    }

    logprintf(RESULT_MSG, "Profile:\n");
    logprintf(RESULT_MSG,
	      "<GR>(<SZ>) : there are <GR> simgroups of size <SZ>.\n");
    for(i = 1; i < PROFILE_RESOLUTION; i++)
      if(profile[i])
        logprintf(RESULT_MSG, "%ld(%ld) ", profile[i], i);
    if(profile[0])
      logprintf(RESULT_MSG, "\n%ld(>=%ld) ", profile[0], PROFILE_RESOLUTION);
    logprintf(RESULT_MSG, " Leaf*(%ld)", leaf_refs_0);
    logprintf(RESULT_MSG, " Mpty*(%ld)\n", mpty_refs_0);

    delete [] refs_0;
# endif
}
#endif

void
tree_print_statistics(unsigned long mode)
{
  if(mode & StatSimGrpInfo)
    tree_sim_grp_info();
  else if(mode & StatProfileInfo) {
    logprintf(RESULT_MSG, "Tree-Base-Class Profile Information:\n\n");
#   ifdef DB_COUNT_SIM_GRP_CONSTRUCTS
      logprintf(RESULT_MSG, "Total Sim Groups . . . . . . . . %lu\n",
		tree::sim_grp_virt_alloc -
		tree::sim_grp_virt_free);
#   endif
    logprintf(RESULT_MSG, "Sim Group Buffer . . . . . . . . %lu\n",
	      tree::free_sim_grp_list_length);
    logprintf(RESULT_MSG, "Total Tree Nodes . . . . . . . . %lu\n",
	      tree::overall_node_no);
    logprintf(RESULT_MSG, "Tree Node Buffer . . . . . . . . %lu\n\n",
	      tree::free_node_list_length);
#   ifdef DB_COUNT_SIM_GRP_CHANGES
    logprintf(RESULT_MSG, "Sim Group changes  . . . . . . . %lu\n",
	      tree::sim_grp_changes);
#   endif
#   ifdef DB_COUNT_SIM_GRP_READS
    logprintf(RESULT_MSG, "Sim Group reads  . . . . . . . . %lu\n",
	      tree::sim_grp_reads);
#   endif
#   ifdef DB_COUNT_SIM_GRP_READ_STEPS
    logprintf(RESULT_MSG, "Sim Group read steps . . . . . . %lu\n",
	      tree::sim_grp_read_steps);
#   endif
#   if defined DB_COUNT_SIM_GRP_READS && defined DB_COUNT_SIM_GRP_READ_STEPS
    if(tree::sim_grp_reads)
      logprintf(RESULT_MSG, "Average read operation . . . . . %ld steps.\n",
		tree::sim_grp_read_steps / tree::sim_grp_reads);
#   endif
#   if defined DB_COUNT_EQIUV_CONSTRUCTS || defined DB_COUNT_NODE_CONSTRUCTS
    logprintf(RESULT_MSG,
	      "                                    virtual       real\n");
#   endif
#   ifdef DB_COUNT_SIM_GRP_CONSTRUCTS
    logprintf(RESULT_MSG, "Sim Group allocs . . . . . . . . %10lu %10lu\n",
	      tree::sim_grp_virt_alloc, tree::sim_grp_true_alloc);
    logprintf(RESULT_MSG, "Sim Group frees  . . . . . . . . %10lu %10lu\n",
	      tree::sim_grp_virt_free, tree::sim_grp_true_free);
#   endif
#   ifdef DB_COUNT_NODE_CONSTRUCTS
    logprintf(RESULT_MSG, "Node allocs  . . . . . . . . . . %10lu %10lu\n",
	      tree::node_virt_alloc, tree::node_true_alloc);
    logprintf(RESULT_MSG, "Node frees . . . . . . . . . . . %10lu %10lu\n",
	      tree::node_virt_free, tree::node_true_free);
#   endif
  }
  else
    logprintf(ERROR_MSG,
	      "%s: tree_print_statistics(%lu) - unknown output format %lu.\n",
	      tree::MessageHead, mode, mode);
}
