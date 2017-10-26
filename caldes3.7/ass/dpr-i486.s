.text
        .align 2
.globl     _DPR
_DPR:
# alpha=32 bit, zeta=29 bit assumed (beta=2^zeta), RGKL 1. 6. 1994
        movl 4(%esp),%eax      # get a
        shll $2,%eax           # a<-a^(alpha-zeta-1)
        movl 8(%esp),%ecx      # get b
        shll $1,%ecx           # b<-2b
        imull %ecx             # (edx:eax)<-a*b
        testl $0xffffffff,%eax # if d=0, 
        jz L0                  # return
        shrl $3,%eax           # d<-d2^(alpha-zeta)
        testl $0x80000000,%edx # if a*b>0
        jz L0                  # return
        addl $1,%edx           # a*b<0, c<-c+1
        orl $0xe0000000,%eax   # alpha-zeta ld bits 1
L0:
        movl 12(%esp),%ecx     # c
        movl %edx,(%ecx)
        movl 16(%esp),%ecx     # d
        movl %eax,(%ecx)
        ret 
        .align 2,0x90
