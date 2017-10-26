#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "logfile.h"
#include "tree.h"


inline void
tree::register_sim(treenode *node)
{
  if(node->son[0] == &mpty)
    insert_sim(mpty_sim_group + node->level, node);
  else if(node->son[0] == &leaf)
    insert_sim(leaf_sim_group + node->level, node);
  else if(node->son[0]->sim.list == 0) {
    node->son[0]->single_sim = 1;
    node->son[0]->sim.node   = node;
  }
  else if(node->son[0]->single_sim) {
    sim_grp
      *sim_list;
    node->son[0]->single_sim = 0;
    sim_list         = create_sim();
    insert_sim(&(sim_list->list), node->son[0]->sim.node);
    insert_sim(&(sim_list->list), node);
    node->son[0]->sim.list = sim_list;
  }
  else
    insert_sim(&(node->son[0]->sim.list->list), node);
}

inline void
tree::release_sim(treenode *node)
{
  if(node->son[0] == &mpty)
    remove_sim(mpty_sim_group + node->level, node);
  else if(node->son[0] == &leaf)
    remove_sim(leaf_sim_group + node->level, node);
  else if(node->son[0]->single_sim) {
    node->son[0]->sim.node   = 0;
    node->son[0]->single_sim = 0;
  }
  else {
    treenode
      *tn;
    remove_sim(&(node->son[0]->sim.list->list), node);
    if((tn = node->son[0]->sim.list->list)->next == 0) {
      remove_sim(&(node->son[0]->sim.list->list), tn);
      destroy_sim(node->son[0]->sim.list);
      node->son[0]->sim.node   = tn;
      node->son[0]->single_sim = 1;
    }
  }
}

inline sim_grp *
tree::create_sim()
{
sim_grp
  *new_sim;

  SIM_CSTR_CNT(sim_grp_virt_alloc);

  if(free_sim_grp_list==0) {
    if((new_sim = new sim_grp) == 0) {
      logprintf(ERROR_MSG, "%s: Memory full in create_sim().\n", MessageHead);
      exit(1);
    }
    SIM_CSTR_CNT(sim_grp_true_alloc);
  }
  else {
    free_sim_grp_list_length -= 1;
    new_sim           = free_sim_grp_list;
    free_sim_grp_list = free_sim_grp_list->next;
  }

  if(sim_groups != 0)
    sim_groups->prev = new_sim;
  new_sim->next = sim_groups;
  new_sim->prev = 0;
  new_sim->list = 0;
  sim_groups    = new_sim;

  return new_sim;
}

inline void
tree::destroy_sim(sim_grp *sim_list)
{
  SIM_CSTR_CNT(sim_grp_virt_free);

  if(sim_list->prev != 0)
    (sim_list->prev)->next = sim_list->next;
  else
    sim_groups = sim_list->next;

  if(sim_list->next != 0)
    (sim_list->next)->prev = sim_list->prev;

  if(free_node_list_length > MaxSimGrpBufferLength) {
    delete sim_list;
    SIM_CSTR_CNT(sim_grp_true_free);
  }
  else {
    sim_list->next            = free_sim_grp_list;
    free_sim_grp_list         = sim_list;
    free_sim_grp_list_length += 1;
  }
}

inline void
tree::insert_sim(treenode **sim_grp_base, treenode *node)
{
  SIM_CHNG_CNT(sim_grp_changes);

  // Wie gehen davon aus, dass der Knoten in der Liste
  // `nodes_not_sim' steht. Er muss deshalb dort ausgekettet werden.
  if(node->prev != 0)
    (node->prev)->next = node->next;
  else
    nodes_not_sim = node->next;

  if(node->next != 0)
    (node->next)->prev = node->prev;

  // Und rein in die neue Liste.
  if(*sim_grp_base != 0)
    (*sim_grp_base)->prev = node;
  
  node->next = *sim_grp_base;
  node->prev = 0;

  *sim_grp_base = node;
}

