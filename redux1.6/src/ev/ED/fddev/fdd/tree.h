// -*- C++ -*-
#ifndef tree_h
#define tree_h

/* ===================================== */
/* Diese Datei gehoert zu Module `tree'. */
/* ===================================== */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "logfile.h"
#include "AVL.h"

#define hi_guys(string) fprintf(stdout, "%s\n", (string));
#define start(string) fprintf(stdout, "Starting %s ...\n", (string));
#define finish(string) fprintf(stdout, "Finished %s\n", (string));

/*
 * Debug-Code-Schalter:
 */

//#define DB_SIM_GRP_LIST
//#define DB_SHOW_SIM_GRPS
//#define DB_CLASS_PROFILE
//#define DB_COUNT_NODE_CONSTRUCTS
//#define DB_COUNT_SIM_GRP_CONSTRUCTS
//#define DB_COUNT_SIM_GRP_CHANGES
//#define DB_COUNT_SIM_GRP_READS
//#define DB_COUNT_SIM_GRP_READ_STEPS

/* Zaehlen der Aufrufe vom Node-Konstruktor/Destruktor */
#ifdef DB_COUNT_NODE_CONSTRUCTS
#define ND_CSTR_CNT(x)  (x) += 1
#else
#define ND_CSTR_CNT(x)
#endif

/* Zaehlen der Aufrufe vom sim_grp-Konstruktor/Destruktor. */
#ifdef DB_COUNT_SIM_GRP_CONSTRUCTS
#define SIM_CSTR_CNT(x)  (x) += 1
#else
#define SIM_CSTR_CNT(x)
#endif

/* Zaehlen der Aufrufe von Ein-/Ausfuegeoperationen der sim_grp-Listen. */
#ifdef DB_COUNT_SIM_GRP_CHANGES
#define SIM_CHNG_CNT(x)  (x) += 1
#else
#define SIM_CHNG_CNT(x)
#endif

/* Zaehlen der Aufrufe von Leseoperationen in sim_grp-Listen. */
#ifdef DB_COUNT_SIM_GRP_READS
#define SIM_RD_CNT(x)    (x) += 1
#else
#define SIM_RD_CNT(x)
#endif

/* Zaehlen der Leseschritte in sim_grp-Listen. */
#ifdef DB_COUNT_SIM_GRP_READ_STEPS
#define SIM_RD_ST_CNT(x) (x) += 1
#else
#define SIM_RD_ST_CNT(x)
#endif

#define IF_MULTIPLE_USED(n1) \
  if(((n1)->no_refs > 1 || (n1)->level == 0))

#define IF_MULTIPLE_USED2(n1, n2) \
  if(((n1)->no_refs > 1 || (n1)->level == 0) && \
     ((n2)->no_refs > 1 || (n2)->level == 0))

enum {
  STRAT_CLEAR_IMMED = 1,
  STRAT_KEEP_DATA   = 2,
  QUERY_STRATEGY    = 3,
  DO_CLEAR_DATA     = 4,
  DO_CLEAR_OVERRIDE = 5
};

enum {
  OT_FASTEST,
  OT_FASTEST_COUNT,
  OT_PATHWISE,
  OT_BUBBLE_SWAP
};

enum {
  ModeTakePol  = 1,// Bei Cubelist- bzw. PI-Term-Ausgabe werden die Cubes bzw.
                   // PI-Terme bezueglich der eingestellten Polaritaet der
                   // Funktion umgewandelt.
  ModeCompress = 2,// Mit einem einfachen Komprimierungsalg. wird bei der
		   // Cubelist-Ausgabe die Anzahl der Cubes durch die Nutzung
		   // von Don't Cares verringert.

  CountNodes        = 4,
  CountPaths        = 8,
  CountCubes        = 16,
  CountCubesDisjOpt = 32, // Steuerargumente der count(...) Funktion.
  CountLiterals     = 64,
  CountCompressedLiterals = 128,
  CountSignature    = 256,
  CountFactors      = 512, //zum zaehlen gemeinsamer Faktoren
  CountActiveNodes  = 1024, //zum Zaehlen aktiver Knoten fuer FPGAs
  CountNoRefsLower  = 2048,
  CountNoRefsUpper  = 4096,

