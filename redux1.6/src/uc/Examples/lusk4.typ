TYPE LUSK4.
CONSTS
  e-LUSK4.
  a,b-LUSK4
VARS
  x,y,z-LUSK4
OPS
  h(LUSK4,LUSK4)-LUSK4.
  g(LUSK4)-LUSK4.
  f(LUSK4,LUSK4)-LUSK4
AXIOMS
  1) f(e,x) == x
  2) f(x,e) == x
  3) f(g(x),x) == e
  4) f(x,g(x)) == e
  5) f(f(x,y),z) == f(x,f(y,z))
  6) h(x,y) == f(x,f(y,f(g(x),g(y))))

  7) f(x,f(x,x)) == e
END
