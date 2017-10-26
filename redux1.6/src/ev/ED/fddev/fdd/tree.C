#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "logfile.h"
#include "AVL.h"
#ifdef __GNUC__
#include "AVL.c"
#endif
#include "tree.h"

// FDD/EDD
/* Gleicht zwei FDDs verschiedener Hoehen an, damit diese dann verknuepft */
/* werden koennen. Schaut auch nach, ob die zu verknuepfenden FDDs gleiche */
/* Polaritaet haben. Falls nicht, erzeugt diese Funktion schon ein Error */
/* Objekt des Typs FDD. Sind die FDDs verschieden hoch (Ebenenanzahl), so */
/* muss an das niedrigere "oben ein Nullpfad angehaengt werden". Auch das */
/* macht diese Funktion, wenns noetig ist. */
int
tree::tree_func_equalize(
  const tree &t1, // Die beiden anzugleichenden
  const tree &t2, // Baeume
  treenode **r1,  // Hier stehen die Zeiger auf die
  treenode **r2,  // korrigierten Wurzeln.
  tree *result)	  // Hier kann spaeter das Verknuepfungsergebnis drin stehen.
		  // Bis jetzt sind polarity und level_no gesetzt.
{
  unsigned long
    i;

  if(t1.root == 0 || t2.root == 0) {
    result->reset_level_no(0);
    result->root = 0;
    return 0;
  }

  if(t1.level_no > t2.level_no) {
    result->reset_level_no(t1.level_no);
    for(i = 1; i <= t2.level_no; i++) {
      if(t1.polarity[i] != t2.polarity[i]) {
        result->reset_level_no(0);
        result->root = 0;
        return 0;
      }
      result->polarity[i] = t1.polarity[i];
    }
    for(; i <= t1.level_no; i++)
      result->polarity[i] = t1.polarity[i];
    *r1 = copy_node(t1.root);
    *r2 = tree_expand_zeropath(t1.level_no, t2.level_no, t2.root);
  }
  else {
    result->reset_level_no(t2.level_no);
    for(i = 1; i <= t1.level_no; i++) {
      if(t1.polarity[i] != t2.polarity[i]) {
        result->reset_level_no(0);
        result->root = 0;
        return 0;
      }
      result->polarity[i] = t1.polarity[i];
    }
    for(; i <= t2.level_no; i++)
      result->polarity[i] = t2.polarity[i];
    *r1 = tree_expand_zeropath(t2.level_no, t1.level_no, t1.root);
    *r2 = copy_node(t2.root);
  }

  return 1; 
}

/* Gibt 1 zurueck, wenn auf das Muster pattern in Pfadmenge tn eine */
/* ungradzahlige Menge von Pfaden passt, 0 sonst. */
int
tree::tree_func_evaluate(
  treenode *tn,		// Auszuwertender Baum
  unsigned long lev,	// Oberste Ebene des Baums, die erwartet wird.
  // Mit ihr stellen wir fest, ob eine Ebene uebersprungen worden ist.
  char *pattern)	// Einzusetzende Belegung der Eingaenge.
{
  int
    v0, v1;
  
  if(tn == Mpty)
    // Kein Pfad!
    return 0;

  if(lev == 0)
    // GENAU ein Pfad!
    return 1;

  if(lev > tn->level) {
    // Mindestens eine Ebene uebersprungen.
    if(pattern[level_no - lev] == '1')
      // durch eingesetzte 1 verdoppeln sich die Pfade und fallen so alle weg.
      return 0;
    return tree_func_evaluate(tn, lev - 1, pattern);
  }

  v0 = tree_func_evaluate(tn->son[0], lev - 1, pattern);
  
  if(pattern[level_no - lev] == '1') {
    // Wenn eine 0 eingesetzt wird, ist der Wert des 1-Sohnbaums 0. Wird
    // jedoch eine 1 eingesetzt, muessen wir ihn hier auswerten.
    v1 = tree_func_evaluate(tn->son[1], lev - 1, pattern);
    return (v0 + v1) == 1;
  }
  
  return v0;
}

/* Haengt oberhalb eines Baums auf den Ebenen hilev bis lolev einen */
/* 0-Pfad an. */
treenode *
tree::tree_expand_zeropath(unsigned long hilev, unsigned long lolev,
			   treenode *node)
{
unsigned long
  lev;
      
  copy_node(node);

  for(lev = lolev + 1; lev <= hilev; lev++)
    node = create_node(node, Mpty, lev);

  return(node);
}

/* Bekommt einen "01-"-Character-String und formt ihn in einen */
/* Baum um. */
treenode *
tree::tree_make_dcpath(char *path_string,
		       unsigned long level_no)
{
treenode
  *node;
unsigned long
  i;

  node = Leaf;

  for(i = 1; i <= level_no; ++i)
    if(path_string[level_no - i] == '0')
      node = create_node(node, Mpty, i);
    else if(path_string[level_no - i] == '1')
      node = create_node(Mpty, node, i);

  return(node);
}

// Verschiebt jeden Knoten aus dem Baum src um lev Ebenen "nach oben"
// und fuegt an jedem 'Leaf' den Unterbaum `rest` an
// ==>:  rest->level muss <= lev sein.
// Das Ergebnis der Operation wird in dest abgespeichert.
void tree::treeCopyMove (treenode *src, treenode * &dest,
                         unsigned long lev, treenode *rest)
{
  treenode *s0, *s1;
  
  if (src == Mpty)
    dest = Mpty;
  else if (src == Leaf)
    dest = rest;
  else {
    treeCopyMove (src->son[0], s0, lev, rest);
    treeCopyMove (src->son[1], s1, lev, rest);
    dest = create_node (s0, s1, src->level + lev);
  }
}


#define SPREAD_CACHE
void
tree::tree_spread(treenode *in1, treenode *in2,
                  treenode **out1, treenode **out12, treenode **out2)
{
  static tn_ptr_triple
    *cached_res;
  unsigned long
    high_lev;
  treenode
    *son0_out1, *son0_out12, *son0_out2,
    *son1_out1, *son1_out12, *son1_out2;

  if(in1 == in2) {
    *out1  = Mpty;
    *out12 = copy_node(in1);
    *out2  = Mpty;
    return;
  }
  else if(in1 == Mpty) {
    *out1 = Mpty;
    *out12 = Mpty;
    *out2 = copy_node(in2);
    return;
  }
  else if(in2 == Mpty) {
    *out1 = copy_node(in1);
    *out12 = Mpty;
    *out2 = Mpty;
    return;
  }

#ifdef SPREAD_CACHE
  if(in1 > in2) {
    if(cached_res = spread_cache.get(tn_ptr_pair(in2, in1))) {
      *out1  = copy_node(cached_res->nd3);
      *out12 = copy_node(cached_res->nd2);
      *out2  = copy_node(cached_res->nd1);
      return;
    }
  }
  else {
    if(cached_res = spread_cache.get(tn_ptr_pair(in1, in2))) {
      *out1  = copy_node(cached_res->nd1);
      *out12 = copy_node(cached_res->nd2);
      *out2  = copy_node(cached_res->nd3);
      return;
    }
  }
#endif

  if(in1->level == in2->level) {
    tree_spread(in1->son[0], in2->son[0], &son0_out1, &son0_out12, &son0_out2);
    tree_spread(in1->son[1], in2->son[1], &son1_out1, &son1_out12, &son1_out2);
    high_lev = in1->level;
  }
  else if(in1->level > in2->level) {
    tree_spread(in1->son[0], in2, &son0_out1, &son0_out12, &son0_out2);
    tree_spread(in1->son[1], in2, &son1_out1, &son1_out12, &son1_out2);
    high_lev = in1->level;
  }
  else {
    tree_spread(in1, in2->son[0], &son0_out1, &son0_out12, &son0_out2);
    tree_spread(in1, in2->son[1], &son1_out1, &son1_out12, &son1_out2);
    high_lev = in2->level;
  }

  *out1  = create_node(son0_out1, son1_out1, high_lev);
  *out12 = create_node(son0_out12, son1_out12, high_lev);
  *out2  = create_node(son0_out2, son1_out2, high_lev);

  if(tree_count_cubes_disj_opti(*out1) +
     tree_count_cubes_disj_opti(*out12) +
     tree_count_cubes_disj_opti(*out2) >
     tree_count_cubes_disj_opti(in1) +
     tree_count_cubes_disj_opti(in2)) {
    tree_empty(*out1);
    tree_empty(*out12);
    tree_empty(*out2);
    *out1  = copy_node(in1);
    *out12 = Mpty;
    *out2  = copy_node(in2);
  }

#ifdef SPREAD_CACHE
  IF_MULTIPLE_USED2(in1, in2) {
    if(in1 > in2)
      spread_cache.insert(tn_ptr_triple(*out2, *out12, *out1),
                          tn_ptr_pair(in2, in1));
    else
      spread_cache.insert(tn_ptr_triple(*out1, *out12, *out2),
                          tn_ptr_pair(in1, in2));
  }
#endif
}

