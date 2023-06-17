.global divide

divide:
    # If M <0 0, jump to M_negate
    cmpq $0, %rdi               # Check if M is negative
    jl M_negate
    movq $0 , %r10
                    # If M >= 0, jump to M_negate
    movq %rdi, %rax             # Move M to RAX , store remainder in rax
    #if M is negative , negate it
    movq %rdx, %rdx             #rax -> 12 , rcx -> qotient  , 
    movq %rsi, %rbx             #%rbx -> 12
    xorq %rcx, %rcx             #store quotient in rcx
    
    cmpq $0, %rbx               # Check if N is zero
    je divide_by_zero           # If zero, jump to divide_by_zero
    cmpq %rbx , %rax            # Check if M is less than N
    jl divide_done              # If M < N, jump to divide_done
    
    
    div_loop:
        cmpq %rbx, %rax         # Compare RAX (M) with N
        jl divide_done          # If M < N, jump to divide_done
        subq %rsi, %rax         # 
        incq %rcx               # Increment RDX (remainder)
        jmp div_loop            # Continue the loop

    divide_done:
    # check r10 ==1 , if yes , jump to divide_done2
        cmpq $1, %r10
        je divide_done2
        movq %rcx, (%rdx)       # Store the quotient at arr[0]
        movq %rax, 8(%rdx)      # Store the remainder at arr[1]
        ret

    divide_done2:
        #check if remainder ==0 
        cmpq $0, %rax
        je divide_done3
        incq %rcx               # Increment the quotient 
        negq %rcx               # Negate the quotient
        movq %rcx, (%rdx)       # Store the quotient at arr[0]
        #remainder  = N-remainder 
        subq %rsi, %rax         # Subtract the remainder from N
        negq %rax                        # Negate the remainder
        movq %rax, 8(%rdx)      # Store the remainder at arr[1]
        ret
    divide_done3:
        negq %rcx               # Negate the quotient
        movq %rcx, (%rdx)       # Store the quotient at arr[0]
        movq %rax, 8(%rdx)      # Store the remainder at arr[1]
        ret
    divide_by_zero:
        movq $-1, (%rdx)        # Store -1 as quotient at arr[0]
        movq $-1, 8(%rdx)       # Store -1 as remainder at arr[1]
        ret
    M_negate:
        negq %rdi               # Negate M
        #set a register to 1 which is not in use 
        movq $1, %r10          
        movq %rdi, %rax             # Move M to RAX , store remainder in rax
        #if M is negative , negate it
        movq %rdx, %rdx             #rax -> 12 , rcx -> qotient  , 
        movq %rsi, %rbx             #%rbx -> 12
        xorq %rcx, %rcx             #store quotient in rcx

        cmpq $0, %rbx               # Check if N is zero
        je divide_by_zero           # If zero, jump to divide_by_zero
        cmpq %rbx , %rax            # Check if M is less than N
        jl divide_done              # If M < N, jump to divide_done
        jmp div_loop                # Continue the loop

