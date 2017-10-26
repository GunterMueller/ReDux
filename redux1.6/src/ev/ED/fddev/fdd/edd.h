// -*- C++ -*-
#ifndef edd_h
#define edd_h

/* =================================== */
/* Diese Datei gehoert zu Modul `edd'. */
/* =================================== */

#include "cls_types.h"
#include "tree.h"
#include "bdd.h"
#include "fdd.h"

class EDD : public tree {
friend class BDD;
friend class FDD;
private:
  int edd_equalize(const EDD &f1, const EDD &f2,
		   treenode **t1, treenode **t2, EDD *res) {
    return tree_func_equalize(f1, f2, t1, t2, res);
  };
  
  int edd_evaluate(treenode *tn, unsigned long lev, char *pattern);
  
public:
  EDD() : tree() {};
  EDD(unsigned long levels) : tree(levels) {
    root = tree_expand_zeropath(levels, 0, Leaf);
  };
  EDD(const EDD &edd) : tree(edd) {};
  EDD(const tree &rhs) : tree(rhs) {};
  ~EDD() {};
  
  // '+' soll heissen BDD-OR
  EDD& operator+=(char *);
  EDD& operator+=(const EDD &);
  EDD  operator+(const EDD &);
  
  friend void edd_array_plus(EDD *, unsigned long, char *, unsigned long);
  friend void edd_array_plus(EDD *, char *, char *);
  
  // '*' soll heissen BDD-AND
  EDD& operator*=(char *);
  EDD& operator*=(const EDD &);
  EDD  operator*(const EDD &);
  
  // XOR
  EDD& operator^=(char *);
  EDD& operator^=(const EDD &);
  EDD  operator^(const EDD &);
  
  // OR
  EDD& operator|=(char *);
  EDD& operator|=(const EDD &);
  EDD  operator|(const EDD &);
  
  // AND
  EDD& operator&=(char *);
  EDD& operator&=(const EDD &);
  EDD  operator&(const EDD &);
  
  // NOT
  EDD operator!();

  operator char * (void);	// Ausgabe als Equation
  
  // Einsetzen einer booleschen Konstanten w (0 oder 1) in einen Eingang i 
  // der Funktion f: f(x0, x1, ..., xi = w, ..., xn)
  EDD restrict(unsigned long w,  // Einzusetzender Wert (0 oder 1).
	       unsigned long i); // Eingang, in den eingesetzt werden soll.
  
  EDD old_restrict(unsigned long w, unsigned long i) {
    return restrict(w, level_no - i);
  };
  
  // Einsetzen einer Funktion g in einen Eingang i der Funktion f:
  // f(x0, x1, ..., xi = g(x0, x1, ..., xn), ..., xn)
  EDD compose(unsigned long i,  // Eingang in den eingesetzt werden soll.
	      const EDD &g);    // Einzusetzende Funktion.
  
  EDD old_compose(unsigned long i, const EDD &g) {
    return compose(level_no - i, g);
  };
  
  // Berechnen der Partiellen Ableitungsfunktion nach der Ebene `level'.
  // Ebene bedeutet im Grunde `Eingangsvariable'.
  EDD derive(unsigned long level);
  
  void get_depend(char depvars[]) {
    for(int i = 0; i < level_no; i++)
      depvars[i] = '-';
    depvars[i] = 0;
    tree_detect_nonzero(root, level_no + 1, depvars);
  };
  
  // Sind gewisse Eingaenge einer Funktion nicht verwendet (haengt also
  // die Funktion nicht von diesen Eingaengen ab), so koennen die Ebenen,
  // die diese Eingaenge repraesentieren, gestrichen werden. Die Methode
  // shrink nimmt eine solche Streichung vor. In shrinkvars steht ein
  // String der Laenge n (bei einem EDD mit n Ebenen). Steht in shrinkvars[i]
  // ein '-', so wird Baumebene n - i entfernt. Steht jedoch ein '+' an der
  // Stelle, so verbleibt die entsprechende Ebene im Baum.
  EDD shrink(char shrinkvars[]);

  // FUNKTION mit der Variablenbelegung pattern AUSWERTEN.
  // Im String pattern stehen '1' bzw. '0' fuer log. 1 und log. 0.
  // pattern[0] liegt an Eingang Nr. level_no der Funktion und
  // pattern[level_no - 1] liegt an Eingang Nr. 1 der Funktion.
  // Diese Orientierung geht konform mit anderen Operationen, die
  // Strings mit EDDs verknuepfen. (z. B. EDD operator^=(char *))
  // pattern muss mindestens an den Stellen [0] bis [level_no - 1]
  // entweder '1' oder '0' sein. Anderenfalls kann eval() keine
  // Auswertung vornehmen und gibt -1 ALS FEHLERWERT zurueck.
  // Das Ergebnis einer KORREKTEN AUSWERTUNG ist 0 oder 1.
  int eval(char *pattern);
  
  // Transformieren der Funktion zu einer neuen Polaritaet
  EDD poltrans(char *);
  EDD polflip(unsigned long);
  
  EDD orderflip(unsigned long flip_pos) {
    return EDD(orderflip_base(flip_pos));
  };
  
  EDD ordertrans(unsigned long neword[],
		 unsigned long mode = OT_PATHWISE,
		 unsigned long path_no = 0) {
    return EDD(ordertrans_base(neword, mode, path_no));
  };
  
  // Baum/Funktion wandeln EDD -> BDD, EDD -> FDD
  BDD trans_to_bdd();
  FDD trans_to_fdd();
  
  // Fuegt an den Baum oben `lev' Ebenen an.
  void add_levels(unsigned long lev) {
    if(root != 0) {
      add_levels_base(lev);
      treenode *aux = tree_expand_zeropath(level_no, level_no - lev, root);
      tree_empty(root);
      root = aux;
    }
  };

  // Feststellen spezieller Funktionen.
  int is_inverter(void);
  int is_identity(void);

  // Technologieabb. (decompose) zweistufiger netze
  Vertex* tech_decomp(Circuit *,Vertex*);  
  Vertex* edd_tech_decomp(treenode *,unsigned long,Circuit *,Vertex*);

  // Boolesche Division mit Rest. Neue Variable wird oben angehaengt.
  EDD divide(EDD &q);
  EDD extract(unsigned long mode) { return EDD(tree_extract(mode)); };
  
};

#endif