/* Boolesche Division mit Rest, */
void
tree::tree_divide_rec(treenode *f, const treenode *q,
		      treenode **p, treenode **r,
		      treenode *OneTree, treenode *ZeroTree)
{
  if(f == q) {
    *p = copy_node(OneTree);
    *r = copy_node(ZeroTree);
  }
  else if(f->level <= q->level) {
    *p = copy_node(ZeroTree);
    *r = copy_node(f);
  }
  else { // if(f->level > q->level)
    treenode *p0, *p1, *r0, *r1;
    tree_divide_rec(f->son[0], q, &p0, &r0, OneTree, ZeroTree);
    tree_divide_rec(f->son[1], q, &p1, &r1, OneTree, ZeroTree);
    *p = create_node(p0, p1, f->level);
    *r = create_node(r0, r1, f->level);
  }
}

tree
tree::tree_prepare_divide(tree &q)
{
  int
    i;
  tree
    res(level_no + 1);
  
  for(i = 1;
      i < level_no && i < q.level_no &&
      polarity[i] == q.polarity[i];
      i++);

  if(i < level_no && i < q.level_no) { // Polaritaeten nicht kompatibel
    logprintf(ERROR_MSG,
	      "tree::tree_prepare_divide(): polarities don't match.\n");
    res.reset_level_no(0);
    res.root = 0;
  }
  else {
    for(i = 1; i <= level_no; i++)
      res.polarity[i] = polarity[i];
    res.polarity[i] = '+';
  }

  return res;
}

/* Erzeugt einen Baum, der sich von `node' dadurch unterscheidet, dass
   alle Mpty- und Leaf-Blaetter vertauscht wurden. */
treenode *
tree::tree_invert(treenode *node)
{
  if (node == Leaf)
    return Mpty;
  else if (node == Mpty)
    return Leaf;
  else
    return create_node(tree_invert(node->son[0]),
		       tree_invert(node->son[1]),
		       node->level);
}


/*=================================================
  Hier entsteht
                 DAS NEUE TREE_ORDERTRANS    
  Entwurf und
  Ausfuehrung:
                 Bulli
  Bauherren:
                 Ernie und Udo
*/	    

#define EXCHANGE_LEVELS_CACHE
treenode *
tree::tree_exchange_levels(treenode *tn, unsigned long ex_lev)
{
  static tn_ptr
    *cached_res;
  static treenode
    *res;

  if(tn->level < ex_lev - 1) // 3. Fall
    // Beide zu tauschenden Ebenen wurden uebersprungen. D.h. der Baum
    // aendert sich durch die Vertauschung nicht.
    return copy_node(tn);
  else if(tn->level == ex_lev) {
    // Der Baum hat einen Knoten auf der oberen der zu tauschenden Ebenen.
    // Sie muss mit der darunterliegenden Ebene Vertauscht werden.
    // Dazu wird hier weiter Fallunterschieden:
    if(tn->son[0]->level < ex_lev - 1 &&
       tn->son[1]->level < ex_lev - 1) { // 1. Fall
      // In beiden Sohnbaeumen wird die untere Tauschebene uebersprungen.
      // Deshalb verschieben sich die uebersprungenen Knoten der Sohnbaeume
      // um eine Ebene nach oben. 
#ifdef EXCHANGE_LEVELS_CACHE
      if(cached_res = exchange_levels_cache.get(tn_ptr(tn)))
	return copy_node(cached_res->node);
#endif
      res = create_node(copy_node(tn->son[0]),
			copy_node(tn->son[1]),
			tn->level - 1);
    }
    else if(tn->son[0]->level < ex_lev - 1) {
      // Im linken Sohnbaum wird die untere Tauschebene uebersprungen.
      if(tn->son[0] == tn->son[1]->son[0])
	return copy_node(tn);
      else {
#ifdef EXCHANGE_LEVELS_CACHE
	if(cached_res = exchange_levels_cache.get(tn_ptr(tn)))
	  return copy_node(cached_res->node);
#endif
	res =
	  create_node(create_node(copy_node(tn->son[0]),
				  copy_node(tn->son[1]->son[0]),
				  ex_lev - 1),
		      create_node(copy_node(tn->son[0]),
				  copy_node(tn->son[1]->son[1]),
				  ex_lev - 1),
		      ex_lev);
      }
    }
    else if(tn->son[1]->level < ex_lev - 1) {
      // Im rechten Sohnbaum wird die untere Tauschebene uebersprungen.
      if(tn->son[1] == tn->son[0]->son[1])
	return copy_node(tn);
      else {
#ifdef EXCHANGE_LEVELS_CACHE
	if(cached_res = exchange_levels_cache.get(tn_ptr(tn)))
	  return copy_node(cached_res->node);
#endif
	res =
	  create_node(create_node(copy_node(tn->son[0]->son[0]),
				  copy_node(tn->son[1]),
				  ex_lev - 1),
		      create_node(copy_node(tn->son[0]->son[1]),
				  copy_node(tn->son[1]),
				  ex_lev - 1),
		      ex_lev);
      }
    }
    else {
      // Auf beiden Tauschebenen sind Knoten vorhanden (alle 3 also).
      if(tn->son[0]->son[1] == tn->son[1]->son[0])
	return copy_node(tn);
      else {
#ifdef EXCHANGE_LEVELS_CACHE
	if(cached_res = exchange_levels_cache.get(tn_ptr(tn)))
	  return copy_node(cached_res->node);
#endif
	res =
	  create_node(create_node(copy_node(tn->son[0]->son[0]),
				  copy_node(tn->son[1]->son[0]),
				  ex_lev - 1),
		      create_node(copy_node(tn->son[0]->son[1]),
				  copy_node(tn->son[1]->son[1]),
				  ex_lev - 1),
		      ex_lev);
      }
    }
  }
  else if(tn->level == ex_lev - 1) { // 2. Fall
#ifdef EXCHANGE_LEVELS_CACHE
    if(cached_res = exchange_levels_cache.get(tn_ptr(tn)))
      return copy_node(cached_res->node);
#endif
    res =
      create_node(copy_node(tn->son[0]),
		  copy_node(tn->son[1]),
		  tn->level + 1);
  }
  else {
#ifdef EXCHANGE_LEVELS_CACHE
    if(cached_res = exchange_levels_cache.get(tn_ptr(tn)))
      return copy_node(cached_res->node);
#endif
    res =
      create_node(tree_exchange_levels(tn->son[0], ex_lev),
		  tree_exchange_levels(tn->son[1], ex_lev),
		  tn->level);
  }
  
#ifdef EXCHANGE_LEVELS_CACHE
  IF_MULTIPLE_USED(tn)
    exchange_levels_cache.insert(tn_ptr(res), tn_ptr(tn));
#endif
  return res;
}
/*==================================================*/

