[ Header file for ReDuX - to - Subsysstem ]
[ contains external macro declarations    ]

[===========]
[ Constants ]
[===========]

[---------------------------------]
[ change coefficient algorithm id ]
[---------------------------------]

     const
     CLS1 = 1,
            [Change coefficient algorithm
             according Ben Cherifa and Lescanne solution 1.]
     CLS2 = 2.
            [Change coefficient algorithm
             according Ben Cherifa and Lescanne solution 2.]

[------------------------------]
[ choose monomial algorithm id ]
[------------------------------]

     const
     SDIF = 1.
            [Choose monomial algorithm: smallest difference.]

[=================]
[ Data structures ]
[=================]

[------------------------------------------------------------------]
[     Polynomial interpretation:                                   ]
[                                                                  ]
[  _______________                                                 ]
[  |      |      |                                                 ]
[  | RANK | POLY |                                                 ]
[  1______2______|                                                 ]
[  ^                                                               ]
[  |                                                               ]
[  p                                                               ]
[------------------------------------------------------------------]

     const 
     RANK(p) = FIRST(p),
               [RANK is the rank of a polynomial interpretation P.]
     POLY(p) = SECOND(p).
               [POLY is the polynomial of a 
                polynomial interpretation P.]

[------------------------------------------------------------------]
[     Polynomial ordering:                                         ]
[                                                                  ]
[   _____________________________                                  ]
[  |         |         |         |                                 ]
[  | PLYOCCA | PLYOCMA | PLYOINT |                                 ]
[  1_________2_________3_________|                                 ]
[  ^                                                               ]
[  |                                                               ]
[  P                                                               ]
[------------------------------------------------------------------]

     const
     PLYOCCA(P) = FIRST(P),
                  [PLYOCCA is the change coefficient algorithm id of
                   the polynomial ordering P.]
     PLYOCMA(P) = SECOND(P),
                  [PLYOCMA is the choose monomial algorithm id of
                   the polynomial ordering P.]
     PLYOINT(P) = THIRD(P).
                  [PLYOINT is the polynomial interpretation of
                   the polynomial ordering P.]

     const
     PLYOCOM(c*,m*,p,P) = COMP3(c*,m*,p,P).
                          [PLYOCOM is the composition of
                           the polynomial ordering P.]

     [PLYOADV(P;n,c*,m*,P') = ADV2(P;c*,m*,P').
                             [PLYOADV displays 
                              the polynomial ordering P.]]
