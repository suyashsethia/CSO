.global gcd 
gcd:
    movq $0 , %rcx
    cmpq %rsi , %rcx
    je .return 
    xorq %rdx,%rdx
    movq %rdi , %rax
    idivq %rsi 
    movq %rsi , %rdi
    movq %rdx , %rsi 
    jmp gcd 
.return:
    movq %rdi , %rax
    ret
