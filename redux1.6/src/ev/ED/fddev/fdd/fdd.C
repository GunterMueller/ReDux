
#include <stdlib.h>
#include <string.h>

#include "fdd.h"
#include "logfile.h"

// Vergleichsfunktion. Definiert eine Ordnung auf FDDs.
// Benoetigt im Modul Groebner.
int
parr_compare(FDD &f1, FDD &f2)
{
  FDD
    x = f1 && f2; // gemeinsame Terme suchen.
  int
    i,
    varweight = 0,
    noweight  = 0,
    vars      = f1.get_level_no();

  if(vars != f2.get_level_no()) {
    logprintf(ERROR_MSG,
	      "parr_compare(FDD): variable numbers do not match.\n");
    return 0;
  }
  
  char
    *p1 = new char[2 * vars + 2],
    *p2 = p1 + vars + 1;

  // gemeinsame Terme entfernen und groesste Terme (rechte Pfade) holen.
  (f1 ^ x).fetch_right_path(p1);
  (f2 ^ x).fetch_right_path(p2);

  if(p1[0] == 0 && p2[0] == 0) {
    delete p1;
    return 0;
  }
  else if(p1[0] == 0) {
    delete p1;
    return 1;
  }
  else if(p2[0] == 0) {
    delete p1;
    return -1;
  }
  
  // Terme vergleichen.
  for(i = 0; i < vars; i++) {
    if(varweight == 0) {
      if(p1[i] == '0' && p2[i] != '0')
	varweight = 1;
      else if(p1[i] != '0' && p2[i] == '0')
	varweight = -1;
      
      //if(varweight)
      //logprintf(RESULT_MSG, " %*s\n(%s)\n(%s) : %d\n", i + 1, "v",
      //	  p1, p2, varweight);
    }
    /* andere Ordnungsrelation: gesamtgrad und dann lexikalisch
    if(p1[i] != '0')
      --noweight;
    if(p2[i] != '0')
      ++noweight;
      */
  }
  
  delete p1;

  if(!noweight)
    return varweight;
  else
    return noweight;
}

//==============================================================
//
//  Ab hier Funktionen und Operatoren, die public sind.
//
//==============================================================

/* Bei der FDD-Polaritaetstransformation werden 1 und `-' vertauscht. */
FDD
FDD::poltrans(	  // String der Polaritaeten:
  char *pol_str)  // pol_str[i-1] == '+', wenn Polaritaet auf Ebene i 
  // positiv ist, pol_str[i-1] == '-', wenn sie negativ ist. Auf den Ebenen,
  // auf denen sich die Polaritaet geaendert hat, werden Einsen und DCs
  // vertauscht. Die anderen Ebenen bleiben gleich.
{
unsigned long
  i,
  first_diff = 0;
char
  *diff_pol;
FDD
  retval;

  if(root == 0)
    retval.root = 0;
  else {
    retval.reset_level_no(level_no);
    if((diff_pol = new char[level_no + 1]) == 0) {
      logprintf(ERROR_MSG, "%s: memory full in poltrans().\n", MessageHead);
      exit(1);
    }
    for(i = 0; i < level_no && (pol_str[i] == '-' || pol_str[i] == '+'); i++);
    if(i != level_no) {
      logprintf(ERROR_MSG,
              "%s: Bad polarity `%c' in level %ld.\n",
              MessageHead, pol_str[i], level_no - i);
      retval.reset_level_no(0);
      retval.root = 0;
    }
    else {
      for(i = 0; i < level_no; i++) {
        retval.polarity[level_no - i] = pol_str[i];
        if(pol_str[i] != polarity[level_no - i]) {
          diff_pol[level_no - i] = '*';
          first_diff             = level_no - i;
        }
        else
          diff_pol[level_no - i] = '=';
      }
      if(first_diff)
        retval.root = tree_sel_flip_1dc(root, diff_pol, level_no, first_diff);
      else
        retval = *this;
    }
    delete [] diff_pol;
  }

  clear_caches();
  return retval;
}