  // =========== Steuerargumente fuer tree::print(...); ======================
  //  Wie soll das xDD ausgegeben werden? (Variable tp_mode)
  PutTree	= 1,// Ausgabe der Funktion in Baumformat. (Pseudografik)
  PutTreeNoReset= 2,// Ausgabe der Funktion im Baumformat. Zur Veranschau- 
		    // lichung von mehrfach genutzten Unterbaeumen von VER-
		    // SCHIEDENEN Funktionen werden hier bei der Ausgabe die
		    // "Unterbaum ist bereits ausgegeben"-Flags nicht zurueck-
		    // gesetzt.
  PutPlainPaths = 3,// Die Pfade ausgeben, wie sie aus dem xDD gelesen werden
		    // koennen. Da im xDD nicht alle DCs wirklich eliminierte
		    // Knoten sind, sind hier nicht alle moeglichen DCs auch
		    // zusammengefasst.
  PutDisjOpt	= 4,// Exakt optimierte Ausgabe. Alle enthaltenen DCs sind
		    // auch in der Ausgabe DCs. Die Pfadliste ist aber trotzdem
		    // disjunkt!
  PutCoverOpt	= 5,// Pfadliste mit Ueberdeckungen.

  // Wohin soll das xDD geschrieben werden? (Variable tp_sink)
  MEMORY_SINK	= 1,	// In ein Array.
  STREAM_SINK	= 2,	// In eine Datei.
  LOG_SINK	= 3,	// Auf die Ausgabe-Logfiles. (Console, etc.)

  // Fuer die Fktn. tree_print_statistics(mode) (eigentlich nur zum Debuggen)
  StatSimGrpInfo   = 1,  // Ausgabe von Infos ueber Knoten-Aequivalenz-Gruppen,
                         // die zum Optimieren der Baeume verwendet werden.
  StatProfileInfo  = 2   // Ausgabe von Profil-Infos. In einigen Funktionen
                         // wird eine einfaches Zaehlen der Aufrufe ein
                         // Nutzungsprofil erstellt. Das soll dazu dienen,
                         // besonders zeitintensive Programmteile zu erkennen.
};

const int
  MaxNodeBufferLength   = 5000,
  MaxSimGrpBufferLength = 5000;

class treenode;

//==================================================================
// Aehnlichkeitsgruppen: (SIMiliarity-GRouPs)
//==================================================================
class sim_grp {
 public:
  treenode
    *list;  // list ist der Zeiger auf alle Knoten, die den linken Sohnknoten
            // gemeinsam haben. (Aehnlichkeitsgruppe)
  sim_grp
    *prev,
    *next;  // Ueber die Komponenten prev und next koennen alle Knoten-Listen-
            // Anker des Typs sim_grp zu einer doppelt verketteten Liste ver-
            // bunden werden. Diese Liste laesst sich ueber den Anker
	    // tree::sim_groups erreichen.
};

//==================================================================
// Struktur eines Baumknotens:
//==================================================================
class treenode {
 public:
  int
    flag       : 15, // Zu Zaehl- und Ausgabezwecken
    single_sim : 1,  // siehe Komponente sim
    level      : 16; // Auf diesem Level liegt der Knoten. Die Blaetter
                     // Leaf und Mpty haben die Level 0, die Sohnknoten eines
                     // Knotens haben kleinere Levels, als der Knoten selbst.
  unsigned long
    id,       // id ist ein eindeutiger Integer, der jedem Knoten zugeordnet
              // und NUR FUER AUSGABEZWECKE genutzt wird. Fuer die anderen
              // Algorithmen ueberfluessig.
    no_refs;  // Anzahl der Referenzen auf diesen Knoten. Da ein Knoten im
              // Allgemeinen fuer mehrere andere Knoten Sohnknoten sein kann,
              // ist es beim Loeschen eines Baums wichtig, zu wissen, ob 
              // ein Knoten wirklich aus dem System entfernt werden kann,
              // oder ob er noch von anderen Knoten als Sohn gebraucht wird.

