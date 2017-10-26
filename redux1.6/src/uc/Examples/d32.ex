-><--><--><--><--><--><--><--><--><--><--><--><-
|                                              |
|      ReDuX - Knuth-Bendix Demo-Programm      |
|                                              |
|         Projekt: Unfailing Completion        |
V                                              V
->->->->->->->->->->-><-<-<-<-<-<-<-<-<-<-<-<-<-
 
Loading your data type ...
Acception time: 34 ms.
 
TYPE D32.
CONSTS
        1,a,b - DIEDER
VARS
        A,B,C - DIEDER
OPS
        *(DIEDER,DIEDER) - DIEDER  FIX: PREFIX.
        I(DIEDER) - DIEDER  FIX: PREFIX
AXIOMS
 1) *(1,A) == A
 2) *(I(A),A) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
 4) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))))))))))))))))))))))))))))
)) == 1
 5) *(b,b) == 1
 6) *(b,a) == *(I(a),b)
END
Display time: 0 ms.
 
Ready? *

 
 
You have following choices: 
  u - unify two terms 
  m - match two terms 
  e - test equality of two terms 
  p - prove equational theorem
  n - normalize term 
  k - run Knuth-Bendix completion procedure
  w - run Unfailing completion procedure
  i - de/install term ordering
  s - select term ordering
  o - order axiom
  O - order axioms of data type
  d - display data type
  S - show times and counters
  r - reset times and counters
  h - help, print menu
  q - quit
Go on [u/m/e/n/k/w/i/s/o/O/d/S/r/h/q]?  * 
w
 
 
 
Already installed orderings:
Initialization of term orderings.
The following term orderings are supported:
  P  -- Path ordering (with l-r and r-l status)
  K  -- Knuth-Bendix ordering. Not AC-compatible!
  1. -- polynomial ordering
  2. -- polynomial ordering
  3. -- polynomial ordering
  4. -- polynomial ordering
  5. -- polynomial ordering
  6. -- polynomial ordering
  7. -- polynomial ordering
  8. -- polynomial ordering
  9. -- polynomial ordering
 
Which of these orderings shall be added ?
Input string of {P,K,1,2,3,4,5,6,7,8,9} *
k
 
The accepted string is K. Ok [Y/N]? *
y
for defining a Knuth-Bendix ordering on type D32
 
give non-negative indexes and weights for constants (weights all positive)
1 - DIEDER
  index *
0
 weight *
1
a - DIEDER
  index *
1
 weight *
1
b - DIEDER
  index *
2
 weight *
1
 
give non-negative indexes and weights for operators 
(weights for unary operators all positive, with the
possible exception of the operator with largest index.)
*(DIEDER,DIEDER) - DIEDER  FIX: PREFIX
  index *
3
 weight *
2
I(DIEDER) - DIEDER  FIX: PREFIX
  index *
4
 weight *
0
Initialization orderings:
K
time=1071 ms
 
 
The following term orderings are installed:
  K -- Knuth-Bendix ordering
  S -- Straight (pseudo) ordering
  R -- Reverse (pseudo) ordering
 
Input a string consisting of at most one occurence of the above orderings to  
select the lexicographic combination of these orderings.
Input string *
k
 