FDD
FDD::polflip(unsigned long input)
{
  unsigned long
    i;
  FDD
    retval(level_no);

  if(root == 0 || input >= level_no)
    retval.root = 0;
  else {
    for(i = 1; i <= level_no; i++)
      retval.polarity[i] = polarity[i];

    retval.polarity[level_no - input] =
      polarity[level_no - input] == '+' ? '-' : '+';

    retval.root = tree_flip_1dc_atlevel(root, level_no - input);
  }
  
  clear_caches();
  return retval;
}

EDD
FDD::trans_to_edd()
{
EDD
  retval;
int i;

  if(root == 0)
    retval.root = 0;
  else {
    treenode *tn1;
    retval.reset_level_no(level_no);
    for(i = 1; i <= level_no; i++)
      retval.polarity[i] = polarity[i];
    tn1         = tree_flip_zeropath(root, level_no);
    retval.root = tree_flip_1dc(tn1, level_no);
    tree_clear(tn1);
  }

  clear_caches();
  return retval;
}

/* Reed-Muller-Transformation: Nullen und DCs vertauschen. */
BDD
FDD::rmt()
{
BDD
  retval;
int i;

  if(root == 0)
    retval.root = 0;
  else {
    retval.reset_level_no(level_no);
    for(i = 1; i <= level_no; i++)
      retval.polarity[i] = polarity[i];
    retval.root = tree_flip_0dc(root, level_no);
  }

  clear_caches();
  return retval;
}

/* Traegt in ein FDD-Array tr ueberall dort den Pfad path_string ein, */
/* wo pattern[i] == '1' ist. */
void
fdd_array_plus(
  FDD *tr,	        // In dieses Array soll in die Elemente tr[i] der Pfad 
  char *path_string,	// path_string
  char *pattern)	// eingetragen werden, wenn pattern[i] == '1' ist.
{
  unsigned long
    i;
  treenode
    *add_tree,
    *new_tree;

  add_tree = tr[0].tree_make_dcpath(path_string, tr[0].level_no);

  for(i = 0; pattern[i]; i++)
    if(pattern[i] == '1') {
      new_tree = tr[i].tree_union(tr[i].root, add_tree);
      tr[i].tree_clear(tr[i].root);
      tr[i].root = new_tree;
    }

  tr[0].tree_clear(add_tree);
  clear_caches();
}

void
fdd_array_plus(
  FDD *tr,		// In dieses Array von FDDs soll der Pfad
			// path_string eingetragen werden.
  unsigned long no,	// So viele Elemente hat tr.
  char *path_string,	// klar
  unsigned long pattern)// Wenn Bit Nr i in pattern gesetzt ist, soll
  // path_string in tr[i] eingetragen werden. Sonst nicht.
{
unsigned long
  i;
treenode
  *add_tree,
  *new_tree;

  add_tree = tr[0].tree_make_dcpath(path_string, tr[0].level_no);

  for(i = 0; i < no; i++)
    if(pattern & (1 << i)) {
      new_tree = tr[i].tree_union(tr[i].root, add_tree);
      tr[i].tree_clear(tr[i].root);
      tr[i].root = new_tree;
    }

  tr[0].tree_clear(add_tree);
  clear_caches();
}

/* Pfad-Vereinigungs-Menge aehnlich BDD-Or. */
FDD&
FDD::operator+=(char *path_string)
{
treenode
  *node1,
  *node2;

  if(root == 0) 
    return *this;

  node1 = tree_make_dcpath(path_string, level_no);
  node2 = tree_union(root, node1);
  node1 = tree_clear(node1);
  root  = tree_clear(root);
  root  = node2;

  clear_caches();
  return *this;
}

FDD&
FDD::operator+=(const FDD &Operand)
{
  if (this == &Operand)		// beware of f+=f !
    return *this;
  
  FDD
    aux;
  treenode
    *r1, *r2;

  if(fdd_equalize(*this, Operand, &r1, &r2, &aux)) {
    aux.root = tree_union(r1, r2);
    tree_clear(r1);
    tree_clear(r2);
    *this = aux;
  }
  else {
    this->reset_level_no(0);
    root = 0;
  }

  clear_caches();
  return *this;
}

FDD
FDD::operator+(const FDD &Operand)
{
FDD
  retval;
treenode
  *r1, *r2;

  if(fdd_equalize(*this, Operand, &r1, &r2, &retval)) {
    retval.root = tree_union(r1, r2);
    tree_clear(r1);
    tree_clear(r2);
  }

  clear_caches();
  return retval;
}