  treenode
    *prev,
    *next,  // siehe sim,
            // Jeder Knoten a, der den linken Sohn b hat, ist mit prev und next
	    // in die doppelt verkettete Liste aller Knoten eingebunden, die
            // mit a den linken Sohn b gemeinsam haben.
            // Ist Knoten a der einzige Knoten, der b als linken Sohn hat, oder
            // hat a keinen linken Sohn, so ist a in der doppelt verketteten
            // Liste eingebunden, die ueber den Anker tree::nodes_not_sim er-
            // reichbar ist.
    *son[2];// Linker (son[0]) und rechter (son[1]) Sohn dieses Knotens.

  union {
    sim_grp  *list;
    treenode *node;
  }
  sim;// sim zeigt auf eine Struktur, in der all die Knoten stehen, die diesen
  // Knoten als linken Sohnknoten (son[0]) haben.
  // Je nach Zustand der Komponente single_sim muss sim interpretiert
  // werden:
  // single_sim	  sim
  //    1       sim != 0 : Nur ein einziger Knoten hat diesen Knoten als
  //                       linken Sohn. sim.node zeigt direkt auf diesen
  //	       	           Knoten.
  //    0       sim != 0 : Es gibt mehrere Knoten, die diesen Knoten als
  //                       linken Sohn haben. sim.list zeigt in diesem
  //	       	           Fall auf den Listenanker (Typ sim_grp), der
  //	       	           doppelt verketteten Liste der "links-Vater-
  //	       	           Knoten". Die doppelt verkettete Liste wird
  //	       	           mit den Komponenten prev und next der Knoten-
  //	       	           strukturen aufgebaut.
  //    ?       sim == 0 : Kein Knoten hat diesen Knoten als linken Sohn.
};

class tree;

class int_c {
 public:
  unsigned long i;
  int_c& put (int ii) {i = ii; return *this;};
  int_c(int ii) {i = ii;};
  int_c(unsigned long ii) {i = ii;};
  int_c() {i = 0;};
  ~int_c() {};
};

class tn_ptr {
public:
  treenode
    *node;
  tn_ptr& put(treenode *nd) {
    node = nd;
    return *this;
  };
  tn_ptr(const tn_ptr &p) {
    if(node = p.node) node->no_refs++;
  };
  tn_ptr(treenode *in) {
    if(node = in) node->no_refs++;
  };
  tn_ptr() {node = 0;};
  inline ~tn_ptr();
  tn_ptr& operator=(const tn_ptr &p) {
    if(this != &p && (node = p.node)) node->no_refs++;
    return *this;
  };
  int operator>(const tn_ptr &p) {
    return node > p.node;
  };
  int operator<(const tn_ptr &p) {
    return node < p.node;
  };
  int operator!=(const tn_ptr &p) {
    return node != p.node;
  };
  int operator==(const tn_ptr &p) {
    return node == p.node;
  };
};

class tn_ptr_pair {
 public:
  treenode
    *nd1,
    *nd2;
  tn_ptr_pair& put(treenode *n1, treenode *n2) {
    if(n1 > n2) {
      nd1 = n2;
      nd2 = n1;
    }
    else {
      nd1 = n1;
      nd2 = n2;
    }
    return *this;
  }; 
  tn_ptr_pair(treenode *n1, treenode *n2) {
    if(n1 > n2) {
      if(nd1 = n2) nd1->no_refs++;
      if(nd2 = n1) nd2->no_refs++;
    }
    else {
      if(nd1 = n1) nd1->no_refs++;
      if(nd2 = n2) nd2->no_refs++;
    }
  }; 
  tn_ptr_pair() {nd1 = nd2 = 0;};
  tn_ptr_pair(const tn_ptr_pair &p) {
    if(nd1 = p.nd1) nd1->no_refs++;
    if(nd2 = p.nd2) nd2->no_refs++;
  }; 
  inline ~tn_ptr_pair();
  tn_ptr_pair& operator=(const tn_ptr_pair &p) {
    if (this != &p) {
      if(nd1 = p.nd1) nd1->no_refs++;
      if(nd2 = p.nd2) nd2->no_refs++;
    }
    return *this;
  };
  int operator>(const tn_ptr_pair &p) {
    return nd1 > p.nd1 || (nd1 == p.nd1 && nd2 > p.nd2);
  };
  int operator<(const tn_ptr_pair &p) {
    return nd1 < p.nd1 || (nd1 == p.nd1 && nd2 < p.nd2);
  };
  int operator!=(const tn_ptr_pair &p) {
    return nd1 != p.nd1 || nd2 != p.nd2;
  };
  int operator==(const tn_ptr_pair &p) {
    return nd1 == p.nd1 && nd2 == p.nd2;
  };
};

