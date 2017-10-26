#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "logfile.h"
#include "AVL.h"
#if defined(__GNUC__)
#include "AVL.c"
#endif
#include "tree.h"

/* Besteht der Baum, den wir haben aus hoechstens einem Pfad? */
int
tree::tree_is_single_path(treenode *node)
{
  if(node->level == 0)
    return 1;

  if(node->son[0] != Mpty &&
     node->son[1] != Mpty)
    return 0;

  return tree_is_single_path(node->son[node->son[0] == Mpty]);
}

int
tree::contains(char pattern[])
{
  int i;

  for(i = 0; i < level_no; i++)
    switch(pattern[i]) {
    case '0':
      printline[level_no - i] = ((polarity[level_no - i] == '+') ? '0' : '1');
      break;
    case '1':
      printline[level_no - i] = ((polarity[level_no - i] == '-') ? '0' : '1');
      break;
    case '-':
      printline[level_no - i] = '-';
      break;
    default :
      logprintf(ERROR_MSG,
		"tree::contains() pattern to evaluate is %s : `%s'. \n",
		pattern[i] == 0 ? "too short" : "bad", pattern);
      return -1;
    }
  
  printline[i + 1] = 0;

  return tree_contains(root);
}

int
tree::tree_contains(treenode *node)
{
  if(node == Leaf)
    return 2;
  else if(node == Mpty)
    return 0;
  else if(printline[node->level] == '0')
    return tree_contains(node->son[0]);
  else if(printline[node->level] == '1')
    return tree_contains(node->son[1]);
  else {
    int r0 = tree_contains(node->son[0]),
        r1 = tree_contains(node->son[1]);
    if(r0 + r1 == 0 || r0 + r1 == 4)
      return r0;
    return 1;
  }
}

int
tree::extract_multiple(char *term, char *multterm)
{
  int
    i;
  treenode
    *tn;
  
  if(tree_extract_multiple(root, term)) {
    if(multterm == 0)
      multterm = new char[level_no + 1];
    for(i = 0; i <= level_no; i++)
      multterm[i] = term[i];
    for(tn = root; tn = tn->son[tn->flag != 0]; tn->level)
      multterm[tn->level] = '0' + (tn->flag != 0);
    return 1;
  }

  return 0;
}

int
tree::tree_extract_multiple(treenode *tn, char *term)
{
  if(tn->level == 0)
    return tn == Leaf;
  else {
    int dir = term[level_no - tn->level] - '0';
    if(tree_extract_multiple(tn->son[dir], term)) {
      tn->flag = dir;
      return 1;
    }
    else if(dir == 0) {
      tn->flag = 1;
      return tree_extract_multiple(tn->son[1], term);
    }
    else
      return 0;
  }
}

#define COUNT_CUBES_DISJ_OPTI_CACHE
unsigned long
tree::tree_count_cubes_disj_opti(treenode *node)
{
static int_c
  *cached_res;

  if(node == Mpty)
    return 0;
  else if(node == Leaf)
    return 1;
#ifdef COUNT_CUBES_DISJ_OPTI_CACHE
  else if(cached_res = count_cubes_disj_opti_cache.get(tn_ptr(node)))
    return cached_res->i;
#endif
  else {
    unsigned long res = 0;
    treenode *path_zero, *path_one, *path_dc;
    tree_spread(node->son[0], node->son[1], &path_zero, &path_dc, &path_one);
    res = tree_count_cubes_disj_opti(path_dc) +
          tree_count_cubes_disj_opti(path_zero) +
          tree_count_cubes_disj_opti(path_one);
    tree_empty(path_one);
    tree_empty(path_zero);
    tree_empty(path_dc);
#ifdef COUNT_CUBES_DISJ_OPTI_CACHE
    count_cubes_disj_opti_cache.insert(int_c(res), tn_ptr(node));
#endif
    return res;
  }
}

unsigned long
tree::count_literal_sums(unsigned long *zero,
			 unsigned long *one,
			 unsigned long *dontc)
{
  unsigned long
    cube_no,
    i,
    no_ze, no_on, no_dc,
    *ze, *on, *dc;

  if(zero && one && dontc) {
    ze = zero;
    on = one;
    dc = dontc;
  }
  else {
    ze = &no_ze;
    on = &no_on;
    dc = &no_dc;
  }

  *ze = *on = *dc = 0;
  
  for(i = 0; i < level_no; i++)
    printline[i] = '-';

  cube_no = tree_count_literal_sums(root, ze, on, dc);

  if(ze == &no_ze)
    logprintf(RESULT_MSG, "`0': %u, `1': %u, `-': %u\n",
	      no_ze, no_on, no_dc);

  clear_caches();

  return cube_no;
}