The accepted string is `K'. Ok [Y/N]? *
y
Enter equation:
I(a) == a
Do you want to change MAXSTEPS (current value: 500)? [Y/N]
y
Enter new value:
100
Do you want to work in trace mode? [Y/N] 
y
Do you want to work in step mode? [Y/N] 
n
Step 1: |P| = 6, |E| = 0, |R| = 0
Equation set:
 
Rule set:
AXIOMS
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (100%)
Simplify
Delete
# of discarded CPs : 0 (0%)
Simplify goal
Step 2: |P| = 5, |E| = 0, |R| = 1
Equation set:
 
Rule set:
AXIOMS
 1) *(1,A) == A
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (100%)
Simplify
Delete
# of discarded CPs : 0 (0%)
Simplify goal
Step 3: |P| = 4, |E| = 0, |R| = 2
Equation set:
 
Rule set:
AXIOMS
 1) *(1,A) == A
 2) *(I(A),A) == 1
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 2 (40%)
Simplify
Delete
# of discarded CPs : 2 (33%)
Simplify goal
Step 4: |P| = 4, |E| = 0, |R| = 3
Equation set:
 
Rule set:
AXIOMS
 1) *(1,A) == A
 2) *(I(A),A) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 2 (28%)
Simplify
Delete
# of discarded CPs : 1 (12%)
Simplify goal
Step 5: |P| = 7, |E| = 0, |R| = 4
Equation set:
 
Rule set:
AXIOMS
 1) *(1,A) == A
 2) *(I(A),A) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
 4) *(I(A),*(A,C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 2 (40%)
Simplify
Delete
# of discarded CPs : 2 (22%)
Simplify goal
Step 6: |P| = 7, |E| = 0, |R| = 5
Equation set:
 
Rule set:
AXIOMS
 1) *(1,A) == A
 2) *(I(A),A) == 1
 5) *(I(1),A) == A
 3) *(*(A,B),C) == *(A,*(B,C))
 4) *(I(A),*(A,C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 3 (30%)
Simplify goal
Step 7: |P| = 7, |E| = 0, |R| = 6
Equation set:
 
Rule set:
AXIOMS
 1) *(1,A) == A
 2) *(I(A),A) == 1
 5) *(I(1),A) == A
 3) *(*(A,B),C) == *(A,*(B,C))
 6) *(I(I(A)),C) == *(A,C)
 4) *(I(A),*(A,C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (37%)
Simplify
Delete
# of discarded CPs : 3 (27%)
Simplify goal
Step 8: |P| = 8, |E| = 0, |R| = 7
Equation set:
 
Rule set:
AXIOMS
 1) *(1,A) == A
 7) *(A,1) == A
 2) *(I(A),A) == 1
 5) *(I(1),A) == A
 3) *(*(A,B),C) == *(A,*(B,C))
 6) *(I(I(A)),C) == *(A,C)
 4) *(I(A),*(A,C)) == C
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (60%)
Simplify
Delete
# of discarded CPs : 3 (30%)
Simplify goal
Step 9: |P| = 7, |E| = 0, |R| = 7
Equation set:
 
Rule set:
AXIOMS
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
 2) *(I(A),A) == 1
 5) *(I(1),A) == A
 3) *(*(A,B),C) == *(A,*(B,C))
 4) *(I(A),*(A,C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (14%)
Simplify
Delete
# of discarded CPs : 5 (41%)
Simplify goal
Step 10: |P| = 7, |E| = 0, |R| = 8
Equation set:
 
Rule set:
AXIOMS
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
 2) *(I(A),A) == 1
 5) *(I(1),A) == A
 9) *(A,I(A)) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
 4) *(I(A),*(A,C)) == C
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 2 (40%)
Simplify
Delete
# of discarded CPs : 4 (40%)
Simplify goal
Step 11: |P| = 6, |E| = 0, |R| = 8
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
 4) *(I(A),*(A,C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 4 (30%)
Simplify
Delete
# of discarded CPs : 8 (57%)
Simplify goal
Step 12: |P| = 6, |E| = 0, |R| = 9
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (33%)
Simplify
Delete
# of discarded CPs : 0 (0%)
Simplify goal
Step 13: |P| = 7, |E| = 0, |R| = 10
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (50%)
Simplify
Delete
# of discarded CPs : 3 (33%)
Simplify goal
Step 14: |P| = 6, |E| = 0, |R| = 11
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 4 (44%)
Simplify
Delete
# of discarded CPs : 5 (50%)
Simplify goal
Step 15: |P| = 5, |E| = 0, |R| = 12
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 2 (8%)
Simplify
Delete
# of discarded CPs : 17 (68%)
Simplify goal
Step 16: |P| = 8, |E| = 0, |R| = 13
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
15) *(A,*(B,I(*(A,B)))) == 1
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 2 (11%)
Simplify
Delete
# of discarded CPs : 12 (50%)
Simplify goal
Step 17: |P| = 12, |E| = 0, |R| = 13
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
16) *(B,I(*(A,B))) == I(A)
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 4 (23%)
Simplify
Delete
# of discarded CPs : 11 (45%)
Simplify goal
Step 18: |P| = 13, |E| = 0, |R| = 14
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
17) I(*(A,I(A_1))) == *(A_1,I(A))
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
16) *(B,I(*(A,B))) == I(A)
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (6%)
Simplify
Delete
# of discarded CPs : 26 (92%)
Simplify goal
Step 19: |P| = 2, |E| = 0, |R| = 13
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (40%)
Simplify goal
Step 20: |P| = 3, |E| = 0, |R| = 14
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (25%)
Simplify
Delete
# of discarded CPs : 2 (40%)
Simplify goal
Step 21: |P| = 3, |E| = 0, |R| = 15
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (10%)
Simplify
Delete
# of discarded CPs : 7 (63%)
Simplify goal
Step 22: |P| = 4, |E| = 0, |R| = 16
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (16%)
Simplify
Delete
# of discarded CPs : 3 (37%)
Simplify goal
Step 23: |P| = 5, |E| = 0, |R| = 17
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (16%)
Simplify
Delete
# of discarded CPs : 4 (44%)
Simplify goal
Step 24: |P| = 5, |E| = 0, |R| = 18
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (7%)
Simplify
Delete
# of discarded CPs : 12 (75%)
Simplify goal
Step 25: |P| = 4, |E| = 0, |R| = 19
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 2 (18%)
Simplify
Delete
# of discarded CPs : 9 (75%)
Simplify goal
Step 26: |P| = 3, |E| = 0, |R| = 20
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (15%)
Simplify
Delete
# of discarded CPs : 15 (83%)
Simplify goal
Step 27: |P| = 3, |E| = 0, |R| = 21
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (12%)
Simplify
Delete
# of discarded CPs : 6 (66%)
Simplify goal
Step 28: |P| = 3, |E| = 0, |R| = 22
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (13%)
Simplify
Delete
# of discarded CPs : 18 (85%)
Simplify goal
Step 29: |P| = 3, |E| = 0, |R| = 23
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (11%)
Simplify
Delete
# of discarded CPs : 7 (70%)
Simplify goal
Step 30: |P| = 3, |E| = 0, |R| = 24
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (12%)
Simplify
Delete
# of discarded CPs : 21 (87%)
Simplify goal
Step 31: |P| = 3, |E| = 0, |R| = 25
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (10%)
Simplify
Delete
# of discarded CPs : 8 (72%)
Simplify goal
Step 32: |P| = 3, |E| = 0, |R| = 26
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (10%)
Simplify
Delete
# of discarded CPs : 24 (88%)
Simplify goal
Step 33: |P| = 3, |E| = 0, |R| = 27
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (9%)
Simplify
Delete
# of discarded CPs : 9 (75%)
Simplify goal
Step 34: |P| = 3, |E| = 0, |R| = 28
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (9%)
Simplify
Delete
# of discarded CPs : 27 (90%)
Simplify goal
Step 35: |P| = 3, |E| = 0, |R| = 29
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (8%)
Simplify
Delete
# of discarded CPs : 10 (76%)
Simplify goal
Step 36: |P| = 3, |E| = 0, |R| = 30
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (8%)
Simplify
Delete
# of discarded CPs : 30 (90%)
Simplify goal
Step 37: |P| = 3, |E| = 0, |R| = 31
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (7%)
Simplify
Delete
# of discarded CPs : 11 (78%)
Simplify goal
Step 38: |P| = 3, |E| = 0, |R| = 32
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (8%)
Simplify
Delete
# of discarded CPs : 33 (91%)
Simplify goal
Step 39: |P| = 3, |E| = 0, |R| = 33
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (7%)
Simplify
Delete
# of discarded CPs : 12 (80%)
Simplify goal
Step 40: |P| = 3, |E| = 0, |R| = 34
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (7%)
Simplify
Delete
# of discarded CPs : 36 (92%)
Simplify goal
Step 41: |P| = 3, |E| = 0, |R| = 35
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (6%)
Simplify
Delete
# of discarded CPs : 13 (81%)
Simplify goal
Step 42: |P| = 3, |E| = 0, |R| = 36
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (6%)
Simplify
Delete
# of discarded CPs : 39 (92%)
Simplify goal
Step 43: |P| = 3, |E| = 0, |R| = 37
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (6%)
Simplify
Delete
# of discarded CPs : 14 (82%)
Simplify goal
Step 44: |P| = 3, |E| = 0, |R| = 38
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (6%)
Simplify
Delete
# of discarded CPs : 42 (93%)
Simplify goal
Step 45: |P| = 3, |E| = 0, |R| = 39
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (5%)
Simplify
Delete
# of discarded CPs : 15 (83%)
Simplify goal
Step 46: |P| = 3, |E| = 0, |R| = 40
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (6%)
Simplify
Delete
# of discarded CPs : 45 (93%)
Simplify goal
Step 47: |P| = 3, |E| = 0, |R| = 41
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (5%)
Simplify
Delete
# of discarded CPs : 16 (84%)
Simplify goal
Step 48: |P| = 3, |E| = 0, |R| = 42
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (5%)
Simplify
Delete
# of discarded CPs : 48 (94%)
Simplify goal
Step 49: |P| = 3, |E| = 0, |R| = 43
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (5%)
Simplify
Delete
# of discarded CPs : 17 (85%)
Simplify goal
Step 50: |P| = 3, |E| = 0, |R| = 44
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (5%)
Simplify
Delete
# of discarded CPs : 51 (94%)
Simplify goal
Step 51: |P| = 3, |E| = 0, |R| = 45
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (5%)
Simplify
Delete
# of discarded CPs : 18 (85%)
Simplify goal
Step 52: |P| = 3, |E| = 0, |R| = 46
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (5%)
Simplify
Delete
# of discarded CPs : 54 (94%)
Simplify goal
Step 53: |P| = 3, |E| = 0, |R| = 47
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (4%)
Simplify
Delete
# of discarded CPs : 19 (86%)
Simplify goal
Step 54: |P| = 3, |E| = 0, |R| = 48
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (4%)
Simplify
Delete
# of discarded CPs : 57 (95%)
Simplify goal
Step 55: |P| = 3, |E| = 0, |R| = 49
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (4%)
Simplify
Delete
# of discarded CPs : 20 (86%)
Simplify goal
Step 56: |P| = 3, |E| = 0, |R| = 50
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (4%)
Simplify
Delete
# of discarded CPs : 60 (95%)
Simplify goal
Step 57: |P| = 3, |E| = 0, |R| = 51
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (4%)
Simplify
Delete
# of discarded CPs : 21 (87%)
Simplify goal
Step 58: |P| = 3, |E| = 0, |R| = 52
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (4%)
Simplify
Delete
# of discarded CPs : 63 (95%)
Simplify goal
Step 59: |P| = 3, |E| = 0, |R| = 53
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (4%)
Simplify
Delete
# of discarded CPs : 22 (88%)
Simplify goal
Step 60: |P| = 3, |E| = 0, |R| = 54
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (4%)
Simplify
Delete
# of discarded CPs : 66 (95%)
Simplify goal
Step 61: |P| = 3, |E| = 0, |R| = 55
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (4%)
Simplify
Delete
# of discarded CPs : 23 (88%)
Simplify goal
Step 62: |P| = 3, |E| = 0, |R| = 56
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (4%)
Simplify
Delete
# of discarded CPs : 69 (95%)
Simplify goal
Step 63: |P| = 3, |E| = 0, |R| = 57
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (3%)
Simplify
Delete
# of discarded CPs : 24 (88%)
Simplify goal
Step 64: |P| = 3, |E| = 0, |R| = 58
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (3%)
Simplify
Delete
# of discarded CPs : 72 (96%)
Simplify goal
Step 65: |P| = 3, |E| = 0, |R| = 59
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (3%)
Simplify
Delete
# of discarded CPs : 25 (89%)
Simplify goal
Step 66: |P| = 3, |E| = 0, |R| = 60
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 3 (3%)
Simplify
Delete
# of discarded CPs : 75 (96%)
Simplify goal
Step 67: |P| = 3, |E| = 0, |R| = 61
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 0 (0%)
Simplify goal
Step 68: |P| = 6, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
67) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))))))))))))))))))))))))))))
)) == 1
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (20%)
Simplify goal
Step 69: |P| = 8, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
68) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))))))))))))))))))))))))))))) ==
 I(a)
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (16%)
Simplify goal
Step 70: |P| = 10, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
69) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))))))))))))))))))))) == *(I(
a),I(a))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (14%)
Simplify goal
Step 71: |P| = 12, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
70) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))))))))))))))))))))))))))) == *(I(a),*(
I(a),I(a)))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (12%)
Simplify goal
Step 72: |P| = 14, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
71) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))))))))))))))))))) == *(I(a),*(I(a),
*(I(a),I(a))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (11%)
Simplify goal
Step 73: |P| = 16, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
72) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a
),*(I(a),I(a)))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (10%)
Simplify goal
Step 74: |P| = 18, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
73) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),I(a))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (9%)
Simplify goal
Step 75: |P| = 20, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
74) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,*(a,a)))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),I(a)))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (8%)
Simplify goal
Step 76: |P| = 22, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
75) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(a,a))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),I(a))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (7%)
Simplify goal
Step 77: |P| = 24, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
76) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,a)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a)))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (7%)
Simplify goal
Step 78: |P| = 26, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
77) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,a))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),I(a))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (6%)
Simplify goal
Step 79: |P| = 28, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
78) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,a)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),I(a)))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (6%)
Simplify goal
Step 80: |P| = 30, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
79) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,a))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),I(a))))))))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (20%)
Simplify
Delete
# of discarded CPs : 2 (5%)
Simplify goal
Step 81: |P| = 32, |E| = 0, |R| = 62
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
80) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (3%)
Simplify
Delete
# of discarded CPs : 7 (12%)
Simplify goal
Step 82: |P| = 51, |E| = 0, |R| = 63
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
80) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))
81) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (3%)
Simplify
Delete
# of discarded CPs : 24 (31%)
Simplify goal
Step 83: |P| = 53, |E| = 0, |R| = 64
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
82) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))
))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
80) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))
81) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (3%)
Simplify
Delete
# of discarded CPs : 24 (30%)
Simplify goal
Step 84: |P| = 55, |E| = 0, |R| = 65
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
55) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))))
82) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))
))))))))))))
56) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))))
57) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))
80) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))
81) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))
))))))))))))
58) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
))))
59) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,b))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
)))))))
60) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(b,C)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)
)))))))))))))))))
61) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,b)))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(
a)))))))))))))))))))
62) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(b,C))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),C)))))))))))))))))))
63) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,b))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),I(a))))))))))))))))))))
64) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(b,C)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),C))))))))))))))))))))
65) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,b)))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),I(a)))))))))))))))))))))
66) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,*(a,*(a,*(b,C))))))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (2%)
Simplify
Delete
# of discarded CPs : 65 (59%)
Simplify goal
Step 85: |P| = 45, |E| = 0, |R| = 52
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
80) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (4%)
Simplify
Delete
# of discarded CPs : 22 (34%)
Simplify goal
Step 86: |P| = 42, |E| = 0, |R| = 53
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
85) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))
))))))))))))
80) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (1%)
Simplify
Delete
# of discarded CPs : 61 (59%)
Simplify goal
Step 87: |P| = 41, |E| = 0, |R| = 54
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
85) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))
))))))))))))
80) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))
86) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,C))))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 20 (17%)
Simplify
Delete
# of discarded CPs : 105 (78%)
Simplify goal
Step 88: |P| = 29, |E| = 0, |R| = 55
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
85) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))
))))))))))))
80) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))
86) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,C))))))))))))))))
87) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (2%)
Simplify
Delete
# of discarded CPs : 38 (57%)
Simplify goal
Step 89: |P| = 28, |E| = 0, |R| = 55
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
85) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))
))))))))))))
88) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))
86) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,C))))))))))))))))
87) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,C))))))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 19 (17%)
Simplify
Delete
# of discarded CPs : 92 (76%)
Simplify goal
Step 90: |P| = 28, |E| = 0, |R| = 55
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
85) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))
))))))))))))
88) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))))))
86) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,C))))))))))))))))
89) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (2%)
Simplify
Delete
# of discarded CPs : 37 (57%)
Simplify goal
Step 91: |P| = 27, |E| = 0, |R| = 55
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
90) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
85) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))
))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))
))))))))))))
86) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))
)))))))))))))))) == *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a
,*(a,C))))))))))))))))
89) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))
)))))))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
Orient/Unfail
Collapse2
Collapse1
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
RRR4 hier other RRCLPS
Compose
Deduce
remove some new CPs
# of discarded CPs : 18 (24%)
Simplify
Delete
# of discarded CPs : 58 (68%)
Simplify goal
Step 92: |P| = 27, |E| = 0, |R| = 53
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
90) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
91) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 1 (16%)
Simplify
Delete
# of discarded CPs : 24 (77%)
Simplify goal
Step 93: |P| = 7, |E| = 0, |R| = 54
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
90) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
91) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
92) *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(
a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))))))))))))))
Orient/Unfail
Collapse2
Collapse1
Compose
Deduce
remove some new CPs
# of discarded CPs : 17 (29%)
Simplify
Delete
# of discarded CPs : 47 (100%)
Simplify goal
Step 94: |P| = 0, |E| = 0, |R| = 55
Equation set:
 
Rule set:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
90) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
91) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
92) *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(
a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))))))))))))))
93) *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))) == *(a,*(a,*(a,*(a,*(a,*
(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))))))))))))
equation could not be proved (no more critical pairs)
equations:
 
rules:
AXIOMS
10) I(1) == 1
13) I(b) == b
 1) *(1,A) == A
 7) *(A,1) == A
 8) I(I(A)) == A
12) *(b,b) == 1
 2) *(I(A),A) == 1
 9) *(A,I(A)) == 1
18) I(*(A,A_1)) == *(I(A_1),I(A))
19) *(I(a),b) == *(b,a)
23) *(b,I(a)) == *(a,b)
 3) *(*(A,B),C) == *(A,*(B,C))
14) *(b,*(b,C)) == C
20) *(a,*(b,a)) == b
22) *(b,*(a,b)) == I(a)
 4) *(I(A),*(A,C)) == C
11) *(A,*(I(A),C)) == C
21) *(I(a),*(b,C)) == *(b,*(a,C))
24) *(b,*(I(a),C)) == *(a,*(b,C))
25) *(a,*(b,*(a,C))) == *(b,C)
26) *(b,*(a,*(b,C))) == *(I(a),C)
27) *(b,*(a,*(a,b))) == *(I(a),I(a))
28) *(b,*(a,*(a,*(b,C)))) == *(I(a),*(I(a),C))
29) *(b,*(a,*(a,*(a,b)))) == *(I(a),*(I(a),I(a)))
30) *(b,*(a,*(a,*(a,*(b,C))))) == *(I(a),*(I(a),*(I(a),C)))
31) *(b,*(a,*(a,*(a,*(a,b))))) == *(I(a),*(I(a),*(I(a),I(a))))
32) *(b,*(a,*(a,*(a,*(a,*(b,C)))))) == *(I(a),*(I(a),*(I(a),*(I(a),C))))
33) *(b,*(a,*(a,*(a,*(a,*(a,b)))))) == *(I(a),*(I(a),*(I(a),*(I(a),I(a)))))
34) *(b,*(a,*(a,*(a,*(a,*(a,*(b,C))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
C)))))
35) *(b,*(a,*(a,*(a,*(a,*(a,*(a,b))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),
I(a))))))
36) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),C))))))
37) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),*(I(a),I(a)))))))
38) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),C)))))))
39) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))) == *(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),*(I(a),I(a))))))))
40) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))
41) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))) == *(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))
42) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))
43) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))) == *(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))))))))
44) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))
45) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))) == *(I(a),*(I
(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))
46) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C))))))
)))))
47) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))) == *(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),I(a))))
))))))))
48) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),C))))))))))))
49) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b)))))))))))))) ==
*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(
I(a),I(a)))))))))))))
50) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),C)))))))))))))
51) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))))))
) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(
a),*(I(a),*(I(a),I(a))))))))))))))
52) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),C))))))))))))))
53) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
83) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,b))))
))))))))))))
90) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a))))))))))
)))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a)
,*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))
54) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(b,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
84) *(b,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,
*(b,C)))))))))))))))))
91) *(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))
))))))))))) == *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*
(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))
92) *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),I(a)))))))))))))))) == *(a,*(a,*(a,*(a,*(a,*(a,*(
a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,a)))))))))))))))
93) *(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a
),*(I(a),*(I(a),*(I(a),*(I(a),*(I(a),C)))))))))))))))) == *(a,*(a,*(a,*(a,*(a,*
(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,*(a,C))))))))))))))))
critical pairs:
 
equation in (R u E)-normal form:
( 0 and  0) ( 0)  I(a) == a
Go on [u/m/e/n/k/w/i/s/o/O/d/S/r/h/q]?  * 
q
 
 
 
54 symbols and 148 properties.
12 Garbage collections, 1334845 cells reclaimed, in 5559 ms.
22741 cells in AVAIL, 128000 cells in space.
Total time 382058 ms.
