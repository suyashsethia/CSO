.global ans 

#rdi ,rsi ,rcx 
ans:

    xorq %r8 , %r8 # answer
    xorq %r10 , %r10 # i=0
    movq %rdx , %rcx
.loop_outer:
    cmpq %r10 , %rdi 
    jle .return 
    xorq %r11 ,%r11 # j = 0

.loop_inner:
    cmpq  %r11 , %rsi 
    jle .condition_outer
    movq %r10 , %r9
    imulq %rsi , %r9
    addq %r11 , %r9  # i+j
    movq $2 , %r12
    xorq %rdx , %rdx 
    movq (%rcx ,%r9 ,8 ) ,%rax
    idivq %r12 
    cmpq $0 , %rdx
    je .three
    incq %r11 
    jmp .loop_inner

.condition_outer:
    incq %r10 
    jmp .loop_outer

.three:
    movq $3 ,%r12
    xorq %rdx , %rdx 
    movq (%rcx ,%r9 ,8) ,%rax
    idivq %r12
    cmpq $0 , %rdx
    jne .increment
    incq %r11 
    jmp .loop_inner


.increment:
    addq (%rcx ,%r9 ,8) , %r8
    incq %r11 
    jmp .loop_inner

.return:
    movq %r8 , %rax
    ret
