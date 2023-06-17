.global height

height:
    xorq %rcx , %rcx #i
    movq %rsi ,%r8
    decq %r8 # n-1 

.loop_outer:
    cmpq %rcx , %r8 
    jle .return 
    xorq %rdx , %rdx # j=0
    movq %r8 , %r9
    subq %rcx , %r9

.loop_inner:
    cmpq %rdx , %r9
    jle .condition
    movq %rdx, %r10 
    incq %r10
    movq (%rdi,%rdx ,8) , %r11 # arr[j]
    cmpq %r11 , (%rdi , %r10 ,8)
    jl .swap
    incq %rdx 
    jmp .loop_inner

.swap:
    movq (%rdi , %r10 ,8) , %r12 
    movq %r11 ,(%rdi , %r10 ,8)
    movq %r12 ,  (%rdi,%rdx ,8)
    incq %rdx 
    jmp .loop_inner


.condition:
    incq %rcx
    jmp .loop_outer



.return:
    ret
    
