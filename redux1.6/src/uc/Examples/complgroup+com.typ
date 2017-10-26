TYPE CPGRP.

CONSTS 0-CPGRP.
       a,b,c-CPGRP

VARS A,B,C-CPGRP

OPS +(CPGRP,CPGRP)-CPGRP.
    I(CPGRP)-CPGRP

AXIOMS
 1) I(0) == 0
 2) +(0,A) == A
 3) +(A,0) == A
 4) I(I(A)) == A
 5) +(I(A),A) == 0
 6) +(A,I(A)) == 0
 7) I(+(A,B)) == +(I(B),I(A))
 8) +(+(A,B),C) == +(A,+(B,C))
 9) +(I(A),+(A,C)) == C
10) +(A,+(I(A),C)) == C

11) +(A,B) == +(B,A)
END