/* Gibt die Schnittmenge der Pfade der beiden Baeume wieder. */
#define INTERSECT_CACHE
treenode *
tree::tree_intersect(treenode *in1, treenode *in2)
{
  static tn_ptr
    *cached_res;
  static treenode
    *res;

  if(in1 == Mpty || in2 == Mpty)
    return Mpty;
  else if(in1 == in2)
    return copy_node(in1);
#ifdef INTERSECT_CACHE
  else if(cached_res = intersect_cache.get(tn_ptr_pair(in1, in2)))
    return copy_node(cached_res->node);
#endif
  else if(in1->level == in2->level)
    res = create_node(tree_intersect(in1->son[0], in2->son[0]),
		      tree_intersect(in1->son[1], in2->son[1]),
		      in1->level);
  else if(in1->level > in2->level)
    res = create_node(tree_intersect(in1->son[0], in2),
		      tree_intersect(in1->son[1], in2),
		      in1->level);
  else
    res = create_node(tree_intersect(in1, in2->son[0]),
		      tree_intersect(in1, in2->son[1]),
		      in2->level);

#ifdef INTERSECT_CACHE
  IF_MULTIPLE_USED2(in1, in2)
    intersect_cache.insert(tn_ptr(res), tn_ptr_pair(in1, in2));
#endif
  return res;
}

/* Verknuepft die durch in1 und in2 gegebenen Pfadmengen so: */
/* nur Pfade, die in MINDESTENS EINER der beiden Pfadmengen vorkommen */
/* werden im Ergebnis stehen. */
#define UNION_CACHE
treenode *
tree::tree_union(treenode *in1, treenode *in2)
{
static tn_ptr
  *cached_res;
static treenode
  *res;

  if(in1 == in2 || in2 == Mpty)
    return copy_node(in1);
  else if(in1 == Mpty)
    return copy_node(in2);
#ifdef UNION_CACHE
  else if(cached_res = union_cache.get(tn_ptr_pair(in1, in2)))
    return copy_node(cached_res->node);
#endif
  else if(in1->level == in2->level)
    res = create_node(tree_union(in1->son[0], in2->son[0]),
		      tree_union(in1->son[1], in2->son[1]),
		      in1->level);
  else if(in1->level > in2->level)
    res = create_node(tree_union(in1->son[0], in2),
		      tree_union(in1->son[1], in2),
		      in1->level);
  else
    res = create_node(tree_union(in1, in2->son[0]),
		      tree_union(in1, in2->son[1]),
		      in2->level);

#ifdef UNION_CACHE
  IF_MULTIPLE_USED2(in1, in2)
    union_cache.insert(tn_ptr(res), tn_ptr_pair(in1, in2));
#endif
  return res;
}

/* Verknuepft die durch in1 und in2 gegebenen Pfadmengen so: */
/* nur Pfade, die in GENAU EINER der beiden Pfadmengen vorkommen */
/* werden im Ergebnis stehen. */
#define XUNION_CACHE
treenode *
tree::tree_xunion(treenode *in1, treenode *in2)
{
static tn_ptr
  *cached_res;
static treenode
  *res;

  if(in1 == in2)
    return Mpty;
  else if(in1 == Mpty)
    return copy_node(in2);
  else if(in2 == Mpty)
    return copy_node(in1);
#ifdef XUNION_CACHE
  else if(cached_res = xunion_cache.get(tn_ptr_pair(in1, in2)))
    return copy_node(cached_res->node);
#endif
  else if(in1->level == in2->level)
    res = create_node(tree_xunion(in1->son[0], in2->son[0]),
		      tree_xunion(in1->son[1], in2->son[1]),
		      in1->level);
  else if(in1->level > in2->level)
    res = create_node(tree_xunion(in1->son[0], in2),
		      tree_xunion(in1->son[1], in2),
		      in1->level);
  else
    res = create_node(tree_xunion(in1, in2->son[0]),
		      tree_xunion(in1, in2->son[1]),
		      in2->level);

#ifdef XUNION_CACHE
  IF_MULTIPLE_USED2(in1, in2)
    xunion_cache.insert(tn_ptr(res), tn_ptr_pair(in1, in2));		
#endif
  return res;
}

/* Fuegt in eine Pfadmenge den Nullpfad ein, wenn er noch nicht drin ist */
/* und entfernt ihn, wenn er schon drin ist. */
#define FLIP_ZEROPATH_CACHE
treenode *
tree::tree_flip_zeropath(treenode *in, unsigned long level)
{
static tn_ptr
  *cached_res;
treenode
  *res;

  if(level == 0)
    return (in == Leaf) ? Mpty : Leaf;
#ifdef FLIP_ZEROPATH_CACHE
  else if(cached_res = flip_zeropath_cache.get(tn_ptr_int(in, level)))
    return copy_node(cached_res->node);
#endif
  else if(in->level < level)
    res = create_node(tree_flip_zeropath(in, level - 1),
		      copy_node(in),
		      level);
  else
    res = create_node(tree_flip_zeropath(in->son[0], level - 1),
		      copy_node(in->son[1]),
		      level);

#ifdef FLIP_ZEROPATH_CACHE
  IF_MULTIPLE_USED(in)
    flip_zeropath_cache.insert(tn_ptr(res), tn_ptr_int(in, level));
#endif
  return res;
}

/* Verknuepft die Pfadmengen, die durch in1 und in2 gegeben sind so: */
/* 1) Bilde das Kreuzprodukt. */
/* 2) sei (p1, p2) ein Element des Kreuzprodukts (p(i) ist aus der */
/*    Pfadmenge in(i)): */
/*    Im Ergebnis steht dann die Ueberlagerung von p1 und p2 genau dann, */
/*    wenn (p1, p2) ungeradzahlig oft im Kreuzprodukt vorkommt. */
/* = FDD-AND bzw. EDD-OR */
#define CROSSMERGE_CACHE

#define NEW_TREE_CROSSMERGE
//#define SLOWER_CROSSMERGE
//#define SLOWEST_CROSSMERGE