unsigned long
tree::count_signature(unsigned long **ones)
{
  int i;
  
  if(*ones == 0)
    *ones = new unsigned long[level_no];
  
  for(i = 0; i < level_no; i++) {
    printline[i] = '-';
    (*ones)[i]   = 0;
  }
  printline[i] = 0;
  
  return tree_count_signature(root, *ones);
}

void
tree::count_inputwise(unsigned long count_type,
		      unsigned long **zeroes,
		      unsigned long **ones)
{
  unsigned long
    i, paths;

  if(zeroes == 0 || ones == 0) {
    unsigned long
      *zeroes = new unsigned long[level_no],
      *ones   = new unsigned long[level_no];

    for(i = 0; i < level_no; i++) {
      printline[i] = '-';
      zeroes[i] = 0;
      ones[i] = 0;
    }

    switch(count_type) {
    case CountSignature:
      paths = tree_count_signature(root, ones);
      for(i = 0; i < level_no; i++)
	zeroes[i] = paths - ones[i];
      break;
    case CountLiterals:
      tree_count_literals(root, zeroes, ones);
      break;
    case CountCompressedLiterals:
      tree_count_compressed_literals(root, zeroes, ones);
      break;
    default:;
    }

    for(i = 0; i < level_no; i++)
      logprintf(RESULT_MSG, "Input %4u: `0': %10u, `1': %10u\n",
		i, zeroes[i], ones[i]);
    delete [] ones;
    delete [] zeroes;
  }
  else {
    if(*zeroes == 0) *zeroes = new unsigned long[level_no];
    if(*ones == 0)   *ones   = new unsigned long[level_no];
    
    for(i = 0; i < level_no; i++) {
      printline[i] = '-';
      (*zeroes)[i] = 0;
      (*ones)[i] = 0;
    }

    switch(count_type) {
    case CountSignature:
      paths = tree_count_signature(root, *ones);
      for(i = 0; i < level_no; i++)
	(*zeroes)[i] = paths - (*ones)[i];
      break;
    case CountLiterals:
      tree_count_literals(root, *zeroes, *ones);
      break;
    case CountCompressedLiterals:
      tree_count_compressed_literals(root, *zeroes, *ones);
      break;
    default:;
    }
  }

  clear_caches();
}

// Kopiere alle no_refs-Komponenten. damit das sinnvoll ist, muessen hier alle
// Resultcaches leer sein.
void
tree::tree_fill_norefs_cache(treenode *node)
{
  if(node->level == 0)
    return;

  if(!norefs_cache.get(tn_ptr(node))) {
    norefs_cache.insert(int_c(node->no_refs), tn_ptr(node));
    tree_fill_norefs_cache(node->son[0]);
    tree_fill_norefs_cache(node->son[1]);
  }
}

// Suche den treenode, der die hoechste Mehrfachnutzung hat. Sein no_refs ist
// maximal.
treenode *
tree::fetch_max_refnode(treenode *node)
{
  treenode
    *tn0, *tn1;
  unsigned long
    nr0, nr1, nrn;
  
  if(node->level == 0)
    return node;

  tn0 = fetch_max_refnode(node->son[0]);
  tn1 = fetch_max_refnode(node->son[1]);
  
  nr0 = tn0->level > 0 ? norefs_cache.get(tn_ptr(tn0))->i : 0;
  nr1 = tn1->level > 0 ? norefs_cache.get(tn_ptr(tn1))->i : 0;
  nrn = norefs_cache.get(tn_ptr(node))->i;
  
  // In tn0 soll der Sohn mit dem groessten `no_refs' stehen.
  if(tn0->level == 0 ||
     (tn1->level > 0 &&
      (nr1 - 1) * tn1->level * tree_count_cubes_disj_opti(tn1) >
      (nr0 - 1) * tn0->level * tree_count_cubes_disj_opti(tn0))) {
    tn0 = tn1;
    nr0 = nr1;
  }
  
  if(tn0->level > 0 &&
     (nr0 - 1) *  tn0->level * tree_count_cubes_disj_opti(tn0) >
     (nrn - 1) * node->level * tree_count_cubes_disj_opti(node))
    return tn0;
  else
    return node;

}