/* Pfad-Schnitt-Menge aehnlich BDD-Or. */
FDD&
FDD::operator*=(char *path_string)
{
  treenode
    *node1,
    *node2;

  if(root == 0) 
    return *this;

  node1 = tree_make_dcpath(path_string, level_no);
  node2 = tree_intersect(root, node1);
  node1 = tree_clear(node1);
  root  = tree_clear(root);
  root  = node2;

  clear_caches();
  return *this;
}

FDD&
FDD::operator*=(const FDD &Operand)
{
  if (this == &Operand)		// beware of f*=f !
    return *this;
  
  FDD
    aux;
  treenode
    *r1, *r2;

  if(fdd_equalize(*this, Operand, &r1, &r2, &aux)) {
    aux.root = tree_intersect(r1, r2);
    tree_clear(r1);
    tree_clear(r2);
    *this = aux;
  }
  else {
    this->reset_level_no(0);
    root = 0;
  }

  clear_caches();
  return *this;
}

FDD
FDD::operator*(const FDD &Operand)
{
FDD
  retval;
treenode
  *r1, *r2;

  if(fdd_equalize(*this, Operand, &r1, &r2, &retval)) {
    retval.root = tree_intersect(r1, r2);
    tree_clear(r1);
    tree_clear(r2);
  }

  clear_caches();
  return retval;
}

/* EXOR */
FDD&
FDD::operator^=(char *path_string)
{
  treenode
    *node1,
    *node2;

  if(root == 0)
    return *this;

  node1 = tree_make_dcpath(path_string, level_no);
  node2 = tree_xunion(root, node1);
  node1 = tree_clear(node1);
  root  = tree_clear(root);
  root  = node2;

  clear_caches();
  return *this;
}

FDD&
FDD::operator^=(const FDD &Operand)
{
  if (this == &Operand)	{ // beware of f^=f !
    root = tree_empty(root);
    return *this;
  }

  FDD
    aux;
  treenode
    *r1, *r2;

  if(fdd_equalize(*this, Operand, &r1, &r2, &aux)) {
    aux.root = tree_xunion(r1, r2);
    tree_clear(r1);
    tree_clear(r2);
    *this = aux;
  }
  else {
    this->reset_level_no(0);
    root = 0;
  }

  clear_caches();
  return *this;
}

FDD
FDD::operator^(const FDD &Operand)
{
  FDD
    retval;
  treenode
    *r1, *r2;

  if(fdd_equalize(*this, Operand, &r1, &r2, &retval)) {
    retval.root = tree_xunion(r1, r2);
    tree_clear(r1);
    tree_clear(r2);
  }

  clear_caches();
  return retval;
}

/* OR */
FDD
FDD::operator|(const FDD &Operand)
{
  FDD
    retval;
  treenode
    *r1, *r2,
    *not_r1, *not_r2,
    *nand;

  if(fdd_equalize(*this, Operand, &r1, &r2, &retval)) {
    not_r1 = tree_flip_zeropath(r1, retval.level_no);
    tree_clear(r1);
    not_r2 = tree_flip_zeropath(r2, retval.level_no);
    tree_clear(r2);
    nand = tree_crossmerge(not_r1, not_r2);
    tree_clear(not_r1);
    tree_clear(not_r2);
    retval.root = tree_flip_zeropath(nand, retval.level_no);
    tree_clear(nand);
  }

  clear_caches();
  return retval;
}

FDD&
FDD::operator|=(char *path_string)
{
  treenode
    *path,
    *not_r1, *not_r2,
    *nand;

  if(root == 0)
    return *this;

  path   = tree_make_dcpath(path_string, level_no);
  not_r1 = tree_flip_zeropath(path, level_no);
  tree_clear(path);
  not_r2 = tree_flip_zeropath(root, level_no);
  root   = tree_clear(root);
  nand   = tree_crossmerge(not_r1, not_r2);
  tree_clear(not_r1);
  tree_clear(not_r2);
  root   = tree_flip_zeropath(nand, level_no);
  tree_clear(nand);

  clear_caches();
  return *this;
}