class tn_ptr_triple {
 public:
  treenode
    *nd1, *nd2, *nd3;
  tn_ptr_triple& put(treenode *n1, treenode *n2, treenode *n3) {
    nd1 = n1;
    nd2 = n2;
    nd3 = n3;
    return *this;
  }; 
  tn_ptr_triple(treenode *n1, treenode *n2, treenode *n3) {
    if(nd1 = n1) nd1->no_refs++;
    if(nd2 = n2) nd2->no_refs++;
    if(nd3 = n3) nd3->no_refs++;
  }; 
  tn_ptr_triple() {nd1 = nd2 = nd3 = 0;};
  tn_ptr_triple(const tn_ptr_triple &p) {
    if(nd1 = p.nd1) nd1->no_refs++;
    if(nd2 = p.nd2) nd2->no_refs++;
    if(nd3 = p.nd3) nd3->no_refs++;
  }; 
  inline ~tn_ptr_triple();
  tn_ptr_triple& operator=(const tn_ptr_triple &p) {
    if (this != &p) {
      if(nd1 = p.nd1) nd1->no_refs++;
      if(nd2 = p.nd2) nd2->no_refs++;
      if(nd3 = p.nd3) nd3->no_refs++;
    }
    return *this;
  };
};

class tn_ptr_int {
 public:
  treenode
    *nd;
  unsigned long
    i;
  tn_ptr_int& put(treenode *n, unsigned long ii) {
    nd = n;
    i = ii;
    return *this;
  }; 
  tn_ptr_int(treenode *n, unsigned long ii) {
    if(nd = n) nd->no_refs++;
    i = ii;
  }; 
  tn_ptr_int() {nd = 0; i = 0;};
  tn_ptr_int(const tn_ptr_int &p) {
    if(nd = p.nd) nd->no_refs++;
    i = p.i;
  }; 
  inline ~tn_ptr_int();
  tn_ptr_int& operator=(const tn_ptr_int &p) {
    if (this != &p) {
      i = p.i;
      if(nd = p.nd) nd->no_refs++;
    }
    return *this;
  };
  int operator>(const tn_ptr_int &p) {
    return nd > p.nd || (nd == p.nd && i > p.i);
  };
  int operator<(const tn_ptr_int &p) {
    return nd < p.nd || (nd == p.nd && i < p.i);
  };
  int operator!=(const tn_ptr_int &p) {
    return nd != p.nd || i != p.i;
  };
  int operator==(const tn_ptr_int &p) {
    return nd == p.nd && i == p.i;
  };
};

class tree {
  private:
    static treenode
      leaf,
      mpty;

    //=============================================
    // Verwaltung der ...
    static treenode
      **zeropaths,
      **leaf_sim_group,
      **mpty_sim_group,
      *free_node_list;

    static unsigned long
      free_node_list_length,
      overall_node_no,
      next_node_id;
    // ... Treenodes.
    //=============================================

    //=============================================
    // Verwaltung der ...
    static unsigned long
      free_sim_grp_list_length;

    static sim_grp
      *free_sim_grp_list,
      *sim_groups;

    static treenode
      *nodes_not_sim;
    // ... Aehnlichkeitsgruppen.
    //=============================================

    static unsigned long
      MaxLevel,

      //===========================================
      // Statistik-Zaehler nur ...
      sim_grp_changes,
      sim_grp_reads,
      sim_grp_read_steps,
      sim_grp_true_alloc,
      sim_grp_true_free,
      sim_grp_virt_alloc,
      sim_grp_virt_free,

      node_true_alloc,
      node_true_free,
      node_virt_alloc,
      node_virt_free;
      // ... zu Debug-Zwecken.
      //===========================================
      void tree_xdraw(treenode*,unsigned long ,unsigned long*, unsigned long *);
  protected:
    static char
      *MessageHead,
      *printline;

