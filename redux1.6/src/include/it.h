[============================]
[ Interpreter constants      ]
[============================]

     const 
     PROCEDURE=0, 
     FUNCTION=1,
     ITMAXOUT=10, [Maximal number of output parameters per procedure.]
     ITMAXIN=10.  [Maximal number of input parameters per algorithm. ]

[============================]
[ Interpreter data structurs ]
[ for symbol table entries   ]
[ under inicator  DAK        ]
[ "algorithm key"            ]
[============================]

    const 
    ALGIDNT(A)=FIRST(A),
               [Algorithm identifier.]
    ALGTYPE(A)=SECOND(A),
               [Algorithm type: 0 = procedure, 1 = function.]
    ALGIPAR(A)=THIRD(A),
               [Number of input parameters.]
    ALGOPAR(A)=FOURTH(A).
               [Number of output parameters.]