// Suche den Baumknoten der innerhalb eines Baumes am meisten mehrfach
// Referenziert wird. In `maxval' und `maxnode' werden Referenzenanzahl
// und Knotenadresse des besten Knotens gehalten.
void
tree::tree_count_localrefs(treenode      *node,
			   unsigned long *maxval,
			   treenode     **maxnode)
{
  static int_c
    *cached_res;

  if(node->level == 0)
    return;

  cached_res = count_localrefs_cache.get(tn_ptr(node));
  
  if(cached_res) {
    // Beim durchlaufen des aktuellen Baums waren wir schon mal bei node
    // und muessen nun den bisherigen Referenzzaehler `cached_res->i' um
    // eins erhoehen. In den daranhanegenden Teilbaum muss nicht weiter
    // hinabgestiegen werden. Das haben wir beim ersten Treffen schon getan.
    cached_res->i++;
    // Alle Werte gewichtet mit der Flaeche des dranhaengenden Baums
    if((cached_res->i - 1) * node->level * tree_count_cubes_disj_opti(node) >
       (*maxval       - 1) * (*maxnode)->level * tree_count_cubes_disj_opti(*maxnode)) {
      // Hat sich das bisherige Ergebnis verbessert?
      *maxval  = cached_res->i;
      *maxnode = node;
    }
    return;
  }
  else {
    // Der Knoten `node' wird in diesem Moment zum ersten mal besucht. Sein
    // Zaehler wird auf eins gesetzt und in den Ergebnisbaum
    // `count_localrefs_cache' eingetragen. Danach steigen wir rekursiv ueber
    // seine Soehne hinab. :)))
    count_localrefs_cache.insert(int_c(1), tn_ptr(node));
    if(!*maxval) {
      // Hatten wir zuvor noch kein Ergebnis?
      *maxval  = 1;
      *maxnode = node;
    }
    tree_count_localrefs(node->son[0], maxval, maxnode);
    tree_count_localrefs(node->son[1], maxval, maxnode);
  }
}

unsigned long
tree::tree_count_nodes(treenode *node)
{
  if(node->level == 0 || node->flag == 1)
    return 0;

  node->flag = 1;

  return(tree_count_nodes(node->son[0]) + tree_count_nodes(node->son[1]) + 1);
}

unsigned long
tree::tree_count_active_nodes(treenode *node)
{
  if(node->level == 0 || node->flag == 1)
    return 0;

  node->flag = 1;

  if(node->level <= 4)
    return 1;

  return(tree_count_active_nodes(node->son[0]) + 
	 tree_count_active_nodes(node->son[1]) + 1);
}

void
tree::tree_count_factors(treenode *node, unsigned long *countlist)
{
  if(node->level == 0)
    return;

  countlist[node->level]++;

  tree_count_factors(node->son[0], countlist);
  tree_count_factors(node->son[1], countlist);
}

void
tree::tree_detect_nonzero(treenode *node,
			  unsigned long lastlev,
			  char nonzero[])
{
  int i;

  if(node == Mpty)
    return;

  for(i = (int) lastlev - 1; i > node->level; i--)
    nonzero[level_no - i] = '+';

  if(node == Leaf)
    return;

  if(node->son[1] != Mpty) {
    nonzero[level_no - node->level] = '+';
    tree_detect_nonzero(node->son[1], node->level, nonzero);
  }

  tree_detect_nonzero(node->son[0], node->level, nonzero);
}

void
tree::tree_detect_nondc(treenode *node, char nondc[])
{
  if(node->level == 0)
    return;

  nondc[level_no - node->level] = '+';

  tree_detect_nondc(node->son[0], nondc);
  tree_detect_nondc(node->son[1], nondc);
}


