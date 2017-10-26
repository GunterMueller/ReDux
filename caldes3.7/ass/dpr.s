! iterative SPARC version of
!                            DPR(a,b;c,d)
! [Digit product.  a and b are beta-digits.  c and d are the unique
! beta-digits such that a*b=c*beta+d and c*d>=0.]
!
! alfa=32
! zeta=29
! beta=2^29
!
! G.Simon 2.2.93
!
!
	.seg	"text"
	.global	_DPR
_DPR:
	! Get the operands from memory.
	! C calling convention
	mov	%o0,%o0
	mov	%o1,%o1
	tst	%o0
	bge	1f
	xor	%o0,%o1,%o5	
	sub	%g0,%o0,%o0
1:	tst	%o1
	bge	2f
	mov	%o0, %y         
	sub	%g0,%o1,%o1 
2:	andcc	%g0, %g0 ,%o4   
	!
	! 29 bit multiply
	!
	mulscc	%o4, %o1, %o4  ! first iteration of 29
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4
	mulscc	%o4, %o1, %o4	! 29th iteration
	mulscc	%o4, %g0, %o4	! last iteration only shifts
	rd	%y, %g1       
	srl	%g1, 3, %g1   
	tst	%o5
	bge	4f
	nop			! Nothing in the delay slot.
	sub	%g0, %g1,%g1
	sub	%g0, %o4,%o4
4:	st	%g1, [%o3]	! Send least significant bits back.
	st	%o4, [%o2]	! Send most significant bits back.
	retl			! This is a leaf routine, hence "retl".
	nop     ! Nothing in the delay slot.
	.seg	"data"


