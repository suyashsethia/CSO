.global calculate

#calculate a * 2^x + b * 2^y
calculate:

    movq %rdi, %rax    #a
    movq %rsi, %r8   #x
    movq %rdx, %rdx   #b
    movq %rcx, %r11  #y

    xorq %r9, %r9  #Initialize a counter with 0
    xorq %r10, %r10   #Initialize a variable to accumulate the result


calculate_a:
    cmpq $0, %r8    
    je calculate_b  #If x is 0, jump to calculate_b
    jl a_negative
    salq $1, %rax   #Multiply a by 2
    decq %r8    #Decrement x
    jmp calculate_a  #Jump to calculate_a
    ret

a_negative:
    cmpq $0, %r8
    je calculate_b
    sarq $1, %rax   #Divide a by 2
    incq %r8    #Increment x
    jmp a_negative


calculate_b:
    cmpq $0, %r11
    je calculate_result
    jl b_negative
    salq $1, %rdx
    decq %r11
    jmp calculate_b
    ret

b_negative:
    cmpq $0, %r11
    je calculate_result
    sarq $1, %rdx
    incq %r11
    jmp b_negative

calculate_result:
    addq %rdx, %rax
    ret