#ifdef NEW_TREE_CROSSMERGE
treenode *
tree::tree_crossmerge(treenode *f, treenode *g)
{
  static tn_ptr
    *cached_res;
  treenode
    // nn = NewNode :)
    *nn, *nn1, *nn2, *nn3;

  if(f == Mpty || g == Mpty) {
    //hi_guys("1. a b & 0, 0 & a b, 0 & 0");
    return (Mpty);
  }
  else if(f == g || g == zeropaths[f->level]) {
    //hi_guys("2. a b & a b, a b & 1");
    return copy_node(f);
  }
  else if(f == zeropaths[g->level]) {
    //hi_guys("2b. 1 & a b");
    return copy_node(g);
  }
#ifdef CROSSMERGE_CACHE
  else if(cached_res = crossmerge_cache.get(tn_ptr_pair(f, g)))
    return copy_node(cached_res->node);
#endif
  else if(f->level == g->level) {
    if(f->son[1] == g->son[1]) {
      //hi_guys("3. a b & c b");
      nn1 = tree_flip_zeropath(f->son[0], f->level - 1); // not a
      nn2 = tree_xunion(nn1, g->son[0]);
      tree_empty(nn1);
      nn  = create_node(tree_crossmerge(f->son[0], g->son[0]),
			tree_crossmerge(f->son[1], nn2),
			f->level);
      tree_empty(nn2);
    }
    /*
    else if(f->son[0] == g->son[0]) {
      //hi_guys("4. a b & a c");
      // Dieser Sonderfall wird im tree_crossmerge Rekursivaufruf abgedeckt.
      nn1 = tree_xunion(g->son[0], g->son[1]);
      nn2 = tree_crossmerge(f->son[1], nn1);
      tree_empty(nn1);
      nn3 = tree_crossmerge(f->son[0], g->son[1]);
      nn  = create_node(copy_node(f->son[0]),
			tree_xunion(nn2, nn3),
			f->level);
      tree_empty(nn2);
      tree_empty(nn3);
    }
    */
    else if(f->son[0] == g->son[1]) {
      if(f->son[1] == g->son[0]) {
	//hi_guys("5. a b & b a");
	nn1 = tree_crossmerge(f->son[0], f->son[1]);
	nn2 = tree_xunion(nn1, f->son[0]);
	nn  = create_node(nn1, tree_xunion(nn2, f->son[1]), f->level);
	tree_empty(nn2);
      }
      else {
	//hi_guys("6. a b & c a");
	nn1 = tree_xunion(g->son[0], g->son[1]);
	nn2 = tree_crossmerge(f->son[1], nn1);
	tree_empty(nn1);
	nn  = create_node(tree_crossmerge(f->son[0], g->son[0]),
			  tree_xunion(f->son[0], nn2),
			  f->level);
	tree_empty(nn2);
      }
    }
    else if(f->son[1] == g->son[0]) {
      //hi_guys("7. a b & b c");
      nn1 = tree_xunion(f->son[0], f->son[1]);
      nn2 = tree_crossmerge(g->son[1], nn1);
      tree_empty(nn1);
      nn  = create_node(tree_crossmerge(f->son[0], g->son[0]),
			tree_xunion(nn2, g->son[0]),
			f->level);
      tree_empty(nn2);
    }
    else {
      //hi_guys("a b & c d");
      nn1 = tree_xunion(g->son[0], g->son[1]);
      nn2 = tree_crossmerge(f->son[1], nn1);
      tree_empty(nn1);
      nn3 = tree_crossmerge(f->son[0], g->son[1]);
      nn  = create_node(tree_crossmerge(f->son[0], g->son[0]),
			tree_xunion(nn2, nn3),
			f->level);
      tree_empty(nn2);
      tree_empty(nn3);
    }
  }
  else if(f->level > g->level) {
    //hi_guys("8. a b & c c");
    return tree_crossmerge(f->son[0], g);
  }
  else {
    //hi_guys("9. a a & b c");
    return tree_crossmerge(f, g->son[0]);
  }

#ifdef CROSSMERGE_CACHE
  crossmerge_cache.insert(tn_ptr(nn), tn_ptr_pair(f, g));
#endif
  
  return nn;
}
#elif defined SLOWER_CROSSMERGE
treenode *
tree::tree_crossmerge(treenode *f, treenode *g)
{
  static tn_ptr
    *cached_res;
  treenode
    // nn = NewNode :)
    *nn, *nn1, *nn2, *nn3;

  if(f == Mpty || g == Mpty) {
    //hi_guys("1. a b & 0, 0 & a b, 0 & 0");
    return (Mpty);
  }
  else if(f == g || g == zeropaths[f->level]) {
    //hi_guys("2. a b & a b, a b & 1");
    return copy_node(f);
  }
  else if(f == zeropaths[g->level]) {
    //hi_guys("2b. 1 & a b");
    return copy_node(g);
  }
#ifdef CROSSMERGE_CACHE
  else if(cached_res = crossmerge_cache.get(tn_ptr_pair(f, g)))
    return copy_node(cached_res->node);
#endif
  else if(f->level == g->level) {
    //hi_guys("a b & c d");
    nn1 = tree_xunion(g->son[0], g->son[1]);
    nn2 = tree_crossmerge(f->son[1], nn1);
    tree_empty(nn1);
    nn3 = tree_crossmerge(f->son[0], g->son[1]);
    nn  = create_node(tree_crossmerge(f->son[0], g->son[0]),
		      tree_xunion(nn2, nn3),
		      f->level);
    tree_empty(nn2);
    tree_empty(nn3);
  }
  else if(f->level > g->level) {
    //hi_guys("8. a b & c c");
    return tree_crossmerge(f->son[0], g);
  }
  else {
    //hi_guys("9. a a & b c");
    return tree_crossmerge(f, g->son[0]);
  }

#ifdef CROSSMERGE_CACHE
  crossmerge_cache.insert(tn_ptr(nn), tn_ptr_pair(f, g));
#endif
  
  return nn;
}
#elif defined SLOWEST_CROSSMERGE
treenode *
tree::tree_crossmerge(treenode *f, treenode *g)
{
  static tn_ptr
    *cached_res;
  treenode
    // nn = NewNode :)
    *nn, *nn1, *nn2, *nn3;

  if(f == Mpty || g == Mpty) {
    //hi_guys("1. a b & 0, 0 & a b, 0 & 0");
    return (Mpty);
  }
  else if(f == g || g == zeropaths[f->level]) {
    //hi_guys("2. a b & a b, a b & 1");
    return copy_node(f);
  }
  else if(f == zeropaths[g->level]) {
    //hi_guys("2b. 1 & a b");
    return copy_node(g);
  }
#ifdef CROSSMERGE_CACHE
  else if(cached_res = crossmerge_cache.get(tn_ptr_pair(f, g)))
    return copy_node(cached_res->node);
#endif
  else if(f->level == g->level) {
    //hi_guys("a b & c d");
    nn1 = tree_crossmerge(f->son[0], g->son[1]);
    nn2 = tree_crossmerge(f->son[1], g->son[0]);
    nn3 = tree_xunion(nn1, nn2);
    tree_empty(nn1);
    tree_empty(nn2);
    nn1 = tree_crossmerge(f->son[1], g->son[1]);
    nn  = create_node(tree_crossmerge(f->son[0], g->son[0]),
		      tree_xunion(nn1, nn3),
		      f->level);
    tree_empty(nn1);
    tree_empty(nn3);
  }
  else if(f->level > g->level) {
    //hi_guys("8. a b & c c");
    return tree_crossmerge(f->son[0], g);
  }
  else {
    //hi_guys("9. a a & b c");
    return tree_crossmerge(f, g->son[0]);
  }

#ifdef CROSSMERGE_CACHE
  crossmerge_cache.insert(tn_ptr(nn), tn_ptr_pair(f, g));
#endif
  
  return nn;
}
#else
treenode *
tree::tree_crossmerge(treenode *in1, treenode *in2)
{
static tn_ptr
  *cached_res;
treenode
  *new_node,
  *new_node01,
  *new_node10,
  *new_node11,
  *aux_node;

  if(in1 == Mpty || in2 == Mpty) {
    // hi_guys("a b & 0, 0 & a b, 0 & 0");
    return (Mpty);
  }
  else if(in1 == in2) {
    // hi_guys("a a & a a");
    return copy_node(in1);
  }
#ifdef CROSSMERGE_CACHE
  else if(cached_res = crossmerge_cache.get(tn_ptr_pair(in1, in2)))
    return copy_node(cached_res->node);
#endif
  else if(in1->level == in2->level) {
    if(in1->son[1] == in2->son[1]) {
      // hi_guys("a b & c b");
      new_node11 = tree_flip_zeropath(in1->son[0], in1->level - 1); // not a
      new_node01 = tree_crossmerge(new_node11, in1->son[1]);
      new_node10 = tree_crossmerge(in1->son[1], in2->son[0]);
      new_node = create_node(tree_crossmerge(in1->son[0], in2->son[0]),
                             tree_xunion(new_node01, new_node10), in1->level);
      tree_empty(new_node01);
      tree_empty(new_node10);
      tree_empty(new_node11);
    }
    else if(in1->son[0] == in2->son[0]) {
      // hi_guys("a b & a c");
      new_node01 = tree_crossmerge(in1->son[0], in2->son[1]);
      new_node10 = tree_crossmerge(in1->son[1], in2->son[0]);
      new_node11 = tree_crossmerge(in1->son[1], in2->son[1]);
      aux_node = tree_xunion(new_node01, new_node10);
      new_node = create_node(copy_node(in1->son[0]),
                             tree_xunion(aux_node, new_node11), in1->level);
      tree_empty(new_node01);
      tree_empty(new_node10);
      tree_empty(new_node11);
      tree_empty(aux_node);
    }
    else if(in1->son[0] == in2->son[1] && in1->son[1] == in2->son[0]) {
      // hi_guys("a b & b a");
      new_node11 = tree_crossmerge(in1->son[0], in1->son[1]);
      aux_node   = tree_xunion(new_node11, in1->son[0]);
      new_node   = create_node(new_node11,
			       tree_xunion(aux_node, in1->son[1]),
			       in1->level);
      tree_empty(aux_node);
    }
    else if(in1->son[0] == in2->son[1]) {
      // hi_guys("a b & c a");
      new_node11 = tree_flip_zeropath(in1->son[1], in1->level - 1); //not b
      new_node01 = tree_crossmerge(new_node11, in1->son[0]);
      new_node10 = tree_crossmerge(in1->son[1], in2->son[0]);
      new_node = create_node(tree_crossmerge(in1->son[0], in2->son[0]),
                             tree_xunion(new_node01, new_node10), in1->level);
      tree_empty(new_node01);
      tree_empty(new_node10);
      tree_empty(new_node11);
    }
    else if(in1->son[1] == in2->son[0]) {
      // hi_guys("a b & b c");
      new_node11 = tree_flip_zeropath(in2->son[1], in2->level - 1); //not c
      new_node01 = tree_crossmerge(new_node11, in1->son[1]);
      new_node10 = tree_crossmerge(in1->son[0], in2->son[1]);
      new_node = create_node(tree_crossmerge(in1->son[0], in2->son[0]),
                             tree_xunion(new_node01, new_node10), in1->level);
      tree_empty(new_node01);
      tree_empty(new_node10);
      tree_empty(new_node11);
    }
    else {
      // hi_guys("a b & c d");
      new_node01 = tree_crossmerge(in1->son[0], in2->son[1]);
      new_node10 = tree_crossmerge(in1->son[1], in2->son[0]);
      new_node11 = tree_crossmerge(in1->son[1], in2->son[1]);
      aux_node = tree_xunion(new_node01, new_node10);
      new_node = create_node(tree_crossmerge(in1->son[0], in2->son[0]),
                             tree_xunion(aux_node, new_node11), in1->level);
      tree_empty(new_node01);
      tree_empty(new_node10);
      tree_empty(new_node11);
      tree_empty(aux_node);
    }
  }
  else if(in1->level > in2->level) {
    //hi_guys("a b & c c");
    return tree_crossmerge(in1->son[0], in2);
  }
  else {
    //hi_guys("a a & b c");
    return tree_crossmerge(in1, in2->son[0]);
  }

#ifdef CROSSMERGE_CACHE
  crossmerge_cache.insert(tn_ptr(new_node), tn_ptr_pair(in1, in2));
#endif
  return(new_node);
}
#endif

