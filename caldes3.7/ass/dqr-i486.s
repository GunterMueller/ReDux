.text
    .align 2
.globl _DQR
_DQR:
# alpha=32 bit and zeta=29 bit assuemd (beta=2^29), RGKL 1. 6. 1994
        movl 8(%esp),%eax      # eax<-a1
        cltd                   # sign extend to edx
        addl 4(%esp),%edx      # (edx:eax)<-(a1,a0)
        shll $3,%eax           # close (alpha-zeta) gap from below
        shrd $3,%edx,%eax      # double shift (edx:eax)
        sarl $3,%edx           # shift a1 right
        idivl 12(%esp)         # (r,q)=(edx:eax)<-(edx:eax)/b
        movl 16(%esp),%ecx     # q
        movl %eax,(%ecx) 
        movl 20(%esp),%ecx     # r
    	movl %edx,(%ecx)
        ret 
        .align 2,0x90
