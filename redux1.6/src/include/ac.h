
[=================]
[ Data structures ]
[=================]

    const
     CPORIEN(P) = SECOND(RED4(P)).
                  [Critical pair orientation,                 ]
                  [A character denoting the value of a call   ]
                  [to TPPO ('S' for straight, 'R' for reverse ]
                  [ --- overlay with CPESS ---                ]

[------------------------------------------------------]
[ Completion Strategy Control                          ]
[   contains setting to control a completion procedure ]
[------------------------------------------------------]

    const
     CSCCOUNT   = 7,
                  [number of switches in a simple CSC record   ]
     CSCSTPM(C) = FIRST(C),
                  [ Step mode switch. 0: automatic orientation ]
                  [                   1: manual orientation    ]
     CSCKCPN(C) = SECOND(C),
                  [ Keep critical pairs normalized.            ]
                  [ 0: critical pairs are normalized after     ] 
                  [    generation and before orientation       ]
                  [ 1: critical paairs are alway kept          ]
                  [    normalized                              ]
     CSCPFIE(C) = THIRD(C),
                  [ Priority for input equations.              ]
                  [ 0: input equations are selected as any     ]
                  [    other critical pair                     ]
                  [ 1: input equations are selected before any ]
                  [    other critical pair                     ]
     CSCPFCR(C) = FOURTH(L),
                  [ Priority for collapsed rules.              ]
                  [ 0: collapsed rules are selected as any     ]
                  [    other critical pair                     ]
                  [ 1: collapsed rules are selected before any ]
                  [    other critical pair                     ]
     CSCSCCR(C) = FIFTH(C),
                  [ Subconnectedness criterion for collapsed rules. ]
                  [ 0: Subconnectedness criterion is not applied    ]
                  [    to collapsed rules                           ]
                  [ 1: Critical pairs derived from a collapsed rule ]
                  [    are removed                                  ]
     CSCCGCP(C) = SIXTH(C),
                  [ Compute generalized critical pairs.        ]
                  [ 0: standard critical pairs are computed    ]
                  [ 1: generalized critical pairs are compted  ]
     CSCRDCP(C) = FIRST(RED6(C)),
                  [ Delete subsumed (redundant) critical pairs.]
                  [ 0: redundant critical pairs are kept.      ]
                  [ 1: redundant critical pairs are deleted.   ]
     CSCMXSY(C) = SECOND(RED6(C)),
                  [ Maximum symmetrization rounds.             ]
                  [ Number of orientations maximally performed ]
                  [ during a symmetrizatio process             ]
     CSCSYSC(C) = RED2(RED6(C)).
                  [ Symmetrization strategy control            ]
                  [ contains a full CSC record.                ]