/* Liefert die Pfadmenge, die all die Pfade P von tn enthaelt, */
/* bei denen Ebene lev in P nicht gesetzt ist. */
#define FILTER_PATHS_CACHE
treenode *
tree::tree_filter_paths(treenode *tn, unsigned long lev)
{
static tn_ptr
  *cached_res;
treenode
  *res;

  if(tn == Mpty)
    return Mpty;
#ifdef FILTER_PATHS_CACHE
  else if(cached_res = filter_paths_cache.get(tn_ptr_int(tn, lev)))
    return copy_node(cached_res->node);
#endif
  else if(tn->level > lev)
    res = create_node(tree_filter_paths(tn->son[0], lev),
		      tree_filter_paths(tn->son[1], lev),
		      tn->level);
  else if(tn->level == lev)
    res = create_node(copy_node(tn->son[0]), Mpty, lev);
  else /* if(tn->level < lev) */ {
    // In diesem Fall sind wir ueber Dontcare(s) an unserer Ebene
    // lev vorbeigesprungen.
    res = create_node(copy_node(tn), Mpty, lev);
  }
#ifdef FILTER_PATHS_CACHE
  IF_MULTIPLE_USED(tn)
    filter_paths_cache.insert(tn_ptr(res), tn_ptr_int(tn, lev));
#endif
  return res;
}

/* Nimm die Pfadmenge und setze jeden Pfad auf Ebene lev = 0. */
/* Streiche alle Pfade, die jetzt geradzahlig oft vorkommen. */
/* Gib den so erhaltenen Baum zurueck! */
#define FILTER_LEVEL_CACHE
treenode *
tree::tree_filter_level(treenode *tn, unsigned long lev)
{
static tn_ptr
  *cached_res;
treenode
  *res;

  if(tn->level < lev)
    // In diesem Fall sind wir ueber Dontcare(s) an unserer Ebene
    // lev vorbeigesprungen. Deshalb sind alle Pfade doppelt
    // vorhanden.
    return Mpty;
#ifdef FILTER_LEVEL_CACHE
  else if(cached_res = filter_level_cache.get(tn_ptr_int(tn, lev)))
    return copy_node(cached_res->node);
#endif
  else if(tn->level > lev)
    res = create_node(tree_filter_level(tn->son[0], lev),
		      tree_filter_level(tn->son[1], lev),
		      tn->level);
  else // if(tn->level == lev)
    res = create_node(tree_xunion(tn->son[0], tn->son[1]),
		      Mpty, tn->level);

#ifdef FILTER_LEVEL_CACHE
  IF_MULTIPLE_USED(tn)
    filter_level_cache.insert(tn_ptr(res), tn_ptr_int(tn, lev));
#endif
  return res;
}

#define CUT_LITERAL_PATHS_CACHE
treenode *
tree::tree_cut_literal_paths(treenode *node, unsigned long lits[])
{
  static tn_ptr
    *cached_res;
  
  if(node->level == 0)
    return Mpty;
#ifdef CUT_LITERAL_PATHS_CACHE
  else if(cached_res = cut_literal_paths_cache.get(tn_ptr(node)))
    return copy_node(cached_res->node);
#endif
  else {
    treenode *path_zero, *path_one, *path_dc, *res1, *res;
    tree_spread(node->son[0], node->son[1], &path_zero, &path_dc, &path_one);
    if(lits[node->level])
      res1 = create_node(path_zero, path_one, node->level);
    else {
      res1 = create_node(tree_cut_literal_paths(path_zero, lits),
			 tree_cut_literal_paths(path_one, lits),
			 node->level);
      tree_empty(path_one);
      tree_empty(path_zero);
    }
    
    res = tree_union(res1, tree_cut_literal_paths(path_dc, lits));

    tree_empty(res1);
    tree_empty(path_dc);
    
#ifdef CUT_LITERAL_PATHS_CACHE
    IF_MULTIPLE_USED(node)
      cut_literal_paths_cache.insert(tn_ptr(res), tn_ptr(node));
#endif
    return res;
  }
}

treenode *
tree::tree_cut_literal_paths(treenode *node, unsigned long lit)
{
  static tn_ptr
    *cached_res;
  treenode
    *res;
  
  if(node->level < lit)
    return Mpty;
#ifdef CUT_LITERAL_PATHS_CACHE
  else if(cached_res = cut_literal_paths_cache.get(tn_ptr(node)))
    return copy_node(cached_res->node);
#endif
  else if(node->level == lit) {
    treenode *res1, *res0;
    res  = tree_intersect(node->son[0], node->son[1]);
    res0 = tree_invert(res);
    tree_empty(res);
    res  = res0;
    res0 = tree_intersect(res, node->son[0]);
    res1 = tree_intersect(res, node->son[1]);
    tree_empty(res);
    res  = create_node(res0, res1, node->level);
  }
  else
    res = create_node(tree_cut_literal_paths(node->son[0], lit),
		      tree_cut_literal_paths(node->son[1], lit),
		      node->level);
  
#ifdef CUT_LITERAL_PATHS_CACHE
  IF_MULTIPLE_USED(node)
    cut_literal_paths_cache.insert(tn_ptr(res), tn_ptr(node));
#endif
  return res;
}

