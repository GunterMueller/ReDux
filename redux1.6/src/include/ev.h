[ Header file for ReDuX - ev - Subsysstem ]
[ contains external macro declarations    ]

[=================]
[ Data structures ]
[=================]

[-----------------------------------]
[     Dictionary entry e:           ]
[                                   ]
[  _______________________________  ]
[  |         |         |         |  ]
[  | DCEINTP | DCETERM | DCENAME |  ]
[  1_________2_________3_________|  ]
[  ^                                ]
[  |                                ]
[  e                                ]
[-----------------------------------]

     const
     DCECONS(i,t,n)=(i,t,n),
              [DCECONS construct dictionary entry.]
     DCEINTP(e)=FIRST(e),
              [DCEINTP is the external interpretation of DCETERM(e).]
     DCETERM(e)=SECOND(e),
              [DCETERM is the term.]
     DCENAME(e)=THIRD(e).
              [DCENAME is the name (string) of the term DCETERM(e).]


[

Dictionary d:

A dictionary is a ordered list of dictionary entries. The rank of the 
entry is the position in the dictionary. The i-th entry is the entry 
with rank i. The rank of the dictionary is LENGTH(d).

A incomplete dictionary entry is dictionary entry with DCEINTP(e) = nil 
(the interpretation is not entered).

A real pre-dictionaly is a dictionary with at least one incomplete
dictionary entry.

A pre-dictionaly is a ordered list of incomplete dictionary entries or 
dictionary entries.

So a pre-dictionary may be a dictionary. 

A pseudo dictionary is a empty list, or a list of length r of empty 
lists. Pseudo dictionarys are used to entered term with external 
interpretations (an coercion operator with an external interpretation 
as contents).
 
]

     const
     EMPTYPDC = (),
              [Empty (pre-)dictionary.]
     PDCINSE(e,d)=COMP(e,d),
              [PDCINSE  pre-dictionary insert entry.]
     PDCSIZE(p)  =LENGTH(p).
              [PDCSIZE number of entries in a (pseudo) dictionary.]

[-------------------------]
[  External object X:     ]
[                         ]
[  ____________________   ]
[  |         |         |  ]
[  | XOBJDIC | XOBJINT |  ]
[  1_________2_________|  ]
[  ^                      ]
[  |                      ]
[  X                      ]
[-------------------------]

     const
     XOBJCON(d,i)=(d,i),
              [XOBJCON construct external object from the dictionary
               d and the interpretation i.]
     XOBJDIC(X)=FIRST(X),
              [XOBJDIC is the dictionary of the external object X.]
     XOBJINT(X)=SECOND(X).
              [XOBJINT is the interpretation of the external object X.]


[

External term:

An external term is an external object as contents of an coercion 
operator.

]


[------------------------------------------]
[ Term with replacement position (TRP).    ]
[ conceptional data structure:             ]
[ consisting of a term t and               ]
[               a cell r containing a      ]
[                 pointer to t or          ]
[                 () if t top-level object.]
[------------------------------------------]


[Evaluation candidates consist of a TRP and an external sort each.]

const
    EVCCONS(t,r,x) = (t,r,x),
                   [Construct evaluation candidate.]
    EVCTERM(e)   = FIRST(e),
                   [Extract term form e.]
    EVCRPOS(e)   = SECOND(e),
                   [Extract replacement position from e.]
    EVCSORT(e)   = THIRD(e).
                   [Extract external sort from e.]



[Constants for selection the evaluation strategy.]

const 
    purenorm=0,
    evalsupport=1,
    memorize=2.
