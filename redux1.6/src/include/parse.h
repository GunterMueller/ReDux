[ Header file for ReDuX - parser -Subsystem ]
[ contains external macro declarations      ]

[=================]
[ Data structures ]
[=================]


[---------------------------------------------------------------------]
[ Signature object trie                                               ]
[ =====================                                               ]
[                                                                     ]
[ The signature object trie is a data structure used by the scanner.  ]
[ It contains the strings of the symbols stored in a trie together    ]   
[ with pointers to the associated signature objects.                  ]
[                                                                     ]
[ A signature object is either                                        ]
[      * an operator (including coercion operators)                   ]
[      * a constant                                                   ]
[      * a variable                                                   ]
[      * or a closing roundfix symbold represented as pseudo operator ]
[                                                                     ]
[ Data structure                                                      ]
[ --------------                                                      ]
[ Signature Object Trie                                               ]
[           = (Pointer to) Signature Object Trie Node (SOT)           ]
[ Signature Object Trie Node (SOT...)                                 ]
[           = Container of  Trie Signature Object Cells (SOTC)        ]
[ Signature Object Trie Cell (SOTC...)                                ]
[           = Character  (SOTCCHAR)                                   ]
[           + Pointer to (next) Signature Object Trie Node (SOTCSONS) ]
[           + Signature Object (SOTCSGOB)                             ]
[                                                                     ]
[ for the time being "Container" is a list sorted w.r.t.  SOTCCHAR    ]
[---------------------------------------------------------------------]


const
    SOTEMPTY    = (),
                  [empty Signature Object Trie Node.]
    SOTFIRST(T) = FIRST(T),
                  [first cell in Signature Object Trie Node T.]
    SOTNEXT(T)  = RED(T),
                  [all but first cells in Signature Object Trie 
                   Node T.]
    SOTPREP(C,T)= COMP(C,T).
                  [C is smaller than all cells in T: 
                   prepend cell C to Signature Object Trie T.]

[ Signature Object Trie Cell ]

const
    SOTCCONS(c,T,s) = COMP3(c,T,s,()),
                      [Construct Symbol Trie Cell from character c,
                       Signature Object Trie Node T and symbol s.]
    SOTCCHAR(C)     = FIRST(C),
                      [Character field of Signature Object Trie Cell C.]
    SOTCSONS(C)     = SECOND(C),
                      [Pointer to Sons of Signature Object Trie Cell C.]
    SOTCSGOB(C)     = THIRD(C).
                      [Symbol field of Signature Object Trie Cell C.]
    

[----------------------------]
[ Parser variable dictionary ]
[----------------------------]

               [The empty parser variable dictionary is ().          ]
     const
     PDVARNAME(PD) = FIRST(PD),
               [PDVARNAME is the first variable name in dictionary PD.]
     PDVARLIST(PD) = SECOND(PD),
               [PDVARLIST is the index-variable list of the variable  ]
               [with name PDVARNAME(PD).                              ]
     PDVARNEXT(PD) = RED2(PD),
               [PDVARNEXT is the parser variable dictionary PD without]
               [the first variable name and index-variable list.      ]
     PDVARCONS(n,vl,PD) = COMP2(n,vl,PD),
               [PDVARCONS is the parser variable dictionary           ]
               [constructor. Variables with name n and indices of     ]
               [index-variable list vl are added to the dictionary PD.]
     PDVLINDEX(V) = FIRST(V),
               [PDVLINDEX is the first variable index in index-       ]
               [variable list V.                                      ]
     PDVLVAR(V)   = SECOND(V),
               [PDVLVAR is the variable signature object with index   ]
               [PDVLINDEX(V).                                         ]
     PDVLNEXT(V)  = RED2(V),
               [PDVLNEXT is the variable list without the first index ]
               [variable pair of V.                                   ]
     PDVLCONS(i,v,V) = COMP2(i,v,V).
               [PDVLCONS is the variable list constructor. Variable   ]
               [signatur object v with index i is added to the        ]
               [variable list V.                                      ]

[----------------]
[ Ambiguity list ]
[----------------]

               [The empty ambiguity list is ().                       ]
     const
     AMBNAME(AL) = FIRST(AL),
               [AMBNAME is the first object name of ambiguity list AL.]
     AMBCONT(AL) = SECOND(AL),
               [AMBCONT is the continuation ambiguity list of         ]
               [ambiguity list AL.                                    ]
     AMBNEXT(AL) = RED2(AL),
               [AMBNEXT is the ambiguity list AL without the first    ]
               [name continuation pair of AL.                         ]
     AMBCONS(n,c,AL) = COMP2(n,c,AL).
               [AMBCONS is the ambiguity list constructor. Object name]
               [n and continuation c are added to ambiguity list AL.  ]

[-------------------------------------]
[ Fixity property list                ]
[                                     ]
[ variant record                      ]
[    standard: 2 cells                ]
[    for round fix operators: 4 cells ]
[-------------------------------------]

     const
     FXPLIND(P) = FIRST(P),
                  [Fixity property list, indicator.]
     FXPLFIX(P) = SECOND(P),
                  [Fixity property list, fixity.]
     FXPLCIN(P) = THIRD(P),
                  [Fixity property list, 
                   indictor of closing roundfix symbol.]
     FXPLCRS(P) = FOURTH(P),
                  [Fixity property list, closing roundfix symbol.]
     FXPLCRP(P) = RED2(P).
                  [Fixity property list of closing roundfix symbol
                   within fixity property list.]

[===========]
[ Constants ]
[===========]

[------------------]
[ Parser constants ]
[------------------]

[pseudo terminals to allow different start symbols]
const
  SNONE = 0,            [dummy start symbol                           ]
  STERM = 1,            [start term parser                            ]
  SAXIOM = 2,           [start axiom parser                           ]
  SDATATYPE = 3,        [start datatype parser                        ]
  SOPERATOR = 4,        [start operator parser                        ]
  SOPSET = 5,           [start operator set parser                    ]
  SAXSET = 6,           [start axiom set parser                       ]
  SCONSTSET = 7,        [start constant set parser                    ]
  SVARSET = 8,          [start variable set parser                    ]
  SOPRELOPLIST = 9.     [start operator-relation-operator list parser ]

[-----------------]
[ Write constants ]
[-----------------]

[term output: parentheses]
const                   [parentheses always for:                      ]
  TOPLOWPREC = 1,       [lower precedence of main term                ]
  TOPEQPREC  = 2,       [equal precedence main term - subterm         ]
  TOPASSOC   = 4,       [associativity                                ]
  TOPLISPARG = 8,       [lispfix operator's infix arguments           ]
  TOPPREARG  = 16,      [prefix argument                              ]
  TOPPOSTARG = 32,      [postfix argument                             ]
  TOPINFIX   = 64.      [around infix operator and arguments          ]

[term output: debugging]
const
  TODEBUG = 128.        [normal debug mode                            ]

[data type output: rescannable]
const
  DTORSCAN = 256.

[output: full debugging]
const
  OFULLDEBUG = 512.     [extended debug mode                          ]


[standard output modes: sparse, normal, complete]
const
  OMSPARSE   = 0,
  OMNORMAL   = TOPASSOC + TOPLISPARG,
  OMCOMPLETE = TOPLOWPREC + TOPEQPREC + TOPASSOC +
               TOPLISPARG + TOPPREARG + TOPPOSTARG +
               TOPINFIX.