#define CUT_DC_PATHS_CACHE
treenode *
tree::tree_cut_dc_paths(treenode *node, unsigned long lit)
{
  static tn_ptr
    *cached_res;
  treenode
    *res;
  
  if(node->level < lit)
    return copy_node(node);
#ifdef CUT_DC_PATHS_CACHE
  else if(cached_res = cut_dc_paths_cache.get(tn_ptr(node)))
    return copy_node(cached_res->node);
#endif
  else if(node->level == lit)
    res = tree_intersect(node->son[0], node->son[1]);
  else
    res = create_node(tree_cut_dc_paths(node->son[0], lit),
		      tree_cut_dc_paths(node->son[1], lit),
		      node->level);
  
#ifdef CUT_DC_PATHS_CACHE
  IF_MULTIPLE_USED(node)
    cut_dc_paths_cache.insert(tn_ptr(res), tn_ptr(node));
#endif
  return res;
}

/* Reed-Muller-Transformation:
  1 1
  0 -
  - 0
*/
#define FLIP_0DC_CACHE
treenode *
tree::tree_flip_0dc(treenode *tn, unsigned long lev)
{
static tn_ptr
  *cached_res;
treenode
  *res;
treenode
  *new_son0, *new_son1;

  if(tn == Mpty || lev == 0)
    return tn;
#ifdef FLIP_0DC_CACHE
  else if(cached_res = flip_0dc_cache.get(tn_ptr_int(tn, lev)))
    return copy_node(cached_res->node);
#endif
  else if(tn->level < lev)
    res = create_node(tree_flip_0dc(tn, lev - 1), Mpty, lev);
  else {
    new_son0 = tree_flip_0dc(tn->son[0], lev - 1);
    new_son1 = tree_flip_0dc(tn->son[1], lev - 1);
    res	     = create_node(new_son0, tree_xunion(new_son0, new_son1), lev);
    tree_empty(new_son1);
  }
#ifdef FLIP_0DC_CACHE
  IF_MULTIPLE_USED(tn)
  flip_0dc_cache.insert(tn_ptr(res), tn_ptr_int(tn, lev));
#endif
  return res;
}

/* Transformation:
  1 -
  - 1
  0 0
*/
#define FLIP_1DC_CACHE
treenode *
tree::tree_flip_1dc(treenode *tn, unsigned long lev)
{
static tn_ptr
  *cached_res;
treenode
  *res;
treenode
  *new_son0, *new_son1;

  if(tn == Mpty || lev == 0)
    return tn;
#ifdef FLIP_1DC_CACHE
  else if(cached_res = flip_1dc_cache.get(tn_ptr_int(tn, lev)))
    return copy_node(cached_res->node);
#endif
  else if(tn->level < lev)
    res = create_node(Mpty, tree_flip_1dc(tn, lev - 1), lev);
  else {
    new_son0 = tree_flip_1dc(tn->son[0], lev - 1);
    new_son1 = tree_flip_1dc(tn->son[1], lev - 1);
    res      = create_node(tree_xunion(new_son1, new_son0), new_son1, lev);
    tree_empty(new_son0);
  }

#ifdef FLIP_1DC_CACHE
  IF_MULTIPLE_USED(tn)
    flip_1dc_cache.insert(tn_ptr(res), tn_ptr_int(tn, lev));
#endif
  return res;
}

/* Transformation:
Falls chng_pol[i] == '*' transformiere an der stelle [i]:
  1 -
  - 1
  0 0
sonst keine transformation.
*/
#define SEL_FLIP_1DC_CACHE
treenode *
tree::tree_sel_flip_1dc(treenode *tn, char *chng_pol,
			unsigned long lev, unsigned long min_lev)
{
static tn_ptr
  *cached_res;
treenode
  *res;
treenode
  *new_son0, *new_son1;

  if(tn == Mpty || lev == 0)
    return tn;
  else if(lev < min_lev)
    return copy_node(tn);
#ifdef SEL_FLIP_1DC_CACHE
  else if(cached_res = sel_flip_1dc_cache.get(tn_ptr_int(tn, lev)))
    return copy_node(cached_res->node);
#endif
  else if(chng_pol[lev] == '=') {
    if(tn->level < lev)
      res = tree_sel_flip_1dc(tn, chng_pol, lev - 1, min_lev);
    else
      res = create_node(
		tree_sel_flip_1dc(tn->son[0], chng_pol, lev-1, min_lev),
                tree_sel_flip_1dc(tn->son[1], chng_pol, lev-1, min_lev),
                lev);
  }
  else /* if(chng_pol[lev] == '*') */ {
    if(tn->level < lev)
      res = create_node(Mpty,
                         tree_sel_flip_1dc(tn, chng_pol, lev - 1, min_lev),
                         lev);
    else {
      new_son0 = tree_sel_flip_1dc(tn->son[0], chng_pol, lev - 1, min_lev);
      new_son1 = tree_sel_flip_1dc(tn->son[1], chng_pol, lev - 1, min_lev);
      res      = create_node(tree_xunion(new_son1, new_son0), new_son1, lev);
      tree_empty(new_son0);
    }
  }
#ifdef SEL_FLIP_1DC_CACHE
  IF_MULTIPLE_USED(tn)
    sel_flip_1dc_cache.insert(tn_ptr(res), tn_ptr_int(tn, lev));
#endif
  return res;
}

#define FLIP_01_ATLEVEL_CACHE
treenode *
tree::tree_flip_01_atlevel(treenode *node, unsigned long lev)
{
static tn_ptr
  *cached_res;
treenode
  *res;

  if(node->level < lev)
    return copy_node(node);
#ifdef FLIP_01_ATLEVEL_CACHE
  else if(cached_res = flip_01_atlevel_cache.get(tn_ptr(node)))
    return copy_node(cached_res->node);
#endif
  else if(node->level == lev)
    res = create_node(tree_flip_01_atlevel(node->son[1], lev),
		      tree_flip_01_atlevel(node->son[0], lev),
		      node->level);
  else
    res = create_node(tree_flip_01_atlevel(node->son[0], lev),
		      tree_flip_01_atlevel(node->son[1], lev),
		      node->level);
#ifdef FLIP_01_ATLEVEL_CACHE
  IF_MULTIPLE_USED(node)
    flip_01_atlevel_cache.insert(tn_ptr(res), tn_ptr(node));
#endif
  return res;
}

#define FLIP_1DC_ATLEVEL_CACHE
treenode *
tree::tree_flip_1dc_atlevel(treenode *tn, unsigned long lev)
{
  static tn_ptr
    *cached_res;
  treenode
    *res;

  if(tn == Mpty)
    return tn;
#ifdef FLIP_1DC_ATLEVEL_CACHE
  else if(cached_res = flip_1dc_atlevel_cache.get(tn_ptr(tn)))
    return copy_node(cached_res->node);
#endif
  else if(tn->level > lev)
    res = create_node(tree_flip_1dc_atlevel(tn->son[0], lev),
		      tree_flip_1dc_atlevel(tn->son[1], lev),
		      tn->level);
  else if(tn->level == lev)
    res = create_node(tree_xunion(tn->son[0], tn->son[1]),
		      copy_node(tn->son[1]),
		      lev);
  else // (tn->level < lev)
    res = create_node(Mpty, copy_node(tn), lev);

#ifdef FLIP_1DC_ATLEVEL_CACHE
  IF_MULTIPLE_USED(tn)
    flip_1dc_atlevel_cache.insert(tn_ptr(res), tn_ptr(tn));
#endif
  return res;
}