    static treenode
      *Leaf,
      *Mpty;

    static AVL<tn_ptr_triple, tn_ptr_pair>
      spread_cache;

    static AVL<tn_ptr, tn_ptr_pair>
      intersect_cache,
      union_cache,
      xunion_cache,
      crossmerge_cache;

    static AVL<tn_ptr, tn_ptr>
      cut_literal_paths_cache,
      cut_dc_paths_cache,
      flip_1dc_atlevel_cache,
      flip_01_atlevel_cache,
      sel_flip_01_cache,
      exchange_levels_cache;
    
    static AVL<tn_ptr, tn_ptr_int>
      filter_paths_cache,
      filter_level_cache,
      flip_zeropath_cache,
      flip_0dc_cache,
      flip_1dc_cache,
      sel_flip_1dc_cache;

    static AVL<int_c, tn_ptr_int>
      count_paths_cache;

    static AVL<int_c, tn_ptr>
      norefs_cache,
      count_localrefs_cache,
      count_cubes_disj_opti_cache,
      count_cubes_cache;

    static int
      flag_threshold;
    
    treenode
      *root;
    unsigned long
      level_no;
    char
      *polarity;

    void set_glob_levels(unsigned long);

    //======================================================================
    // Erzeugen und zerstoeren von Treenodes.
    treenode *node_alloc(unsigned long);
    void node_free(treenode *);
    //======================================================================

    //======================================================================
    // Unterhalten von Aehnlichkeitsgruppen (sim_grp)
    // High(er)-Level:
    inline void register_sim(treenode *);
    inline void release_sim(treenode *);

    // Low-Level:
    inline void insert_sim(treenode **, treenode *);
    inline void remove_sim(treenode **, treenode *);
    inline void destroy_sim(sim_grp *);
    inline sim_grp *create_sim();
    //======================================================================

    //======================================================================
    // Erzeugen eines optimierten Baums aus den Sohnbaeumen und der
    // Ebenennummer des Wurzelbaums.
    treenode *create_node(treenode *son0, treenode *son1, unsigned long level);
    // Erzeugen einer Kopie eines Knotens.
    treenode *copy_node(treenode *tn) {
      tn->no_refs++;
      return tn;
    };
    //======================================================================

    friend treenode *tree_empty(treenode *);
    treenode *tree_clear(treenode *tn) {
      tree_empty(tn);
      return 0;
    };

    int tree_func_equalize(const tree &t1, const tree &t2,
		      treenode **r1, treenode **r2, tree *result);
    int tree_func_evaluate(treenode *tn, unsigned long lev, char *pattern);

    int tree_is_single_path(treenode *node);
    treenode *tree_expand_zeropath(unsigned long, unsigned long, treenode *);

    treenode *tree_make_dcpath(char *, unsigned long);

    unsigned long tree_count_nodes(treenode *);
    unsigned long tree_count_active_nodes(treenode *);
    unsigned long tree_count_paths(treenode *, unsigned long);
    unsigned long tree_count_cubes(treenode *);
    unsigned long tree_count_cubes_disj_opti(treenode *);
    double        tree_count_entropy(treenode *, unsigned long);
    void tree_fill_norefs_cache(treenode *node);
    treenode *fetch_max_refnode(treenode *node);
    void tree_count_localrefs(treenode *node,
			      unsigned long *maxval,
			      treenode **maxnode);

    void tree_count_factors(treenode *, unsigned long *);

    void tree_detect_nonzero(treenode *node, unsigned long lastlev,
			     char nonzero[]);
    void tree_detect_nondc(treenode *node, char nondc[]);

    treenode *
    tree_zero_shrink(treenode *node, unsigned long sh_arr[],
		     unsigned long *min, unsigned long lev);

    treenode *
    tree_dc_shrink(treenode *node, unsigned long sh_arr[],
		   unsigned long *min);

    tree
    tree_shrink_prepare(char shrinkvar[], unsigned long **, unsigned long *);

