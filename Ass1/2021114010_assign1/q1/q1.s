.global get_sum      # Declare the symbol 'get_sum' as global

get_sum:             # Start of the function 'get_sum'

	xor %rbx, %rbx    # Initialize the sum to zero (clear register %rbx)
	xor %rcx, %rcx    # Initialize the loop counter to zero (clear register %rcx)

	jmp loop_start     # Jump to the label 'loop_start' to start the loop

loop_start:          # Label 'loop_start' marks the beginning of the loop

	cmpq %rcx, %rsi    # Compare the loop counter (%rcx) with the limit (%rsi)
	jl loop_end        # If the loop counter is less than the limit, jump to 'loop_end'

	movq (%rdi, %rcx, 8), %rax   # Load a value from memory into register %rax
	movq $3, %r10                # Move the value 3 into register %r10
	cqto                         # Sign-extend %rax into %rdx:%rax for division
	idivq %r10                   # Divide the value in %rdx:%rax by the value in %r10

	cmpq $0, %rdx     # Compare the remainder (%rdx) with zero
	je .IF            # If the remainder is zero, jump to the label '.IF'

	addq $1, %rcx     # Increment the loop counter by 1
	jmp loop_start    # Jump back to 'loop_start' to continue the loop

.IF:                # Label '.IF' is reached when the remainder is zero

	addq (%rdi, %rcx, 8), %rbx   # Add the value from memory to the sum (%rbx)
	addq $1, %rcx                # Increment the loop counter by 1
	jmp loop_start               # Jump back to 'loop_start' to continue the loop

loop_end:            # Label 'loop_end' marks the end of the loop

	xorq %rax, %rax   # Set %rax to zero
	movq %rbx, %rax   # Move the sum (%rbx) to %rax
	ret               # Return from the function
