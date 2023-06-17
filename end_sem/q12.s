.global height

height:
    xorq %rbx , %rbx # i = 0 
    movq %rsi , %rcx 
    salq $1 , %rcx
    decq %rcx #  2 * n - 1
    movq %rcx , %r9

.sort_outer:
    cmpq %rbx , %rcx
    jle .next
    xorq %rax , %rax # j=0
    subq %rbx , %r9 # 2 * n - 1 - i

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
    movq $1 , %rax 
    xorq %rbx , %rbx # i = 0 

.loop:
    cmpq %rbx , %rsi 
    jle .return
    movq %rsi , %rcx 
    addq %rbx , %rcx 
    movq (%rdi, %rcx , 8),  %r8 
    movq (%rdi ,%rbx , 8) ,%r9
    subq %r9 , %r8 
    cmpq %r8 , %rdx 
    jg .return2
    incq %rbx 
    jmp .loop
.return2:
    movq $0 , %rax
    ret
.return:
    movq $1 , %rax
    ret 