#define COUNT_PATHS_CACHE
unsigned long
tree::tree_count_paths(treenode *node, unsigned long level)
{
static int_c
  *cached_res;
unsigned long
  res;

  if(node == Mpty)
    res = 0;
  else if(node == Leaf)
    res = 1 << level;
#ifdef COUNT_PATHS_CACHE
  else if(cached_res = count_paths_cache.get(tn_ptr_int(node, level)))
    res = cached_res->i;
#endif
  else {
    res = (1 << (level - node->level)) *
      (tree_count_paths(node->son[0], node->level - 1) +
       tree_count_paths(node->son[1], node->level - 1));

#ifdef COUNT_PATHS_CACHE
    count_paths_cache.insert(int_c(res), tn_ptr_int(node, level));
#endif
  }

  //logprintf(DEBUG_MSG, "`%d' has %d paths.\n", node->id, res);
  return res;
}

#define COUNT_CUBES_CACHE
unsigned long
tree::tree_count_cubes(treenode *node)
{
static int_c
  *cached_res;
unsigned long
  res;

  if(node == Mpty)
    return 0;
  else if(node == Leaf)
    return 1;
#ifdef COUNT_CUBES_CACHE
  else if(cached_res = count_cubes_cache.get(tn_ptr(node)))
    return cached_res->i;
#endif
  else
    res = tree_count_cubes(node->son[0]) + tree_count_cubes(node->son[1]);

#ifdef COUNT_CUBES_CACHE
  count_cubes_cache.insert(int_c(res), tn_ptr(node));
#endif
  return res;
}

unsigned long
tree::tree_count_literal_sums(
  treenode *node,
  unsigned long *zero,
  unsigned long *one,
  unsigned long *dontc)
{
  unsigned long
    cube_no;

  if(node == Mpty)
    return 0;
  if(node == Leaf) {
    // Pfad ist fertig. Nun werte ihn aus.
    int i;
    for(i = 0; i < level_no; i++)
      switch(printline[i]) {
	case '0': (*zero)++; break;
	case '1': (*one)++; break;
	case '-': (*dontc)++; break;
      }
    return 1;
  }
  else {
    treenode *path_zero, *path_one, *path_dc;
    tree_spread(node->son[0], node->son[1], &path_zero, &path_dc, &path_one);
    cube_no = tree_count_literal_sums(path_dc, zero, one, dontc);
    printline[level_no - node->level] = '0';
    cube_no += tree_count_literal_sums(path_zero, zero, one, dontc);
    printline[level_no - node->level] = '1';
    cube_no += tree_count_literal_sums(path_one, zero, one, dontc);
    printline[level_no - node->level] = '-';
    tree_empty(path_one);
    tree_empty(path_zero);
    tree_empty(path_dc);
    return cube_no;
  }
}

//#define COUNT_SIGNATURE_SPREAD
#ifdef COUNT_SIGNATURE_SPREAD
unsigned long
tree::tree_count_signature(treenode *node, unsigned long ones[])
{
  if(node == Mpty)
    return 0;
  if(node == Leaf) {
    // Pfad ist fertig. Nun werte ihn aus.
    unsigned long
      i, path_no = 1;
    for(i = 0; i < level_no; i++)
      if(printline[i] == '-')
	path_no <<= 1;
    for(i = 0; i < level_no; i++)
      switch(printline[i]) {
      case '1':	ones[i] += path_no;	 break;
      case '-':	ones[i] += path_no >> 1; break;
      default: break;
      }
    return path_no;
  }	
  else {
    treenode
      *path_zero,
      *path_one,
      *path_dc;
    unsigned long
      path_no;
    tree_spread(node->son[0], node->son[1], &path_zero, &path_dc, &path_one);
    path_no = tree_count_signature(path_dc, ones);
    printline[level_no - node->level] = '0';
    path_no += tree_count_signature(path_zero, ones);
    printline[level_no - node->level] = '1';
    path_no += tree_count_signature(path_one, ones);
    printline[level_no - node->level] = '-';
    tree_empty(path_one);
    tree_empty(path_zero);
    tree_empty(path_dc);
    return path_no;
  }
}
#else
unsigned long
tree::tree_count_signature(treenode *node, unsigned long ones[])
{
  if(node == Mpty)
    return 0;
  if(node == Leaf) {
    // Pfad ist fertig. Nun werte ihn aus.
    unsigned long
      i, path_no = 1;
    for(i = 0; i < level_no; i++)
      if(printline[i] == '-')
	path_no <<= 1;
    for(i = 0; i < level_no; i++)
      switch(printline[i]) {
      case '1':	ones[i] += path_no;	 break;
      case '-':	ones[i] += path_no >> 1; break;
      default: break;
      }
    return path_no;
  }	
  else {
    unsigned long path_no;
    printline[level_no - node->level] = '0';
    path_no = tree_count_signature(node->son[0], ones);
    printline[level_no - node->level] = '1';
    path_no += tree_count_signature(node->son[1], ones);
    printline[level_no - node->level] = '-';
    return path_no;
  }
}
#endif

