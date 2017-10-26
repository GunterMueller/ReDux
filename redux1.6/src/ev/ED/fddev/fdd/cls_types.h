//-*-C++-*-
#ifndef CLSTYPES_H
#define CLSTYPES_H

enum copy_circumference{ //fuer vertex copy
  STUB_AND_OUTPUTS = 1,
  STUB_AND_INPUTS = 2,
  COPY_ALL = 3
};
enum net_types{
  NMIN   = 1,
  NPI    = 1,    // Primary Input
  NPO    = 2,    // Primary Output
  NCLK   = 3,    // Clock
  NLATCH = 4,    // Latch
  NDEF   = 5,    // Default
  NUNDEF = 6,    // Undefined
  NMAX   = 6
};

enum blif_modes {
  BLIF_STRICT_VIO  = 1, // Undefinierte und unbenutzte Signale beim Blif-Lesen
                        // bemeckern. (VIO = vertex input output)
  BLIF_INFER_PIN   = 2,
  BLIF_INFER_POUT  = 4,
  BLIF_DO_ORDEROPT = 8,
  BLIF_IN_PROGRESS = 16,
  BLIF_RESOLVED    = 32,
  BLIF_GATE_SUBCKT = 64,
  BLIF_DISCRD_MULT = 128
};

enum latch_types {
  FALL_EDGE, RISE_EDGE, ACT_HIGH, ACT_LOW, ASYNC, UNSPEC_LATCH_TYPE
};

enum latch_pin_types{
  D, C, CE, SD, RD, GR, Q, UNDEF };

enum latchInputNames {
  LATCH_INPUT_NOT_REPRESENTED = -1,
  LATCH_INPUT_DATA            = 0,
  LATCH_INPUT_CLOCK           = 1,
  LATCH_INPUT_CLOCK_ENABLE    = 2,
  LATCH_INPUT_SET_DATA        = 3,
  LATCH_INPUT_RESET_DATA      = 4,
  LATCH_NUMBER_INPUTS         = 5
};

enum latch_initvals {
  LIV_ZERO      = 0,
  LIV_ONE       = 1,
  LIV_DONT_CARE = 2,
  LIV_UNKNOWN   = 3
};

#define DO_RESET 1

enum access_types {
  RO, RW, UNSEC};

enum rmt_types{
  ALL2BDD, ALL2EDD, ALL2FDD, EXOR };

enum collapse_types {
  nuttin    = 0x00,
  stop_n    = 0x01,
  equal_dom = 0x02,
  force_dom = 0x04,
  sym_or_mon= 0x08,
  force_all = 0xff};

enum dcmp_t {BEST,
	     DISJOINT,
	     GROUP_BEST,
	     GROUP_AND,
	     GROUP_OR,
	     GROUP_XOR,
	     GROUP_AND_WEAK,
	     GROUP_OR_WEAK};

enum  Domain {
  op      = 1,
  dom_bdd = 1,
  func    = 2,
  dom_fdd = 2,
  dom_edd = 3,
  undef   = 4
}; 

enum x_show_mode{
  GNU_EDGE,GRAPHPLACE,XVCG,ID,NAME,NODE,EDGE,SUB,ALL};

enum shrink_t {
  DO_SHRINK, NO_SHRINK};

enum sig_compare_res {
  SIG_EQUAL    = 0,
  FLT_PATH_BDD,
  FLT_PATH_FDD,
  FLT_PATH_EDD,
  FLT_SIG_BDD,
  FLT_SIG_FDD,
  FLT_SIG_EDD,
  FLT_LEV  
};

//die Deklarationen der Klassen
class treenode;
class tree;
class BDD;
class EDD;
class FDD;
class Fct;
class UniversalFct;
class EdgeList;
class Edge;
class VertexSet;
class Vertex;
class Circuit;

typedef Vertex *VertexPtr;
typedef unsigned long ulong;

#endif
