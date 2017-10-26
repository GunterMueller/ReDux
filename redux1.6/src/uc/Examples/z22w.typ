;
TYPE Z22W.
; AUTHOR Avenhaus, Denzinger
; ORIGIN Distributing equational theorem proving, LNCS 690
; DESCRIPTION Modified Specification of Z22
;
;
CONSTS
   1,a,b,c,d,e-EL
VARS
   x,y,z-EL
OPS
   *(EL,EL)-EL       FIX: INFIX.
   ~(EL)-EL
AXIOMS
1)  (x * 1) == x
2)  (x * ~(x)) == 1
3)  ((x * y) * z) == (x * (y * z))
4)  (a * (b * c)) == d
5)  (b * (c * d)) == e
6)  (c * (d * e)) == a
7)  (d * (e * a)) == b
8)  (e * (a * b)) == c
END