void
tree::tree_count_compressed_literals(treenode *node,
				     unsigned long zeroes[],
				     unsigned long ones[])
{
  if(node == Mpty)
    return;
  if(node == Leaf) {
    // Pfad ist fertig. Nun werte ihn aus.
    int i;
    for(i = 0; i < level_no; i++)
      switch(printline[i]) {
      case '0':
	zeroes[i] += 1;
	break;
      case '1':
	ones[i] += 1;
	break;
      default:;
      }
  }
  else {
    treenode *path_zero, *path_one, *path_dc;
    tree_spread(node->son[0], node->son[1], &path_zero, &path_dc, &path_one);
    tree_count_compressed_literals(path_dc, zeroes, ones);
    printline[level_no - node->level] = '0';
    tree_count_compressed_literals(path_zero, zeroes, ones);
    printline[level_no - node->level] = '1';
    tree_count_compressed_literals(path_one, zeroes, ones);
    printline[level_no - node->level] = '-';
    tree_empty(path_one);
    tree_empty(path_zero);
    tree_empty(path_dc);
  }
}

void
tree::tree_count_literals(treenode *node,
			  unsigned long zeroes[],
			  unsigned long ones[])
{
  if(node==Mpty)
    return;
  if(node==Leaf) {
    // Pfad ist fertig. Nun werte ihn aus.
    for(int i = 0; i < level_no; i++)
      switch(printline[i]) {
      case '0':
	zeroes[i] += 1;
	break;
      case '1':
	ones[i] += 1;
	break;
      case '-':
	break;
      }
  }
  else {
    printline[level_no - node->level] = '0';
    tree_count_literals(node->son[0], zeroes, ones);
    printline[level_no - node->level] = '1';
    tree_count_literals(node->son[1], zeroes, ones);
    printline[level_no - node->level] = '-';
  }
}

unsigned long
get_global_level_no()
{
  return tree::MaxLevel;
}

unsigned long
tree::count(unsigned long mode)
{
  if(root == 0) {
    logprintf(ERROR_MSG,
	      "%s: error in count(): erroneous tree. 0 returned.\n",
	      MessageHead);
    return 0;
  }
  else if(mode & CountNodes)
    return tree_count_nodes(root);
  else if(mode & CountPaths)
    return tree_count_paths(root, level_no);
  else if(mode & CountCubes)
    return tree_count_cubes(root);
  else if(mode & CountCubesDisjOpt) {
    unsigned long res = tree_count_cubes_disj_opti(root);
    clear_caches();
    return res;
  }
  else if(mode & CountNoRefsLower) {
    treenode     *tn    = Leaf;
    unsigned long n     = 0;
    tree_count_localrefs(root, &n, &tn);
    unsigned long c = tree_count_cubes_disj_opti(tn);
    clear_caches();
    return (n - 1) * tn->level * c;
  }
  else if(mode & CountNoRefsUpper) {
    tree_fill_norefs_cache(root);
    treenode
      *tn = fetch_max_refnode(root);
    unsigned long c, r;
    c = tree_count_cubes_disj_opti(tn);
    r = tn->level > 0 ? norefs_cache.get(tn_ptr(tn))->i : 0;
    clear_caches();
    return (r - 1) * tn->level * c;
  }
  else if(mode & CountActiveNodes)
    return tree_count_active_nodes(root);
  else if(mode & CountFactors) {
    unsigned long 
      i, 
    retval = 0,
    *countlist = new unsigned long [level_no + 1];
    for(i = 0; i < level_no + 1; i++) countlist[i] = 0;
    tree_count_factors(root, countlist);
    for(i = 0; i < level_no + 1; i++) retval += countlist[i];
    delete[] countlist;
    return(retval);
  }
  else {
    logprintf(ERROR_MSG,
	      "%s: error in count(): bad argument %c, 0 returned.\n",
	      MessageHead, mode);
    return 0;
  }
}
