.global arrayfunc

arrayfunc:
    xorq %r12 , %r12    # i
    movq %rsi , %rcx 

.loop:
    cmpq %r12 , %rdi
    je .return 

    xorq %rbx , %rbx
    xorq %rdx , %rdx 
    movq %r12 , %rax
    incq %rax
    movq $15 , %r8
    divq %r8 
    cmpq $0 ,  %rdx 
    je .both

    xorq %rbx , %rbx
    xorq %rdx , %rdx 
    movq %r12 , %rax
    incq %rax
    movq $3 , %r8
    divq %r8
    cmpq $0 ,  %rdx 
    je .three

    xorq %rbx , %rbx
    xorq %rdx , %rdx 
    movq %r12 , %rax
    incq %rax
    movq $5 , %r8
    divq %r8
    cmpq $0 ,  %rdx 
    je .five

    movq %r12 , %r10
    incq %r10
    movq %r10 , (%rcx)
    addq $4 , %rcx
    incq %r12 
    jmp .loop
.three: 
    movq $-1 , (%rcx)
    addq $4 , %rcx
    incq %r12
    jmp .loop 
.five:
    movq $-2 , (%rcx)
    addq $4 , %rcx
    incq %r12
    jmp .loop 

.both:
    movq $-3 , (%rcx)
    addq $4 , %rcx
    incq %r12
    jmp .loop 

.return:
    ret 
