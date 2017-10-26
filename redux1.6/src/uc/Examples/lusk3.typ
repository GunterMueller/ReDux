TYPE LUSK3. 
CONSTS
  0-LUSK3.
  a,b-LUSK3
VARS
  x,y,z-LUSK3
OPS
  j(LUSK3,LUSK3)-LUSK3.
  f(LUSK3,LUSK3)-LUSK3.
  g(LUSK3)-LUSK3
AXIOMS
  1) j(0,x) == x
  2) j(x,0) == x
  3) j(g(x),x) == 0
  4) j(x,g(x)) == 0
  5) j(j(x,y),z) == j(x,j(y,z))
  6) j(x,y) == j(y,x)
  7) f(f(x,y),z) == f(x,f(y,z))
  8) f(x,j(y,z)) == j(f(x,y),f(x,z))
  9) f(j(x,y),z) == j(f(x,z),f(y,z))
 10) f(x,x) == x
END
