.global is_balanced

is_balanced:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   $-1
	xorq 	%rcx, %rcx     	# i = 0
	xorq 	%r9, %r9		# count = 0 (keeps the track of the size of the stack)
	jmp 	.loop

    #check if %rdi is odd 
    #if odd, return 0
    #if even, continue
    movq %rdi, %r12
    andq $1, %r12
    cmpq $0, %r12
    jne .exit_zero

.loop:
    cmpq 	%rdi, %rcx          # if (i < n)
	jge 	.final_check

    movzbq  (%rsi,%rcx,1), %rbx
	
	cmpq	$40, %rbx      # if (input[i] == '(')
	je		.Stack_Push

	cmpq	$91, %rbx      # if (input[i] == '[')
	je		.Stack_Push

	cmpq	$123, %rbx     # if (input[i] == '{')
	je		.Stack_Push

    cmpq    $60 , %rbx     # if (input[i] == '<')
    je      .Stack_Push     

	cmpq	$41, %rbx      # if (input[i] == ')')
	je		.Stack_Pull1

	cmpq	$93, %rbx      # if (input[i] == ']')
	je		.Stack_Pull2

	cmpq	$125, %rbx     # if (input[i] == '}')
	je		.Stack_Pull3

    cmpq   $62 , %rbx
    je     .Stack_Pull4    # if (input[i] == '>')

	#movq 	$0, %rax       			# if input[i] is not equal to any of the brackets, return 0
    #movq    %rbp, %rsp
    #popq    %rbp
	#r

.Stack_Push:
	movzbq 	(%rsi,%rcx,1), %r8      # %r8 contains input[i]
	pushq	%r8    				    # push(input[i]) into the stack
	inc 	%r9              		# count++ (if element is pushed in the stack)
	inc 	%rcx                    #i++
    jmp 	.loop

.Stack_Pull1:
	popq	%rdx              		# %rdx contains ASCII value of the element popped from the stack
	cmpq	$40, %rdx     			# if (ASCII == 40)
	je		.set_temp               
	jmp 	.exit_zero

.Stack_Pull2:
	popq	%rdx              		# %rdx contains ASCII value of the element popped from the stack
	cmpq	$91, %rdx       		# if (ASCII == 91)
	je		.set_temp               
	
	jmp 	.exit_zero            # if (ASCII != 40 && ASCII != 91) return 0

.Stack_Pull3:
	popq	%rdx              		# %rdx contains ASCII value of the element popped from the stack
	cmpq	$123, %rdx      		# if (ASCII == 123)
	je		.set_temp               
	jmp 	.exit_zero

.Stack_Pull4:
    popq    %rdx
    cmpq    $60, %rdx
    je      .set_temp
    jmp     .exit_zero

.set_temp:
	dec 	%r9                 # count-- (if stack is popped)
	inc 	%rcx                # i++
    cmpq    %rdi, %rcx          # if(i >= n)
    jge     .final_check
	jmp 	.loop

.final_check:
	cmpq 	$0, %r9				# if (count == 0) return 1
	je 		.exit_one
	jne 	.exit_zero

.exit_zero:
	movq	$0, %rax            # return 0
    movq    %rbp, %rsp
    popq    %rbp
	ret

.exit_one:
	movq	$1, %rax            # return 1
    movq    %rbp, %rsp
    popq    %rbp
	ret
    