    unsigned long tree_count_signature(treenode *, unsigned long[]);
    void tree_count_literals(treenode *, unsigned long[], unsigned long[]);
    void tree_count_compressed_literals(treenode *, unsigned long[],
					unsigned long[]);
    unsigned long tree_count_literal_sums(treenode *, unsigned long *,
				          unsigned long *, unsigned long *);

    int tree_contains(treenode *);
    int tree_extract_multiple(treenode *tn, char *term);

    //==================================================================
    // Diese Funktion dient zum Ausgeben von Pfadlisten (FDD = pi-Terme,
    // BDD = cubes, EDD = PI-Terme). Diese Listen koennen entweder in
    // eine Datei geschrieben werden, in die Logfiles, oder in ein Array
    // im Hauptspeicher. WIE und WOHIN alles geschrieben wird, muss vor
    // dem Aufruf von tree_put_paths() in diesen globalen Variablen
    // festgelegt werden.
    void tree_put_single_path();
    void tree_put_paths(treenode *); // Gib den Baum aus, wie er ist.
    void tree_put_disj_opti(treenode *node); // Finde enthaltene disjunkte DCs.
    static int
      tp_verbo;         // Verbosity, falls auf Konsole/Logfiles ausgegeben
                        // wird.
    static unsigned long
      tp_mode,		// Wie soll der Baum ausgegeben werden?
      tp_sink,		// Wohin soll der Baum ausgegeben werden?

      //------- Beim Schreiben des Baums in ein Array -----------------
      tp_no_inputs,	// Anzahl der Ebenen des Baums.
      tp_no_outputs,	// Wieviele Baeume sollen "parallel" ausgegeben
      			// werden? PLA-maessige Ausgabe.
      tp_no_cubes_max,	// Wieviele Elemente passen in die Arrays tp_in_cubes
			// und tp_out_cubes?
      tp_cube_cnt;	// Wieviele Elemente sind in diese Arrays schon
      			// eingetragen?
    static char
      *tp_tag,		// Enthaelt den "Output-Cube".
      **tp_in_cubes,	// Array fuer die Zeiger der Pfade.
      **tp_out_cubes;	// Array fuer die Zeiger der "Output-Cubes"

      //------- Beim Schreiben des Baums in eine Datei -----------------
    static FILE
      *tp_stream;	// Soll die Ausgabe auf eine Datei gehen, so steht
			// hier der Ausgabestrom drin.
    //==================================================================

    void tree_ordertrans(treenode *node, unsigned long *new_order,
                         treenode **new_tree);

    void tree_spread(treenode *in1, treenode *in2,
    		     treenode **out1, treenode **out12, treenode **out2);

    void tree_divide_rec(treenode *f, const treenode *q,
			 treenode **p, treenode **r,
			 treenode *OneTree, treenode *ZeroTree);

    treenode *tree_invert(treenode *node);
    treenode *tree_intersect(treenode *in1, treenode *in2);
    treenode *tree_union(treenode *in1, treenode *in2);
    treenode *tree_xunion(treenode *in1, treenode *in2);
    treenode *tree_flip_zeropath(treenode *in, unsigned long level);
    treenode *tree_crossmerge(treenode *in1, treenode *in2);
    treenode *tree_filter_paths(treenode *tn, unsigned long lev);
    treenode *tree_filter_level(treenode *tn, unsigned long lev);
    treenode *tree_flip_0dc(treenode *tn, unsigned long lev);
    treenode *tree_flip_1dc(treenode *tn, unsigned long lev);
    treenode *tree_sel_flip_1dc(treenode *tn, char *chng_pol,
				unsigned long lev, unsigned long min_lev);
    treenode *tree_sel_flip_01(treenode *tn, char *chng_pol,
			       unsigned long min_lev);

    treenode *tree_flip_01_atlevel(treenode *node, unsigned long lev);
    treenode *tree_flip_1dc_atlevel(treenode *node, unsigned long lev);

    treenode *tree_cut_literal_paths(treenode *node, unsigned long lits[]);
    treenode *tree_cut_literal_paths(treenode *node, unsigned long lit);
    treenode *tree_cut_dc_paths(treenode *node, unsigned long lit);

    treenode *tree_exchange_levels(treenode *tn, unsigned long ex_lev);
       
