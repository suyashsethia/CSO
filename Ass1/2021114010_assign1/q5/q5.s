.global get_address_smallest


get_address_smallest:
    movq %rdi, %rax             # Move the address of arr to rax register
    movq %rsi, %rcx             # Move the size of the array to rcx register

    movq (%rax), %rdx           # Move the first element of the array to rdx
    movq %rax, %rbx             # Move the address of the first element to rbx
    decq %rcx                   # Decrement the size of the array

    cmpq $0, %rcx               # Check if the size is zero
    je end_of_loop              # If zero, jump to end_of_loop

    loop_start:
        addq $8, %rax           # Move to the next element of the array
        cmpq %rdx ,(%rax)      # Compare the current element with the smallest element
        jle update_smallest     # If less than or equal, update the smallest element

    continue_loop:
        decq %rcx               # Decrement the size of the array
        cmpq $0, %rcx           # Check if the size is zero
        jne loop_start          # If not zero, continue the loop

    end_of_loop:
        movq %rbx, %rax         # Move the address of the smallest element to rax register
        ret

    update_smallest:
        movq (%rax), %rdx       # Update the smallest element
        movq %rax, %rbx       # Update the address of the smallest element
        jmp continue_loop       # Continue the loop

