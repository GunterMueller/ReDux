// -*- C++ -*-
#ifndef fdd_h
#define fdd_h

/* =================================== */
/* Diese Datei gehoert zu Modul `fdd'. */
/* =================================== */

#include "cls_types.h"
#include "tree.h"
#include "bdd.h"
#include "edd.h"

class Vertex;
class Circuit;

class FDD : public tree {
friend class BDD;
friend class EDD;
private:
  int fdd_equalize(const FDD &f1, const FDD &f2,
		   treenode **t1, treenode **t2, FDD *res) {
    return tree_func_equalize(f1, f2, t1, t2, res);
  };
  
  int fdd_evaluate(treenode *tn, unsigned long lev, char *pattern);
  
public:
  FDD() : tree() {};
  FDD(unsigned long levels) : tree(levels) {};
  FDD(const FDD &fdd) : tree(fdd) {};
  FDD(const tree &rhs) : tree(rhs) {};
  ~FDD() {};
  
  // '+' soll heissen BDD-OR
  FDD& operator+=(char *);
  FDD& operator+=(const FDD &);
  FDD  operator+(const FDD &);
  
  friend void fdd_array_plus(FDD *, unsigned long, char *, unsigned long);
  friend void fdd_array_plus(FDD *, char *, char *);
  
  // '*' soll heissen BDD-AND
  FDD& operator*=(char *);
  FDD& operator*=(const FDD &);
  FDD  operator*(const FDD &);
  
  // XOR
  FDD& operator^=(char *);
  FDD& operator^=(const FDD &);
  FDD  operator^(const FDD &);
  
  // OR
  FDD& operator|=(char *);
  FDD& operator|=(const FDD &);
  FDD  operator|(const FDD &);
  
  // AND
  FDD& operator&=(char *);
  FDD& operator&=(const FDD &);
  FDD  operator&(const FDD &);
  FDD  operator&(char *);

  FDD  operator&&(const FDD &);
  
  // NOT
  FDD operator!();

  operator char * (void);	// Ausgabe als Equation
  
  // Einsetzen einer booleschen Konstanten w (0 oder 1) in einen Eingang i 
  // der Funktion f: f(x0, x1, ..., xi = w, ..., xn)
  FDD restrict(unsigned long w,  // Einzusetzender Wert (0 oder 1).
	       unsigned long i); // Eingang, in den eingesetzt werden soll.
  
  FDD old_restrict(unsigned long w, unsigned long i) {
    return restrict(w, level_no - i);
  };
  
  // Einsetzen einer Funktion g in einen Eingang i der Funktion f:
  // f(x0, x1, ..., xi = g(x0, x1, ..., xn), ..., xn)
  FDD compose(unsigned long i,  // Eingang in den eingesetzt werden soll.
	      const FDD &g);    // Einzusetzende Funktion.

  FDD old_compose(unsigned long i, const FDD &g) {
    return compose(level_no - i, g);
  };
  
  // Berechnen der Partiellen Ableitungsfunktion nach der Ebene `level'.
  // Ebene bedeutet ja im Grunde `Eingangsvariable'.
  FDD derive(unsigned long level);
  
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
  // String der Laenge n (bei einem FDD mit n Ebenen). Steht in shrinkvars[i]
  // ein '-', so wird Baumebene n - i entfernt. Steht jedoch ein '+' an der
  // Stelle, so verbleibt die entsprechende Ebene im Baum.
  FDD shrink(char shrinkvars[]);

  // FUNKTION mit der Variablenbelegung pattern AUSWERTEN.
  // Im String pattern stehen '1' bzw. '0' fuer log. 1 und log. 0.
  // pattern[0] liegt an Eingang Nr. level_no der Funktion und
  // pattern[level_no - 1] liegt an Eingang Nr. 1 der Funktion.
  // Diese Orientierung geht konform mit anderen Operationen, die
  // Strings mit FDDs verknuepfen. (z. B. FDD operator^=(char *))
  // pattern muss mindestens an den Stellen [0] bis [level_no - 1]
  // entweder '1' oder '0' sein. Anderenfalls kann eval() keine
  // Auswertung vornehmen und gibt -1 ALS FEHLERWERT zurueck.
  // Das Ergebnis einer KORREKTEN AUSWERTUNG ist 0 oder 1.
  int eval(char *pattern);
  
  // Transformieren der Funktion zu einer neuen Polaritaet
  FDD poltrans(char *);
  FDD polflip(unsigned long);
  
  FDD orderflip(unsigned long flip_pos) {
    return FDD(orderflip_base(flip_pos));
  };
  
  FDD ordertrans(unsigned long neword[],
		 unsigned long mode = OT_PATHWISE,
		 unsigned long path_no = 0) {
    return FDD(ordertrans_base(neword, mode, path_no));
  }
  
  // Baum/Funktion wandeln FDD -> BDD, FDD -> EDD
  BDD rmt();
  EDD trans_to_edd();
  
  // Fuegt an den Baum oben soviele Ebenen an, dass der Baum hinterher
  // insgesamt `lev' Ebenen hat.
  void add_levels(unsigned long lev) {
    if(root != 0) {
      add_levels_base(lev);
      treenode *aux = tree_expand_zeropath(level_no, level_no - lev, root);
      tree_empty(root);
      root = aux;
    }
  };
  
  // Technologieabb. (decompose) zweistufiger netze
  Vertex* tech_decomp(Circuit *,Vertex*);  
  Vertex* fdd_tech_decomp(treenode *,unsigned long,Circuit *,Vertex*);
  
  // Feststellen spezieller Funktionen.
  int is_inverter(void);
  int is_identity(void);

  // Boolesche Division mit Rest. Neue Variable wird oben angehaengt.
  FDD divide(FDD &q);
  FDD extract(unsigned long mode) { return FDD(tree_extract(mode)); };
  
};

int parr_compare(FDD &f1, FDD &f2);

#endif
