[ Header file for ReDuX - tp - Subsysstem ]
[ contains external macro declarations    ]

[===========]
[ Constants ]
[===========]

[-------------------]
[ Boolean constants ]
[-------------------]

     const TRUE   = 1, FALSE  = 0.
           [ The constants TRUE and FALSE may be obsolete ]
           [ with future   ALDES compilers.               ]

[----------------------------------------]
[ Critical pair essentiality information ]
[----------------------------------------]

     const ESS=1, INESS=0.

[=========================================================]
[ Redeclaration of access funtions to                     ]
[    the i-th element selectors of a list and to          ]
[    the i-th reductum selector of a list                 ]
[=========================================================]

     const
     RED(L)   =SPACE[L-BETA],
     RED2(L)  =RED(RED(L)),
     RED3(L)  =RED(RED2(L)),
     RED4(L)  =RED(RED3(L)),
     RED5(L)  =RED(RED4(L)),
     RED6(L)  =RED(RED5(L)),
     RED7(L)  =RED(RED6(L)),
     RED8(L)  =RED(RED7(L)),     
     FIRST(L) =SPACE[L-BETA1],
     SECOND(L)=FIRST(RED(L)),
     THIRD(L) =FIRST(RED2(L)),
     FOURTH(L)=FIRST(RED3(L)),
     FIFTH(L) =FIRST(RED4(L)),
     SIXTH(L) =FIRST(RED5(L)),
     SEVNTH(L)=FIRST(RED6(L)),
     EIGHTH(L)=FIRST(RED7(L)).



[=================]
[ Data structures ]
[=================]

[--------------------------------------------------------------------]
[  Terms:                                                            ]
[                                                                    ]
[  ______________________________________________________            ]
[  | TCONT   | TKIND | TTYPE  | TUSTAT |        | TNAME |  TPROP     ]
[  | OARGLST |       | ORTYPE |        | ODTYPE |       |  ------>   ]
[  | VARBIND |       |        |        |        |       |            ]
[  | XOBJECT |       |        |        |        |       |            ]
[  1_________2_______3________4________5________6_______7            ]
[  ^         ^                                                       ]
[  |         |                                                       ]
[  t       TSIGN(t)                                                  ]
[--------------------------------------------------------------------]

     const
     TCONT(T)=FIRST(T),
              [TCONT is the content of term T.]
     TSIGN(T)=RED(T),
              [TSIGN is the signature of the top operator of term T.]
     TKIND(T)=SECOND(T),
              [TKIND is the kind of term T.]
     TTYPE(T)=THIRD(T),
              [TTYPE is the type of term T.]
     TUSTAT(T)=FOURTH(T),
              [TUSTAT is unification status of T. () for free operator.]
     TNAME(T)=SIXTH(T),
              [TNAME is the name of term T.]
     TPROP(T)=RED6(T).
              [TPROP is the property-list of term T.]

[------------------------------]
[ Operator (overlay with term) ]
[------------------------------]

     const
     OARGLST(F)=FIRST(F),
               [OARGLST is the argument list of the term with top
                operator F.]
     ODTYPE(F)=FIFTH(F),
               [ODTYPE is the domain-type-list of operator F.]
     ORTYPE(F)=THIRD(F).
               [ORTYPE is the range-type of operator F.]


     [ Properties of operators:
         indicator meaning                  values
         ========= =======                  ======
           DAV     argument variable        variable of argument type
                   (only used for AC op.)
     ]

[------------------------------]
[ Variable (overlay with term) ]
[------------------------------]

     const
     VARBIND(V)=FIRST(V).
              [Binding information of variable.]

[-------------------------------------]
[ External object (overlay with term) ]
[-------------------------------------]

     const
     XOBJECT(X)=FIRST(X),
              [External object pointed to by coercion operator.]
     XOBTYPE(F)=FIRST(ODTYPE(F)),
     OXTYPE(F)=FIRST(ODTYPE(F)).     [to be replaced]
               [OXTYPE is the external type introduced by an
                external operator F.                         ]