FDD&
FDD::operator|=(const FDD &Operand)
{
  if (this == &Operand)		// beware of f|=f !
    return *this;
  
  FDD
    aux;
  treenode
    *r1, *r2,
    *not_r1, *not_r2,
    *nand;

  if(fdd_equalize(*this, Operand, &r1, &r2, &aux)) {
    not_r1 = tree_flip_zeropath(r1, aux.level_no);
    tree_clear(r1);
    not_r2 = tree_flip_zeropath(r2, aux.level_no);
    tree_clear(r2);
    nand = tree_crossmerge(not_r1, not_r2);
    tree_clear(not_r1);
    tree_clear(not_r2);
    aux.root = tree_flip_zeropath(nand, aux.level_no);
    tree_clear(nand);
    *this = aux;
  }
  else {
    this->reset_level_no(0);
    root = 0;
  }

  clear_caches();
  return *this;
}

FDD::operator char * (void)
{
  return printEquation ('1', '-', '0', '*', '@', "0", "", "");
}


/* Selektives einsetzen EINES Wertes in einen Eingang der Funktion. */
FDD
FDD::restrict(
  unsigned long direction, // Wert: 0 oder 1
  unsigned long lev)	   // Auf welcher Ebene (in welchen Eingang) soll
  // der Wert eingesetzt werden?
{
  FDD
    retval(level_no);

  if(root == 0 || lev >= level_no)
    retval.root = 0;
  else {
    lev = level_no - lev;
    if((direction == 0 && polarity[lev] == '+') ||
       (direction == 1 && polarity[lev] == '-'))
      retval.root = tree_filter_paths(root, lev);
    else
      retval.root = tree_filter_level(root, lev);
    clear_caches();
    for(int i = 1; i <= level_no; i++)
      retval.polarity[i] = polarity[i];
  }

  return retval;
}

/* Einsetzen einer Funktion in einen Eingang einer anderen Funktion. */
FDD
FDD::compose(
  unsigned long lev, // In welchen Eingang soll die Funktion ins_tree
  // eingesetzt werden?
  const FDD &ins_tree)     // Einzusetzende Funktion.
{
  FDD
    retval;
  treenode
    *inner,
    *outer,
    *outer0, *outer1, *outer01,
    *inner_and_outer01;

  if(fdd_equalize(*this, ins_tree, &outer, &inner, &retval)) {
    lev = level_no - lev;
    outer0 = tree_filter_paths(outer, lev);
    outer1 = tree_filter_level(outer, lev);
    tree_clear(outer);
    if(retval.polarity[lev] == '-') {
      outer01 = outer0;
      outer0  = outer1;
      outer1  = outer01;
    }
    outer01 = tree_xunion(outer0, outer1);
    tree_clear(outer1);
    inner_and_outer01 = tree_crossmerge(inner, outer01);
    tree_clear(inner);
    tree_clear(outer01);
    retval.root = tree_xunion(inner_and_outer01, outer0);
    tree_clear(outer0);
    tree_clear(inner_and_outer01);
  }

  clear_caches();
  return retval;
}

/* Berechnung der Partiellen Ableitungsfunktion des FDD. */
FDD
FDD::derive(unsigned long level)
{
  int i;
  FDD retval(level_no);
  treenode *val0, *val1;

  if(level > level_no || root == 0) {
    retval.root = 0;
    return retval;
  }

  for(i = 1; i <= level_no; i++)
    retval.polarity[i] = polarity[i];

  val0 = tree_filter_paths(root, level_no - level);
  val1 = tree_filter_level(root, level_no - level);

  retval.root = tree_xunion(val0, val1);

  tree_clear(val0);
  tree_clear(val1);

  clear_caches();
  return retval;
}

FDD
FDD::shrink(char shrinkvar[])
{
  unsigned long
    *sh_arr,
    minlev;

  FDD
    retval = FDD(tree_shrink_prepare(shrinkvar, &sh_arr, &minlev));

  if(retval.is_erroneous()) {
    delete [] sh_arr;
    return retval;
  }

  retval.root = tree_zero_shrink(root, sh_arr, &minlev, level_no);
  delete [] sh_arr;

  if(minlev == level_no + 1) {
    // tree_zero_shrink() setzt minlev = level_no + 1, wenn das
    // FDD nicht von allen wegzushrinkenden Variablen unabhaengig ist.
    tree_clear(retval.root);
    retval.root = 0;
  }

  return retval;
}

