// -*- C++ -*-
#ifndef bdd_h
#define bdd_h

#include "cls_types.h"
#include "tree.h"
#include "edd.h"
#include "fdd.h"

class BDD : public tree {
friend class Fct;
friend class EDD;
friend class FDD;
private:
  int bdd_eval(const treenode *, char*);
  int bdd_eval(const treenode *, unsigned long);
  int bdd_equalize(const BDD &, const BDD &, BDD *);
  
  treenode *bdd_and(BDD*, BDD*);
  treenode *bdd_and_step(treenode *, treenode *);

  void bdd_compose(treenode *,const unsigned long, const BDD *);

  treenode *bdd_restrict(treenode* node,const unsigned long direction,
			 const unsigned long lev);

protected:
public:
  BDD() : tree() {
#ifdef ENDRIC_DEBUG
    //fprintf(stderr, "Destructor BDD done.\n");
#endif
  };
  
  BDD(unsigned long levels) : tree(levels) {};
  BDD(const BDD &bdd) : tree(bdd) {};
  BDD(const tree &rhs) : tree(rhs) {};
  ~BDD() {};

  // OR
  BDD& operator|=(char *);
  BDD& operator|=(const BDD &);
  BDD  operator|(const BDD &);
  
  // NOT
  BDD operator!();

  // XOR
  BDD& operator^=(char *);
  BDD& operator^=(const BDD &);
  BDD  operator^(const BDD &);

  // AND
  BDD& operator&=(char *);
  BDD& operator&=(const BDD &);
  BDD  operator&(const BDD &);

  operator char * (void);	// Ausgabe als Equation

  BDD compose(unsigned long, BDD &);
  BDD old_compose(unsigned long in, BDD &b) {
    return compose(level_no - in, b);
  };

  BDD separate(unsigned long sep_inputs[]);
  BDD separate(unsigned long sep_input);

  BDD restrict(unsigned long, const unsigned long);
  BDD old_restrict(unsigned long val, const unsigned long lev) {
    return restrict(val, level_no - lev);
  };

  /* Berechnung der Partiellen Ableitungsfunktion. */
  BDD derive(unsigned long level);

  void get_depend(char depvars[]) {
    for(int i = 0; i < level_no; i++)
      depvars[i] = '-';
    depvars[i] = 0;
    tree_detect_nondc(root, depvars);
  };

  // Sind gewisse Eingaenge einer Funktion nicht verwendet (haengt also
  // die Funktion nicht von diesen Eingaengen ab), so koennen die Ebenen,
  // die diese Eingaenge repraesentieren, gestrichen werden. Die Methode
  // shrink nimmt eine solche Streichung vor. In shrinkvars steht ein
  // String der Laenge n (bei einem BDD mit n Ebenen). Steht in shrinkvars[i]
  // ein '-', so wird Baumebene n - i entfernt. Steht jedoch ein '+' an der
  // Stelle, so verbleibt die entsprechende Ebene im Baum.
  BDD shrink(char shrinkvars[]);

  friend void bdd_array_or(BDD *, unsigned long, char *, unsigned long);
  
  // Baum/Funktion wandeln BDD -> FDD, BDD -> EDD
  FDD rmt();
  EDD trans_to_edd();

  BDD poltrans(char *);  
  BDD polflip(unsigned long);  

  BDD orderflip(unsigned long flip_pos) {
    return BDD(orderflip_base(flip_pos));
  };

  BDD ordertrans(unsigned long neword[],
		 unsigned long mode = OT_PATHWISE,
		 unsigned long path_no = 0) {
    return BDD(ordertrans_base(neword, mode, path_no));
  };

  void add_levels(unsigned long lev) {
    add_levels_base(lev);
  };

  int eval(char *pattern);         // evaluate function, i.e. calc f(pattern)
  int eval(unsigned long pattern);

//decompose disjoint:
  int decompose_dj (unsigned long x[], unsigned long nx1, unsigned long nx2, 
		    BDD **g, unsigned long *anzg);
  BDD top_tree2bdd (treenode **tplist, unsigned long anzg, 
		    unsigned long level_loss);
  BDD part_tree2bdd (treenode *ptr, unsigned long flevel);
  friend treenode *top_tree2bdd_rec (BDD *th, treenode *ptr, treenode **tplist, 
				  unsigned long anzg, unsigned long add2level);
  unsigned long count_gi (unsigned long level, treenode **tplist);
  friend void count_gi_rec (unsigned long level, treenode **tplist, 
			    unsigned long *lastp1, treenode *ptr);


  // Feststellen spezieller Funktionen.
  int is_inverter(void);
  int is_identity(void);

  // Boolesche Division mit Rest. Neue Variable wird oben angehaengt.
  BDD divide(BDD &q);
  BDD extract(unsigned long mode) { return BDD(tree_extract(mode)); };
  // Technologieabb. (decompose) zweistufiger netze
  Vertex* tech_decomp(Circuit *,Vertex*);  
  Vertex* bdd_tech_decomp(treenode *,Circuit *,Vertex*);

  int is_zero(void) const {return (root == Mpty);};
  int is_one (void) const {return (root == Leaf);};
};

#endif