#define SEL_FLIP_01_CACHE
treenode *
tree::tree_sel_flip_01(treenode *tn, char *chng_pol,
		       unsigned long min_lev)
{
static tn_ptr
  *cached_res;
treenode
  *res;

  if(tn->level < min_lev)
    return copy_node(tn);
#ifdef SEL_FLIP_01_CACHE
  else if(cached_res = sel_flip_01_cache.get(tn_ptr(tn)))
    return copy_node(cached_res->node);
#endif
  else if(chng_pol[tn->level] == '=')
    res = create_node(tree_sel_flip_01(tn->son[0], chng_pol, min_lev),
	              tree_sel_flip_01(tn->son[1], chng_pol, min_lev),
	              tn->level);
  else /* if(chng_pol[tn->level] == '*') */
    res = create_node(tree_sel_flip_01(tn->son[1], chng_pol, min_lev),
	              tree_sel_flip_01(tn->son[0], chng_pol, min_lev),
	              tn->level);

#ifdef SEL_FLIP_01_CACHE
  IF_MULTIPLE_USED(tn)
    sel_flip_01_cache.insert(tn_ptr(res), tn_ptr(tn));
#endif
  return res;
}

void
tree::tree_soft_reset_flag(treenode *node)
{
  if(++tree::flag_threshold > (1 << 14) - 1) {
    tree_reset_flag(node);
    tree::flag_threshold = 1;
  }
}

/* Setzt die Flags aller Baumknoten ab Knoten node auf 0 */
void
tree::tree_reset_flag(treenode *node)
{
  if(node->level == 0)
    return;

  node->flag = 0;

  tree_reset_flag(node->son[0]);
  tree_reset_flag(node->son[1]);
}

void
global_soft_reset_flag()
{
  if(++tree::flag_threshold > (1 << 14) - 1) {
    global_reset_flag();
    tree::flag_threshold = 1;
  }
}

void
global_reset_flag()
{
  treenode
    *node;
  sim_grp
    *sim_list;
  int
    i;
  
  for(node = tree::nodes_not_sim; node; node = node->next)
    node->flag = 0;

  for(i = 1; i <= tree::MaxLevel; i++) {
    for(node = tree::leaf_sim_group[i]; node; node = node->next)
      node->flag = 0;
    for(node = tree::mpty_sim_group[i]; node; node = node->next)
      node->flag = 0;
  }
  
  for(sim_list = tree::sim_groups; sim_list != 0; sim_list = sim_list->next)
    for(node = sim_list->list; node; node = node->next)
      node->flag = 0;
}

treenode *
tree::tree_dc_shrink(treenode *node,
		     unsigned long sh_arr[],
		     unsigned long *min)
{
treenode
  *res;

  if(node->level <= *min) {
    return copy_node(node);
  }
  else if(sh_arr[node->level] == 0) {
    *min = level_no + 1;
    return Mpty;
  }
  res = create_node(tree_dc_shrink(node->son[0], sh_arr, min),
		    tree_dc_shrink(node->son[1], sh_arr, min),
		    sh_arr[node->level]);
  return res;
}

treenode *
tree::tree_zero_shrink(treenode *node, unsigned long sh_arr[],
		       unsigned long *min, unsigned long lev)
{
treenode
  *res;

  if(node->level < lev && sh_arr[lev] > 0)
    return tree_zero_shrink(node, sh_arr, min, lev - 1);
  else if(node->level <= *min) {
    return copy_node(node);
  }
  else if(sh_arr[node->level] == 0 && node->son[1] != Mpty) {
    *min = level_no + 1;
    return Mpty;
  }
  else if(sh_arr[node->level] == 0)
    res = tree_zero_shrink(node->son[0], sh_arr, min, lev - 1);
  else
    res = create_node(tree_zero_shrink(node->son[0], sh_arr, min, lev - 1),
		      tree_zero_shrink(node->son[1], sh_arr, min, lev - 1),
		      sh_arr[node->level]);
  return res;
}

tree
tree::tree_shrink_prepare(char shrinkvar[],
			  unsigned long **sh_arr,
			  unsigned long *minlev)
{
  unsigned long
    i, newlev;
  tree
    retval;

  if(root == 0) {
    retval.root = 0;
    return retval;
  }

  *sh_arr = new unsigned long[level_no + 1];

  for(i = 1, newlev = 0; i <= level_no; i++)
    switch(shrinkvar[level_no - i]) {
    case '+':
      (*sh_arr)[i] = ++newlev;
      break;
    case '-':
      (*sh_arr)[i] = 0;
      break;
    default:
      retval.root = 0;
      return retval;
    }

  for(*minlev = 1;
      *minlev <= level_no && (*sh_arr)[*minlev] == *minlev;
      (*minlev)++);

  (*minlev)--;

  // logprintf(BIGSTEP_MSG, "Minimaler ok-level: %lu\n", *minlev);

  retval.reset_level_no(newlev);

  for(i = 1; i <= level_no; i++)
    if((*sh_arr)[i] > 0)
      retval.polarity[(*sh_arr)[i]] = polarity[i];

  /*
  for(i = 1; i <= level_no; i++) {
    logprintf(TRACE_MSG, "alt: %lu(%c) -> %lu", i, polarity[i], (*sh_arr)[i]);
    if(i <= newlev)
      logprintf(TRACE_MSG, ", neu: %lu(%c)\n", i, retval.polarity[i]);
    else
      logprintf(TRACE_MSG, "\n");
  }
  */
  
  return retval;
}

void
tree::tree_ordertrans(treenode *node, unsigned long *new_order,
		      treenode **new_tree)
{
  if(node == Mpty)
    return;
  if(node == Leaf) {
    treenode
      *new_path,
      *aux_tree;
    aux_tree  = *new_tree;
    new_path  = tree_make_dcpath(printline, level_no);
    *new_tree = tree_xunion(new_path, aux_tree);
    tree_clear(aux_tree);
    tree_clear(new_path);
  }
  else {
    treenode *path_zero, *path_one, *path_dc;
    tree_spread(node->son[0], node->son[1], &path_zero, &path_dc, &path_one);
    tree_ordertrans(path_dc, new_order, new_tree);
    printline[level_no - new_order[node->level]] = '0';
    tree_ordertrans(path_zero, new_order, new_tree);
    printline[level_no - new_order[node->level]] = '1';
    tree_ordertrans(path_one, new_order, new_tree);
    printline[level_no - new_order[node->level]] = '-';
    tree_empty(path_one);
    tree_empty(path_zero);
    tree_empty(path_dc);
  }
}

void
tree::add_levels_base(unsigned long levels)
{
  int
    i,
    old_levels = (int) level_no;
  char
    *newpol;

  set_glob_levels(levels + level_no);
  newpol = new char[level_no + 1];
  for(i = 1; i <= old_levels; i++)
    newpol[i] = polarity[i];
  while(i <= level_no)
    newpol[i++] = '+';
  if (old_levels > 0)
    delete [] polarity;
  polarity = newpol;
}

//==============================================================
//
//  Ab hier Funktionen und Operatoren, die public sind.
//
//==============================================================


// Fuegt einen '-', '0' oder '1' Pfad (je nach dc01) der Laenge levels
// am Ende jedes existierenden Pfades an.
void tree::addLevelsEnd (unsigned long levels, char dc01)
{
  tree ret;
  treenode *rest;
  int i;

  ret.reset_level_no (levels + level_no);
  for (i = 1; i <= level_no; i++)
    ret.polarity[i + levels] = polarity[i];

  rest = Leaf;
  switch (dc01) {
  case '0':
    for (i = 1; i <= levels; i++)
      rest = create_node (rest, Mpty, i);
    break;
  case '1':
    for (i = 1; i <= levels; i++)
      rest = create_node (Mpty, rest, i);
    break;
  default:
    break;
  }
  ret.treeCopyMove (root, ret.root, levels, rest);
  *this = ret;
}


