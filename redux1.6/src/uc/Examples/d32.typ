;
TYPE D32. 
; Knuth-Bendix term-order
; I:0 > *:2 > b:1 > a:1 > 1:1
CONSTS 
  1,a,b-DIEDER 
VARS 
  A,B,C-DIEDER
OPS 
  *(DIEDER,DIEDER)-DIEDER.
  I(DIEDER)-DIEDER 
AXIOMS
  1) *(1,A)==A
  2) *(I(A),A)==1
  3) *(*(A,B),C)==*(A,*(B,C))
  4) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
     *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
     *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
     *(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))))))))))))))))))))))) == 1
  5) *(b,b)==1
  6) *(b,a)==*(I(a),b)
END


