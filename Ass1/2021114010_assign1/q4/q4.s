.data
    result: .quad 1    # Declare a variable named 'result' and initialize it with the value 1
.text

.globl get_product_assembly

get_product_assembly:
        pushq   %rbp     # Push the value of the base pointer onto the stack
        movq    %rsp, %rbp     # Set the base pointer (rbp) to the current stack pointer (rsp)
        movq    %rdi, -24(%rbp)    # Move the first function argument (rdi) to a local variable at -24(%rbp)
        movq    -24(%rbp), %rbx    # Move the value from -24(%rbp) to the register rbx
        movq    %rbx, -16(%rbp)    # Move the value from rbx to a local variable at -16(%rbp)
        movq    $1, -8(%rbp)    # Move the immediate value 1 to a local variable at -8(%rbp)
.Logic2:
        cmpq    $0, -16(%rbp)    # Compare the value at -16(%rbp) with 0
        jne     .Login3    # Jump to .Login3 if the previous comparison is not equal (jump if not zero)
        movq    -8(%rbp), %rbx    # Move the value from -8(%rbp) to rbx
        popq    %rbp    # Restore the base pointer from the stack
        movq   %rbx, %rax    # Move the value from rbx to the return value register rax
        ret    # Return from the function
.Login3:
        movq    -16(%rbp), %rbx    # Move the value from -16(%rbp) to rbx
        movq    (%rbx), %rbx    # Move the value pointed to by rbx to rbx
        movq    -8(%rbp), %rdx    # Move the value from -8(%rbp) to rdx
        imulq   %rdx, %rbx    # Multiply the value in rbx by rdx and store the result in rbx
        movq    %rbx, -8(%rbp)    # Move the value from rbx to -8(%rbp)
        movq    -16(%rbp), %rbx    # Move the value from -16(%rbp) to rbx
        movq    8(%rbx), %rbx    # Move the value at address 8(%rbx) to rbx
        movq    %rbx, -16(%rbp)    # Move the value from rbx to -16(%rbp)
        jmp     .Logic2    # Jump to .Logic2 (loop back to the beginning)
