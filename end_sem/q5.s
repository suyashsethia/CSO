.global rearrange

rearrange:
    xorq %rax , %rax #i
    xorq %rbx , %rbx # count_0 

.loop1:
    cmpq %rax , %rdi 
    jle .loop2_i
    movq (%rsi,%rax,8),%rcx
    cmpq $0 , %rcx
    je .inc
    incq %rax
    jmp .loop1
.inc:
    incq %rbx
    incq %rax 
    jmp .loop1
.loop2_i:
    xorq %rax , %rax 
    jmp .loop2
.loop2:
    cmpq %rax , %rbx
    jle .loop3
    movq $0 ,(%rsi ,%rax ,8)
    incq %rax
    jmp .loop2
.loop3:
    cmpq %rax , %rdi
    jle .return 
    movq $1 ,(%rsi ,%rax ,8)
    incq %rax
    jmp .loop3

.return:
    ret