int
tree::operator==(const tree &Tree)
{
  if(level_no == Tree.level_no &&
     root == Tree.root &&
     strncmp(polarity + 1, Tree.polarity + 1, (int) level_no) == 0)

    return 1;

  return 0;
}

tree&
tree::operator=(const tree &Tree)
{
  if(this != &Tree) {		// beware of t=t !
    if(Tree.root != 0) {
      if(level_no != Tree.level_no)
	reset_level_no(Tree.level_no, Tree.polarity);
      else {
	int i;
	clear();
	for(i = 1; i <= Tree.level_no; i++)
	  polarity[i] = Tree.polarity[i];
      }
      
      root = copy_node(Tree.root);
    }
    else {
      this->reset_level_no(0);
      root = 0;
    }
  }
  
  return *this;
}

tree
tree::orderflip_base(unsigned long flip_pos)
{
  tree
    rv(level_no);
  unsigned long
    i;
  char
    c;
  
  if(flip_pos >= level_no - 1) {
    rv.root = 0;
    return rv;
  }
    
  for(i = 1; i <= level_no; i++)
    rv.polarity[i] = polarity[i];

  flip_pos                  = level_no - flip_pos;
  c                         = rv.polarity[flip_pos];
  rv.polarity[flip_pos]     = rv.polarity[flip_pos - 1];
  rv.polarity[flip_pos - 1] = c;
  rv.root                   = tree_exchange_levels(root, flip_pos);

  // Wichtig: Cache loeschen. Sonst enthaelt er beim naechsten Aufruf von
  // tree_exchange_levels() noch Ergebnisse, die dann im allgemeinen nicht
  // mehr korrekt sind, es sei denn die `flip_pos' stimmt dann mit der
  // jetzigen ueberein.
  exchange_levels_cache.clear();

  return rv;
}

tree
tree::ordertrans_base(unsigned long new_order[],
		      unsigned long mode,
		      unsigned long path_no)
{
  tree
    retval(level_no);
  unsigned long
    *inverse_order,
    *swap_steps,
    no_swaps,
    i, j, io;
  treenode
    *r;

  no_swaps      = 0;
  swap_steps    = 0;
  inverse_order = new unsigned long[level_no + 1];

  for(i = 0; i < level_no; i++) {
    retval.polarity[level_no - new_order[i]] = polarity[level_no - i];
    printline[i] = '-';
    inverse_order[level_no - new_order[i]] = level_no - i;
  }

  if(mode != OT_PATHWISE) {
    swap_steps = new unsigned long[level_no * (level_no - 1)];
    for(i = level_no - 1; i > 0; i--)
      for(j = 1; j <= i; j++)
	if(inverse_order[j] > inverse_order[j + 1]) {
	  swap_steps[no_swaps++] = j + 1;
	  io                     = inverse_order[j];
	  inverse_order[j]       = inverse_order[j + 1];
	  inverse_order[j + 1]   = io;
	}
  }
  
  if(mode == OT_FASTEST_COUNT)
    path_no = tree_count_cubes_disj_opti(root);

  if(mode == OT_FASTEST_COUNT || mode == OT_FASTEST) {
    if(path_no > no_swaps)
      mode = OT_BUBBLE_SWAP;
    else
      mode = OT_PATHWISE;
  }

  // Falls mode == OT_FASTEST_COUNT || mode == OT_FASTEST ist, ist
  // inverse_order hier wieder zerstoert und muss neu gesetzt werden.
  if(mode == OT_PATHWISE && swap_steps)
    for(i = 0; i < level_no; i++)
      inverse_order[level_no - new_order[i]] = level_no - i;

  if(mode == OT_PATHWISE) {
    tree_ordertrans(root, inverse_order, &(retval.root));
  }
  else if(mode == OT_BUBBLE_SWAP) {
    retval.root = copy_node(root);
    for(i = 0; i < no_swaps; i++) {
      r           = retval.root;
      retval.root = tree_exchange_levels(r, swap_steps[i]);
      tree_clear(r);
      exchange_levels_cache.clear();
    }
  }
  
  clear_caches();

  delete [] inverse_order;
  delete [] swap_steps;
  
  return retval;
}

tree
tree::convertpath(char path[])
{
int l;

  l = strlen(path);

  reset_level_no(l);
  root = tree_make_dcpath(path, l);

  return *this;
}

tree::tree(const tree& init)
{
  level_no = init.level_no;

  if(level_no &&
     (polarity = new char[level_no + 1]) == 0) {
    logprintf(ERROR_MSG,
    	    "%s: Memory full in constructor tree(const tree &).\n",
	    MessageHead);
    exit(1);
  }
    
  for(int i = 1; i <= level_no; i += 1)
    polarity[i] = init.polarity[i];

  root = init.root;

  if(root != 0)
    copy_node(root);
}

void
set_message_head(char * MsgHead)
{
  tree::MessageHead = MsgHead;
}

void
tree::set_pol(char *pol_str)
{
  unsigned long i;

  for(i = 0; i < level_no && pol_str[i] != 0; i++)
    if(pol_str[i] != '-' && pol_str[i] != '+') {
      logprintf(ERROR_MSG,
              "%s: Bad polarity `%c' in level %ld. Old value not changed.\n",
              MessageHead, pol_str[i], level_no - i);
      return;
    }

  for(i = 0; i < level_no && pol_str[i] != 0; i++)
    polarity[level_no - i] = pol_str[i];
}

void
tree::get_pol(char *pol_str)
{
  unsigned long i;
  for(i = 0; i < level_no; i++)
    pol_str[i] = polarity[level_no - i];
  pol_str[i] = '\0';
}

void
tree::clear()
{
  if(root)
    tree_empty(root);

  root = Mpty;
}

void
tree::reset_level_no(unsigned long levels, char *new_polarity)
{
int i;

  if(level_no > 0)
    delete [] polarity;

  if(root && root->level)
    root = tree_empty(root);
  else
    root = Mpty;

  set_glob_levels(levels);

  if(levels > 0) {
    if((polarity = new char[levels + 1]) == 0) {
      logprintf(ERROR_MSG,"%s: memory full in tree::reset_level_no().\n",
		MessageHead);
      exit(1);
    }
    
    if(new_polarity)
      for(i = 1; i <= levels; i++)
	polarity[i] = new_polarity[i];
    else
      for(i = 1; i <= levels; i++)
	polarity[i] = '+';
  }

}

/*
 * 
 */
tree
tree::tree_extract(unsigned long mode)
{
  tree
    res;
  treenode
    *tn = Leaf;
  int
    i;
  
  if(root == 0) {
    logprintf(ERROR_MSG,
	      "%s: error in tree_extract(): erroneous tree returned.\n",
	      MessageHead);
    res.root = 0;
    return res;
  }
  else if(mode & CountNoRefsLower) {
    unsigned long n = 0;
    tree_count_localrefs(root, &n, &tn);
    clear_caches();
  }
  else if(mode & CountNoRefsUpper) {
    tree_fill_norefs_cache(root);
    tn = fetch_max_refnode(root);
    clear_caches();
  }
  else {
    logprintf(ERROR_MSG, "%s: error in tree_extract(): bad mode %lu.\n",
	      MessageHead, mode);
    res.root = 0;
    return res;
  }

  if(tn == Leaf) {
    // Wir haben nix sinnvolles extrahieren koennen. Deshalb wird ein
    // fehlerhafter Baum zurueckgegeben. Es handelt sich aber zwar nicht um
    // Fehler im "harten" Sinne.
    res.root = 0;
  }
  else {
    // Wir haben einen Teil des Baums gefunden, der sich vom Baum (wenn auch
    // moeglicherweise mit Rest) abdividieren laesst.
    res.reset_level_no(tn->level);
    res.root = copy_node(tn);
    for(i = 1; i <= tn->level; i++)
      res.polarity[i] = polarity[i];
  }

  return res;
}
