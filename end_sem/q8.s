.global waveSort
waveSort:
movq $0, %rax        # i = 0
loop_start:
    cmpq %rsi, %rax    # Compare i with n
    jge loop_end       # Jump to loop_end if i >= n
    
    cmpq $0, %rax      # Compare i with 0
    jle no_swap1       # Jump to no_swap1 if i <= 0
    
    movq (%rdi, %rax, 8), %rbx   # arr[i]
    movq %rax , %r8 
    decq %r8
    movq (%rdi, %r8, 8 ), %rcx   # arr[i-1]
    cmpq %rcx, %rbx    # Compare arr[i] with arr[i-1]
    jg no_swap1       # Jump to no_swap1 if arr[i] >= arr[i-1]
    
    xchgq %rbx, %rcx   # Swap arr[i] and arr[i-1]
    movq %rcx, (%rdi, %r8, 8)
    movq %rbx, (%rdi, %rax, 8)

no_swap1:
    movq %rsi , %r12
    decq %r12
    cmpq %r12, %rax    # Compare i with n
    jge loop_end       # Jump to loop_end if i >= n
    
    movq (%rdi, %rax, 8), %rbx   # arr[i]
    movq %rax , %r8 
    incq %r8
    movq (%rdi, %r8, 8 ), %rcx   # arr[i+1]
    cmpq %rcx, %rbx    # Compare arr[i] with arr[i+1]
    jg no_swap2       # Jump to no_swap2 if arr[i] >= arr[i+1]
    
    xchgq %rbx, %rcx   # Swap arr[i] and arr[i+1]
    movq %rcx, (%rdi, %r8, 8)
    movq %rbx, (%rdi, %rax, 8)

no_swap2:
    addq $2, %rax      # i += 2
    jmp loop_start     # Jump to loop_start
loop_end:
    ret
