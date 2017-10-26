[This file contains some constant declarations and definitions
of global variables for the ReDuX random term generator.

The ReDuX random term generator needs version 3.7 (or above) of the
ALDES compiler to compile properly:

Due to a bug in the ALDES translator before version 3.7, multiply
indexed global unsafe arrays can't be used with these versions of the
translator. To avoid their usage, singly indexed arrays can be defined
which are accessed via macros that map the n-tuple of indices to an
index in the singly indexed array.  In the macro invocations,
parentheses have to be used instead of the square brackets which select
array components.

To translate the random term generator with an ALDES version prior to
3.7, comment out the declarations of multiply indexed arrays and
uncomment the declarations of  the corresponding singly indexed array
and the appropriate macro declaration. Replace every occurence of one
of the multiply indexed array by the corresponding macro, i.e.
parantheses have to be replaced by square brackets.]

[The following constant declarations are used to determine the
dimension of global arrays.]

const MAXPOS=2000,    [Max. # of positions in NT2TE, i,e, if MAXPOS is
                       set to 100, terms with extents from 0 to 100 can
                       be generated.
                       MAXPOS must set to a positive value.]
      MAXDEPTH1=100, [Max. depth plus 1 in NT2TD, i.e. if MAXDEPTH1 is
                      set to 100, terms with depths from 0 to 99 can be
                      generated.
                      MAXDEPTH1 must be set to a non-negative value.]
      MAXSORTS=10,   [Max. # of sorts.]
      MAXDOMS=10,    [Max. # of domains.]
      MAXOPPS=10,    [Max. # of non-nullary operators per sort.]
      MAXARITY=5,    [Max. arity of all operators.]
      MAXATOM=30,    [Max. # of atomic terms per sort.]
      MAXPOSINSTATS=10000.
                     [Max. # of positions which are considered
                      in the statistics routine TRGSPD.]


[The following definitions of global variables and macro-declarations
are used to handle information about the signature of the ReDuX data
type.  They start all with the prefix SD which is an abbreviation for
``signature descriptor''.]

global SDNAM. safe SDNAM.
          [Name of ReDuX data type.]

global SDSRT[MAXSORTS+1].
          [Sorts, last component contains actual # of sorts.]

global SDDOM[MAXDOMS+1].
          [Domains, last component contains actual # of domains.]

global SDOPS[MAXSORTS,MAXOPPS+1].
[global SDOSP[MAXSORTS*(MAXOPPS+1)].
const  SDOPS(s,o) = SDOSP[(s-1)*(MAXOPPS+1) + o].]
          [Non-nullary operators separated according to rtyp.
           The components SDOPS(s,MAXOPPS+1) contain the actual
           # of operators of rtyp s.]

global SDATM[MAXSORTS,2,MAXATOM+1].
[global SDATP[MAXSORTS*2*(MAXATOM+1)].
const  SDATM(s,d,a) = SDATP[((s-1)*2+(d-1))*(MAXATOM+1)+a].]
	       [Atomic terms (constants, variables, nullary operators
		     and external operators (with fixed TCONT-field))
		     separated according to sort and depth (0 or 1).
		     The components SDATM(s,d,MAXATOM+1) contain the
		     actual # of atomic terms of sort s and depth d+1.]

 
[The following variable definitions and macro-declarations
represent $\bar{N}_i$ (i=1,2,3).]

global NB1[MAXPOS].

global NB2[MAXPOS,MAXSORTS].
[global NB2P[MAXPOS*MAXSORTS].
const  NB2(p,s) =  NB2P[(p-1)*MAXSORTS + s].]

global NB3[MAXPOS,MAXSORTS,MAXOPPS].
[global NB3P[MAXPOS*MAXSORTS*MAXOPPS].
const  NB3(p,s,f) = NB3P[((p-1)*MAXSORTS+s-1)*MAXOPPS+f].]


[The following variable definitions and macro-declarations
represent $\bar{M}_i$ (i=1,2,3).]

global MB1[MAXDEPTH1].

global MB2[MAXDEPTH1,MAXSORTS].
[ --- no multi-dimensional arrays available:
 global MB2P[MAXDEPTH1*MAXSORTS].
 const  MB2(d,s) =  MB2P[(d-1)*MAXSORTS + s].
]

global MB3[MAXDEPTH1,MAXSORTS,MAXOPPS].
[--- no multi-dimensional arrays available:
 global MB3P[MAXDEPTH1*MAXSORTS*MAXOPPS].
 const  MB3(d,s,f) = MB3P[((d-1)*MAXSORTS+s-1)*MAXOPPS+f].
]


global DIPOS. safe DIPOS.
   [Data initialized for number of positions.  The global data arrays
    NB1, NB2, NB3 are initialized for terms with up to DIPOS
    positions.  DIPOS=0: The global arrays NB1, NB2, NB3 are
    un-initialized.]

global DIDPT. safe DIDPT.
   [Data initialized for depth.  The global data arrays MB1, MB2, MB3
    are initialized for terms with depth up to DIDPT.
    DIDPT=-1: The global arrays MB1, MB2, MB3 are un-initialized.]

global TGTRC. safe TGTRC.
   [Term generation trace.
    TGTRC=1: Some trace information is displayed while the terms
    are constructed.]