[------------------------------------------------------------]
[ Axiom a = (l <-> r) (equation or rewrite rule resp.)       ]
[                                                            ]
[  ______________________________________________            ]
[  | ALHS    |ALHSV  | ARHS   | ANUM   | ALLB   |            ]
[  |         |       |        |        |        | --> APROP  ]
[  1___|_____2_______3________4___|____5________6            ]
[      |                 |        |                          ]
[      V                 V        V                          ]
[      l               Var(l)     r                          ]
[------------------------------------------------------------]

     const
     ALHS(A)  =FIRST(A),
               [ALHS is the left-hand side of axiom A.]
     ALHSV(A) =SECOND(A),
               [ALHSV is the list of the variables in the
                left-hand side of axiom A, the variable set of A.]
     ALLB(A)  =FIFTH(A),
               [ALLB is the left-linearity bit in axiom A.]
     ARHS(A)  =THIRD(A),
               [ARHS is the right-hand side of axiom A.]
     ANUM(A)  =FOURTH(A),
               [ANUM is the number of axiom A.]
     APROP(A) =RED5(A).
               [APROP is the property-list of axiom A.]


     [ Properties of axioms:
         indicator meaning                  values
         ========= =======                  ======
           DXR     extension rule AC        pointer to extension rule
     ]

[-------------------------------------]
[ Data type (Algebraic specification) ]
[-------------------------------------]

     const
     DTNAME(T) =FIFTH(T),
                [DTNAME is mane of dat type T.]
     DTCONST(T)=SECOND(T),
                [DTCONSTS contains the contant set of the data type T.]
     DTVARS(T) =THIRD(T),
                [DTVARS contains the variable set of the data type.]
     DTOPERS(T)=FOURTH(T),
                [DTOPERS contains the operator set of the data type.]
     DTAX(T)   =FIRST(T),
                [DTAX is the axiom set of T.]
     DTSORTS(T)=SIXTH(T),
                [DTSORTS contains the sorts of T.]
     DTXSORTS(T)=SEVNTH(T),
                [DTXSORTS contains the external sorts of T.]
     DTSYMTAB(T)=EIGHTH(T),
                [DTSYMTAB contains the list of all signature objects
                 (i.e., constants, variables, (coercion) operators) in 
                T.]
     DTPROP(T)=RED8(T).
               [DTPROP is the property list of data-type T.]

[----------------]
[ Critical pairs ]
[----------------]

const
     CPLHS(CP)=SECOND(CP),
               [CPLHS is the left-hand-side of critical pair CP.]
     CPLOI(CP)=FOURTH(CP),
               [CPLOI is the left origination information of
                critical pair CP.]
     CPRHS(CP)=THIRD(CP),
               [CPRHS is the right-hand-side of critical pair CP.]
     CPW8(CP) =FIRST(CP),
               [CPW8 is the weight of critical pair CP.]
     CPESS(CP)=SECOND(RED4(CP)).
               [CPESS  states if the critical pair is essential.]

[--------------]
[ Substitution ]
[--------------]

      const
      SUBASS(S)=FIRST(S),
                [SUBASS is the assignment list of the substiution S.  ]
                [ A list of period 2 with variables in the odd        ]
                [positions and their substiution terms in the         ]
                [following positions. The substitution terms are      ]
                [assumed to be unbound.                               ]
      SUBIMG(S)=RED(S),
                [SUBIMG is the image of the substitution S. A List of ]
                [variables.   -- NOT YET USED  --                     ]
      SUBIDTY  =LIST1(()),
                [Identity substitution.                               ]
      SUBDOM(S)=LP2ODD(FIRST(S)),
                [SUBDOM is a list of variables, the domain of S.      ]
                [If x <- x is explicitely noted in S then x will      ]
                [occur in SUBDOM(S).                                  ]
      SUBRNG(S)=LP2EVE(FIRST(S)),
                [SUBRNG is a list of the terms of the substitution S. ]
                [There may be () `terms' in SSUBRNG(S).               ]
      SUBCONS(x,t)=SBCONS(ASCONS(x,t,ASSIDTY)).
                [ Construct substitution {x <- t}.                    ]

[----------------------------------------------]
[ Assignment list  (as used for substitutions) ]
[----------------------------------------------]

      const
      ASSVAR(A)=FIRST(A),
                [ASSVAR is the first variable of assignment list A.   ]
      ASSTRM(A)=SECOND(A),
                [ASSTRM is the substitution value of the first        ]
                [variable of assignment list A.                       ]
      ASSNXT(A)=RED2(A),
                [ASSNXT is the assignment list A without the first    ]
                [variable term pair of A.                             ]
      ASSIDTY  =().
                [Assignment list of identity substitution.            ]

[---------------------]
[ Variable dictionary ]
[---------------------]

                [The empty variable dictionary is ().]
     const
     VDNAMES(N)=FIRST(N),
                [VDNAMES is the signatue list entered into N. It is a
                 list of period 2 where in the odd positions are
                 variable signatures and in the following position is
                 the number of different occurences of that signature
                 minus 1.]
     VDINDEX(N)=SECOND(N).
                [VDINDEX is the index list. It is a list of period 2
                 where in the odd positions are variables and in the
                 following position is the index of their external
                 representation (0 means no index).]
