.global swapper

swapper:
xorq %rbx , %rbx # i = 0 
xorq %rcx ,  %rcx #odd count 

.count_loop:

    cmpq %rbx , %rsi 
    jle .condition
    movq (%rdi,%rbx,8) ,%rax 
    movq $2 , %r8
    xorq %rdx ,%rdx
    idivq %r8
    cmpq $1 , %rdx 
    je .increment
    incq %rbx
    jmp .count_loop

.increment: 
    incq %rcx 
    incq %rbx
    jmp .count_loop

.condition:
    cmpq $0 , %rcx
    je .return
    cmpq %rcx , %rsi 
    je .return 
    xorq %rbx , %rbx # i = 0 
    movq %rsi , %rcx
    decq %rcx
    movq %rcx , %r9 

.sort_outer:
    cmpq %rbx ,%rcx 
    jle .return 
    xorq %rax , %rax # j = 0 
    subq %rbx , %r9

.sort_inner:
    cmpq %rax , %r9
    jle .outer
    movq %rax ,%r8
    incq %r8 
    movq (%rdi ,%rax , 8) ,%r12  #arr[j]
    cmpq %r12 ,(%rdi , %r8 , 8)   
    jl .swap 
    incq %rax 
    jmp .sort_inner

.swap:
    movq (%rdi ,%r8 , 8) , %r10   #r10 ->arr[j+1]

    movq %r12 , (%rdi ,%r8 , 8)   #arr[j]
    movq  %r10 , (%rdi , %rax , 8) 
    incq %rax 
    jmp .sort_inner


.outer:
    incq %rbx 
    jmp .sort_outer
.return:
    ret
    