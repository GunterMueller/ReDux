! SPARC version of
! 				DPR(a,b;c,d)
! [Digit product.  a and b are beta-digits.  c and d are the unique
! beta-digits such that a*b=c*beta+d and c*d>=0.]
!
! alfa=32
! zeta=29
! beta=2^29
!
! G.Simon 2.2.93
!
	.seg	"text"
	.global	_DPR
_DPR:
	! Get the operands from memory.
	! C calling convention
	mov	%o0,%o0				! a
	mov	%o1,%o1				! b
	sll     %o0,2,%o0			! a*2^(alfa-zeta-1)
	sll     %o1,1,%o1			! b*2
	smul    %o0,%o1,%g1			! signed multiply
	rd      %y, %o4				! most significant 32 bit 
						! of the result in %y
	tst	%g1				! d = 0 ?
	be	1f
	nop	! Nothing in the delay slot.
	srl	%g1,3,%g1			! d = d / 2^(alfa-zeta)
	tst	%o4				! a*b >= 0 ?
	bge	1f
	nop	! Nothing in the delay slot.
	add	%o4, 1,%o4
	sethi   %hi(0xe0000000),%g2		! d = d - beta
	or	%g1, %g2,%g1
1:	st	%g1, [%o3]     ! Send least significant bits back.
	st	%o4, [%o2]     ! Send most significant bits back.
	retl    ! This is a leaf routine, hence "retl".
	nop     ! Nothing in the delay slot.
	.seg	"data"


