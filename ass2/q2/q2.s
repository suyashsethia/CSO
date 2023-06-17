.global binarySearch    

#arr =  %rdi           
#l   = %rsi            
#r   = %rdx            
#x   = %rcx            

binarySearch:          # Start of the 'binarySearch' function
    cmpq   %rdx, %rsi      # Compare the value in %rdx (r) with the value in %rsi (l)
    jg     .end           # Jump to .end if r > l
    movq    %rdx , %r8     # Move the value in %rdx (r) to %r8
    addq    %rsi , %r8     # Add the value in %rsi (l) to %r8
    shrq    $1   , %r8     # Shift the value in %r8 by 1 bit (divide by 2)
    movq   %r8 , %rax      # Move the value in %r8 to the return value register %rax
    cmpq   %rcx , (%rdi,%r8,8)     # Compare the value at index (%rdi + %r8 * 8) with %rcx (x)
    je     .return        # Jump to .return if the values are equal

    cmpq   %rcx , (%rdi,%r8,8)     # Compare the value at index (%rdi + %r8 * 8) with %rcx (x)
    jg     .left          # Jump to .left if the value is greater than %rcx (x)
    jmp  .right           # Jump to .right (no condition specified)

.end:                   # Label indicating the end of the function
    movq   $-1, %rax      # Move the value -1 to the return value register %rax
    ret                   # Return from the function

.return:                # Label for the case where the target value is found
    movq   %r8, %rax      # Move the value in %r8 to the return value register %rax
    ret                   # Return from the function

.left:                  # Label for the case where the value is less than the target
    movq   %r8, %rdx      # Move the value in %r8 to %rdx (r)
    decq   %rdx           # Decrement the value in %rdx by 1
    jmp    binarySearch   # Jump back to the start of the 'binarySearch' function

.right:                 # Label for the case where the value is greater than the target
    movq   %r8, %rsi      # Move the value in %r8 to %rsi (l)
    incq   %rsi           # Increment the value in %rsi by 1
    jmp    binarySearch   # Jump back to the start of the 'binarySearch' function
