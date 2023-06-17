.global special_op
special_op:
    pushq   %rbp
    movq    %rsp, %rbp

    # Save function arguments to stack frame
    movq    %rdi, -8(%rbp)     # arg1
    movq    %rsi, -16(%rbp)    # arg2
    movq    %rdx, -24(%rbp)    # arg3
    movq    %rcx, -32(%rbp)    # arg4
    movq    %r8, -40(%rbp)     # arg5
    movq    %r9, -48(%rbp)     # arg6

    # Perform the desired operations
    movq    -8(%rbp), %rdi     # arg1 -> %rdi
    movq    -16(%rbp), %rax    # arg2 -> %rax
    addq    %rax, %rdi         # %rdi += %rax
    movq    -24(%rbp), %rax    # arg3 -> %rax
    addq    %rax, %rdi         # %rdi += %rax
    movq    -32(%rbp), %rax    # arg4 -> %rax
    addq    %rax, %rdi         # %rdi += %rax
    movq    -40(%rbp), %rax    # arg5 -> %rax
    addq    %rax, %rdi         # %rdi += %rax
    movq    -48(%rbp), %rax    # arg6 -> %rax
    addq    %rax, %rdi         # %rdi += %rax
    movq    16(%rbp), %rax     # local variable -> %rax
    addq    %rdi, %rax         # %rax += %rdi
    subq    24(%rbp), %rax     # subtract  from %rax
    popq    %rbp
    ret