/* Auswerten einer Funktion mit einer Belegung (pattern). Zunaechst muss */
/* pattern bezueglich der Polarisierung der Funktion angepasst werden. */
int
FDD::eval(char *pattern)
{
  int
    i;

  // Beim Auswerten die Polaritaet beachten!
  for(i = 0; i < level_no; i += 1)
    switch(pattern[i]) {
      case '0':
	printline[i] = polarity[level_no - i] == '+' ? '0' : '1';
	break;
      case '1':
	printline[i] = polarity[level_no - i] == '-' ? '0' : '1';
	break;
      default :
      logprintf(ERROR_MSG,
	"%s: Class FDD: %s pattern to evaluate: `%s'. -1 returned.\n",
	MessageHead, pattern[i] == 0 ? "short" : "bad", pattern);
      return -1;
    }

  return tree_func_evaluate(root, level_no, printline);
}

/* AND */
FDD&
FDD::operator&=(char *path_string)
{
  treenode
    *node1,
    *node2;

  if(root == 0)
    return *this;

  node1 = tree_make_dcpath(path_string, level_no);
  node2 = tree_crossmerge(root, node1);
  node1 = tree_clear(node1);
  root  = tree_clear(root);
  root  = node2;

  clear_caches();
  return *this;
}

FDD&
FDD::operator&=(const FDD &Operand)
{
  if (this == &Operand)		// beware of f&=f !
    return *this;
  
  FDD
    aux;
  treenode
    *r1, *r2;

  if(fdd_equalize(*this, Operand, &r1, &r2, &aux)) {
    aux.root = tree_crossmerge(r1, r2);
    tree_clear(r1);
    tree_clear(r2);
    *this = aux;
  }
  else {
    this->reset_level_no(0);
    root = 0;
  }

  clear_caches();
  return *this;
}

FDD
FDD::operator&(const FDD &Operand)
{
  FDD
    retval;
  treenode
    *r1, *r2;

  if(fdd_equalize(*this, Operand, &r1, &r2, &retval)) {
    retval.root = tree_crossmerge(r1, r2);
    tree_clear(r1); 
    tree_clear(r2);
  }

  clear_caches();
  return retval;
}

FDD
FDD::operator&(char *path)
{
  if(root == 0)
    return *this;
  else {
    treenode
      *root2;
    FDD
      retval(*this);

    tree_clear(retval.root);
    
    root2       = tree_make_dcpath(path, level_no);
    retval.root = tree_crossmerge(root, root2);
    
    tree_clear(root2);
    clear_caches();
    return retval;
  }
}

FDD
FDD::operator&&(const FDD &op)
{
  FDD
    retval;  
  treenode
    *r1, *r2;

  if(fdd_equalize(*this, op, &r1, &r2, &retval)) {
    retval.root = tree_intersect(r1, r2);
    tree_clear(r1); 
    tree_clear(r2);
  }
  
  clear_caches();
  return retval;
}

/* NOT */
FDD
FDD::operator!()
{
  FDD
    retval;

  if(root == 0)
    retval.root = 0;
  else {
    retval.reset_level_no(level_no);
    retval.root = tree_flip_zeropath(root, level_no);
    for(int i = 1; i <= level_no; i++)
      retval.polarity[i] = polarity[i];
  }

  clear_caches();
  return retval;
}

int
FDD::is_inverter(void)
{
//   if (level_no == 1 && root == Leaf) return 1;
//   else return 0;
//  return (level_no == 1 && root == Leaf);
  return eval("0");
}

int
FDD::is_identity(void)
{
//   if (level_no == 1 && root->level == 1 && root->son[1] == Leaf) return 1;
//   else return 0;
//  return (level_no == 1 && root->level == 1 && root->son[1] == Leaf);
  return eval("1");
}

FDD
FDD::divide(FDD &p)
{
  FDD
    res = FDD(tree_prepare_divide(p));
  treenode
    *OneTree = tree_expand_zeropath(p.level_no, 0, Leaf),
    *q, *r;

  tree_divide_rec(root, p.root, &q, &r, OneTree, Mpty);
  res.root = create_node(r, q, level_no + 1);
  tree_clear(OneTree);
  return res;
}
