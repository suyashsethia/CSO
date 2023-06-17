.global isPalindrome

isPalindrome:
    xorq %rcx , %rcx # reversed
    xorq %rdi , %rbx #original rbx = num 
    movq $10 , %r10

.loop:
    cmpq $0 , %rbx 
    jle .return 
    xorq %rdx , %rdx 
    idivq %r10 
    movq %rax , %rbx 
    imulq $10 , %rcx 
    addq %rdx , %rcx 
    jmp .loop 

cmpq %rcx , %rdi 
je .yes
jmp .no

.yes:
    movq $1 , %rax 
    ret
.no:
    movq $0 , %rax 
    ret
.return:
    cmpq %rcx , %rdi 
    je .yes
    jmp .no
    