    void tree_print(treenode*, unsigned long, unsigned long);

    void set_flag(treenode *n)          { n->flag = flag_threshold; };
    unsigned long get_flag(treenode *n) { return n->flag == flag_threshold; };
    void tree_soft_reset_flag(treenode *);
    void tree_reset_flag(treenode *);
    friend void global_reset_flag();
    friend void global_soft_reset_flag();

    friend void tree_sim_grp_info();

    int tree_fetch_rightmost_path(treenode *node, char path[],
				  unsigned long lev);
    int tree_fetch_leftmost_path(treenode *node, char path[],
				 unsigned long lev);
    int tree_fetch_next_path(treenode *node, char path[], unsigned long lev);

    void add_levels_base(unsigned long levels);
    void treeCopyMove (treenode *src, treenode * &dest, unsigned long levels,
                       treenode *rest);

    char *printEquation (char lit, char neglit, char nolit, char incube,
			 char betwcube, char *noCubes, char *nrLitEven,
			 char *nrLitOdd);

  public:

    void addLevelsEnd (unsigned long levels, char dc01 = '-');
    tree tree_prepare_divide(tree &q);

    friend int clear_caches();

    tree() {
      level_no = 0;
      root     = Mpty;
    };

    tree(unsigned long levels) {
      level_no = 0;
      root     = Mpty;
      reset_level_no(levels); 
    };

    tree(const tree &);

    ~tree() {
      if(root != 0)
        tree_clear(root);
      if(level_no > 0)
        delete polarity;
    };

    int fetch_path(char last_path[]);
    int fetch_right_path(char path[]);

    int contains(char pattern[]);
    int extract_multiple(char *term, char *multterm);

    int is_singlepath() {
      return tree_is_single_path(root);
    };

    //================================================================
    // Loesche den Baum. Ebenenanzahl und Polaritaet bleiben
    // unveraendert.
    void clear();
    //================================================================

    unsigned long count_literal_sums(unsigned long *zero = 0,
			             unsigned long *one = 0,
			             unsigned long *dontc = 0);

    unsigned long count_signature(unsigned long **ones);
    void count_inputwise(unsigned long mode,
			 unsigned long **zeroes,
			 unsigned long **ones);
  
    void count_signature(unsigned long **zeroes, unsigned long **ones) {
      count_inputwise(CountSignature, zeroes, ones);
    };

    void count_literals(unsigned long **zeroes, unsigned long **ones) {
      count_inputwise(CountLiterals, zeroes, ones);
    };

    void count_compressed_literals(unsigned long **zeroes,
				   unsigned long **ones) {
      count_inputwise(CountCompressedLiterals, zeroes, ones);
    };

    //================================================================
    // Setzt die Anzahl der Ebenen eines Baums neu. Der Baum wird
    // dabei geloescht. Optionales Argument: neue Polarity.
    void reset_level_no(unsigned long, char *polarity = 0);

    // Wieviele Ebenen hat der Baum?
    unsigned long get_level_no() const { return level_no; };

    // Wieviele Ebenen hat der hoechste Baum im System?
    friend unsigned long get_global_level_no();
    //================================================================

    //================================================================
    // Setzen/Lesen der Polaritaet der Funktion
    // set_pol(): Keine Transformation! Der Polaritaetsstring einer
    // Funktion wird nur geaendert. Der Baum der Funktion bleibt
    // unberuehrt.
    void set_pol(char *);
    void get_pol(char *);
    //================================================================

    //================================================================
    // Erzeugen eines ...
    void make_erroneous() {
      if(root != 0)
        root = tree_clear(root);
    };
    // ... Fehlerobjekts.
    //================================================================

    //================================================================
    // Testen des ...
    unsigned long is_erroneous() {
      return (root == 0);
    };

    unsigned long is_empty() {
      return (root == Mpty);
    };
  
    unsigned long is_leaf() {
      return (root == Leaf);
    };

    unsigned long is_zeropath() {
      return (root == zeropaths[level_no]);
    };
    
    // ... Baumstatus.
    //================================================================

    void reset_flag() {
      tree_reset_flag(root);
    };

