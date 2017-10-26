[ Header file for ReDuX - IC - subsysstem ]
[ contains external macro declarations    ]
[ needs tp.h as header file               ]

[ #include tp.h ]

[===========]
[ Constants ]
[===========]

     const UNEXT = 2.          [Mark for unextendable node]


[=================]
[ Data structures ]
[=================]

[----------------------]
[  Top set tree nodes  ]
[----------------------]

     const
     NTSLAB(N)=FIRST(N),
              [NTSLAB is the label of top set tree node N, a term.]
              [       or () if the node is deleted.               ]
     NTSLEV(N)=SECOND(N),
              [NTSLEV is the generation level of top set tree node N.]
     NTSFAT(N)=THIRD(N),
              [NTSFAT is the father of top set tree node N.]
     NTSGRD(N)=FOURTH(N),
              [NTSGRD is a 3-valued flag which is TRUE iff the label  ]
              [of (pruned) top set tree node N is a ground term.      ]
              [UNEXT if it is unextendable and non-ground and FALSE   ]
              [otherwise.                                             ]
     NTSPSL(N)=FIFTH(N),
              [NTSPSL is the principal subterm list of top set tree ]
              [node N i. e. the list of all nodes whose label is    ]
              [equal to the corresponding term in the argument list ]
              [of the label of N.                                   ]
     NTSSUC(N)=SIXTH(N),
              [NTSSUC is the list of children of top set tree node N.]
     NTSURL(N)=SEVNTH(N),
              [NTSURL is the list of rule whose left-hand side  ]
              [unify with the label of the top set tree node N. ]
     NTSMCA(N)=EIGHTH(N).
              [NTSMCA contains a mark for the closure algorithm.     ]
              [Possible values: 0 - Mark not set;                    ]
              [                 1 - Node has ground successors       ]
              [                     (permanent);                     ]
              [                 2 - Mark set for next step of closure]
              [                     (to be cleared afterwards).      ]
