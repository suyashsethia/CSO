.global minimumBacteria

minimumBacteria:
    xorq %rcx ,%rcx
    movq %rdi , %rax


.loop:
    cmpq $0, %rax
    jle .return
    xorq %rdx , %rdx
    movq $2 , %r10
    idivq %r10
    cmpq $1 ,%rdx 
    je .increment
    jmp .loop 



.increment:
    incq %rcx
    jmp .loop

.return:
    movq %rcx , %rax
    ret 