inline void
tree::remove_sim(treenode **sim_grp_base, treenode *node)
{
  SIM_CHNG_CNT(sim_grp_changes);

  // Ausketten aus der ehemaligen SimGroup
  if(node->prev != 0)
    (node->prev)->next = node->next;
  else
    *sim_grp_base = node->next;

  if(node->next != 0)
    (node->next)->prev = node->prev;

  // Und rein in die Liste `nodes_not_sim'.
  if(nodes_not_sim != 0)
    nodes_not_sim->prev = node;

  node->next = nodes_not_sim;
  node->prev = 0;

  nodes_not_sim = node;
}

inline treenode *
tree::node_alloc(unsigned long level)
{
treenode
  *new_node;

  ND_CSTR_CNT(node_virt_alloc);
  overall_node_no += 1;

  if(free_node_list==0) {
    if((new_node = new treenode)==0) {
      logprintf(ERROR_MSG, "%s: Memory full in node_alloc().\n", MessageHead);
      exit(1);
    }
    new_node->id    = next_node_id++;
    ND_CSTR_CNT(node_true_alloc);
  }
  else {
    free_node_list_length -= 1;
    new_node               = free_node_list;
    free_node_list         = free_node_list->next;
  }

  new_node->level      = level;
  new_node->no_refs    = 1;
  new_node->sim.list   = 0;
  new_node->single_sim = 0;

  if(nodes_not_sim != 0)
    nodes_not_sim->prev = new_node;
  new_node->next = nodes_not_sim;
  new_node->prev = 0;

  nodes_not_sim = new_node;

  return(new_node);

}

inline void
tree::node_free(treenode *node)
{
  ND_CSTR_CNT(node_virt_free);
  overall_node_no -= 1;

  if(node->prev != 0)
    (node->prev)->next = node->next;
  else
    nodes_not_sim = node->next;
  if(node->next != 0)
    (node->next)->prev = node->prev;
 
  if(free_node_list_length > MaxNodeBufferLength) {
    delete node;
    ND_CSTR_CNT(node_true_free);
  }
  else {
    node->next            = free_node_list;
    free_node_list        = node;
    free_node_list_length += 1;
  }
}

treenode *
tree::create_node(treenode *son0, treenode *son1, unsigned long lev)
{
  treenode
    *node;

  if(son0 == son1) {
    node          = son1;
    node->no_refs -= 1;
    return(node);
  }

  if(son0->level == 0) {
    SIM_RD_CNT(sim_grp_reads);
    if(son0 == &leaf)
      node = leaf_sim_group[lev];
    else
      node = mpty_sim_group[lev];

    for(; node != 0; node = node->next) {
      SIM_RD_ST_CNT(sim_grp_read_steps);
      if(son1 == node->son[1]) {
	node->no_refs += 1;
	son0->no_refs -= 1;
	son1->no_refs -= 1;
	return(node);
      }
    }
  }
  else if(son0->sim.list != 0) {
    if(son0->single_sim) {
      SIM_RD_CNT(sim_grp_reads);
      SIM_RD_ST_CNT(sim_grp_read_steps);
      if(son1 == son0->sim.node->son[1] && lev == son0->sim.node->level) {
        son0->sim.node->no_refs += 1;
        son0->no_refs -= 1;
        son1->no_refs -= 1;
        return(son0->sim.node);
      }
    }
    else if((son0->level == 0 || son0->no_refs > 1) &&
            (son1->level == 0 || son1->no_refs > 1)) {
      SIM_RD_CNT(sim_grp_reads);
      for(node = son0->sim.list->list; node != 0; node = node->next) {
        SIM_RD_ST_CNT(sim_grp_read_steps);
        if(son1 == node->son[1] && node->level == lev) {
          node->no_refs += 1;
          son0->no_refs -= 1;
          son1->no_refs -= 1;
          return(node);
        }
      }
    }
  }

  node         = node_alloc(lev);
  node->son[0] = son0;
  node->son[1] = son1;

  register_sim(node);

  return(node);

}

treenode *
tree_empty(treenode *node)
{
static tree
  dummy;

  if(node->level == 0 || node->no_refs > 1) {
    node->no_refs -= 1;
    return(tree::Mpty);
  }

  dummy.release_sim(node);

  tree_empty(node->son[0]);
  tree_empty(node->son[1]);

  dummy.node_free(node);

  return(tree::Mpty);
}