    //================================================================
    // Setzt die Zeichenkette, die zu Beginn jeder Fehlermeldung der
    // Klasse tree ausgegeben wird.
    friend void set_message_head(char *);
    //================================================================

    //================================================================
    // Gibt die Anzahl aller Knoten im tree-System aus.
    friend unsigned long get_global_node_no();
    //================================================================

    unsigned long count(unsigned long mode);
    tree tree_extract(unsigned long mode);

    double count_entropy(void);  // Berechnen der Entropie eines xDD

    tree convertpath(char path[]);
    //tree operator=(char path[]);
    tree& operator=(const tree &);
    int operator==(const tree &);

    tree orderflip_base(unsigned long flip_pos);
    tree ordertrans_base(unsigned long new_order[],
			 unsigned long mode = OT_PATHWISE,
			 unsigned long path_no = 0);
  
    //================================================================
    // Ausgabefunktionen fuer TREEs
    void print(FILE *fp, char *tag, unsigned long mode, int verbosity);

    // Diese Funktion wird von den drei Folgenden benutzt.
    friend unsigned long tree_array_out(tree *tree_arr, unsigned long no_outp);

    // Ausgabe der Pfadmengen eines TREE-Arrays in ein Array von Strings.
    friend unsigned long tree_array2memory(
      tree *tree_arr,		// Diese TREEs werden ausgegeben.
      unsigned long no_outp,	// Soviele Elemente hat *tree_arr.
      char **in_cubes,		// Array fuer Zeiger auf die Pfade
      char **out_cubes,		// Array fuer Zeiger auf die "Output-Cubes"
      unsigned long max_cube_no,// So lang sind die Arrays in_cubes und
				// out_cubes
      // Die Arrays in_cubes und out_cubes muessen auf die Groesse max_cube_no
      // geNEWt an tree_array2memory() uebergeben werden. tree_array2memory()
      // allokiert dann per NEW die einzelnen Strings fuer die Pfade und
      // "Output-Cubes" selbst.
      unsigned long mode);	// Schreibmodus (siehe Steuerargumente oben)
				// Beachten der Polaritaet, Cubes/PI-Terme
    // tree_array2memory() gibt als Funktionswert die Anzahl der Cubes der
    // Funktionen wieder.
    // Sei ncubes der Rueckgabewert:
    // ncubes <= max_cube_no:
    //   in_cubes[0] bis in_cubes[ncubes - 1] und out_cubes[0] bis
    //   out_cubes[ncubes - 1] enthalten die Pfade bzw. Ausgangscubes
    // ncubes > max_cube_no:
    //   die Pfade, die nicht mehr in in_cubes bzw. out_cubes gepasst
    //   haben, werden einfach weggelassen.
    
    //ausgabe eines trees in x11 window
    int xdraw(int);

    // Ausgabe der Pfadmengen eines TREE-Arrays in eine Datei
    friend void tree_write_array(
      FILE *fout,		// Ausgabe-Strom
      tree *tree_arr,
      unsigned long no_outp,
      unsigned long mode);

    // Ausgabe der Pfadmengen eines TREE-Arrays auf Logfiles
    friend void tree_log_array(
      tree *tree_arr,
      unsigned long no_outp,
      unsigned long mode);

    //================================================================
    // Verschiedene Daten ueber die interne Baum/Funktions-Repraesentation
    // ausgeben (hauptsaechlich zu Debug-Zwecken (siehe Steuerargumente oben)
    friend void tree_print_statistics(unsigned long mode);
    //================================================================
};

inline tn_ptr_int::~tn_ptr_int() {
  if(nd) tree_empty(nd);
}; 

inline tn_ptr::~tn_ptr() {
  if(node) tree_empty(node);
};

inline tn_ptr_pair::~tn_ptr_pair() {
  if(nd1) tree_empty(nd1);
  if(nd2) tree_empty(nd2);
}; 

inline tn_ptr_triple::~tn_ptr_triple() {
  if(nd1) tree_empty(nd1);
  if(nd2) tree_empty(nd2);
  if(nd3) tree_empty(nd3);
}; 

inline unsigned long get_global_node_no()
{
  return tree::overall_node_no;
}

#endif
