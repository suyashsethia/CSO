.global find_first_positive

find_first_positive:
    xorq %rbx , %rbx # i = 0 
    movq %rsi , %rcx 
    movq %rcx , %r9

.sort_outer:
    cmpq %rbx , %rcx
    jle .next
    xorq %rax , %rax # j=0

.sort_inner:
    cmpq %rax , %r9
    jle .outer
    movq %rax , %r8 
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

.next:
    xorq %rbx , %rbx # i = 0 
    movq $1, %rax # j = 1

.loop:
    cmpq %rbx , %rsi
    jle .return
    cmpq (%rdi ,%rbx,8),%rax
    jg .case1
    cmpq (%rdi ,%rbx,8),%rax
    je .case2
    jmp .return


.case1:
    incq %rbx 
    jmp .loop
.case2:
    incq %rbx 
    incq %rax 
    jmp .loop

.return 
    ret