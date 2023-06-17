.global findNearest

findNearest:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   $1000000
    xorq    %rcx, %rcx     # i = 0
    xorq    %r9, %r9       # count = 0, count in stack
    xorq    %r11, %r11     # ans_point = 0
.loop:
    xorq    %r8, %r8       # j = 0
    cmpq    %rcx, %rdx     # i < n
    jle .end
    movq  (%rdi, %rcx,8), %rbx # rbx = array[i]
    popq    %rax               # rax= stack top
    cmpq    %rbx, %rax         # *array, stack top
    jl .greater
    jmp .push

.greater:
    cmpq    %r8, %r9       # j < count
    jle .push2
    movq    %rbx, (%rsi)   # move *array value to answer array + ans_point
    addq    $8, %rsi       # increment ans pointer by 8 bytes (sizeof(long long int))
    popq    %rax           # pop stack top
    incq    %r11           # ans_point++
    incq    %r8            # j++
    jmp .greater

.push2:
    pushq   $1000000       # push 1000000
    pushq   %rbx           # push *array
    incq    %rcx           # i++
    xorq    %r9, %r9       # count = 0
    incq    %r9            # count = 1
    jmp .loop

.push:
    pushq   %rax           # push stack top
    pushq   %rbx           # push *array
    incq    %r9            # count++
    incq    %rcx           # i++
    jmp .loop

.end:
    
    cmpq    %r8, %r9       # j < count
    jle .return
    movq    $-1, (%rsi)    # move -1 to answer array + ans_point
    addq    $8, %rsi       # increment ans pointer by 8 bytes (sizeof(long long int))
    incq    %r11           # ans_point++
    incq    %r8            # j++
    jmp .end

.return:
    popq    %rbx           # remove the unnecessary popq
    movq    %rbp, %rsp
    popq    %rbp
    ret

