.global maxsum

maxsum:
    movq $0, %r8
    movq %rdi, %r9
    subq %rsi, %r9  
    addq $1, %r9
    movq $0, %rax
.check:
    cmpq $1, %rsi
    je .first
    jmp .check1
.first:
    movq %rsi, %rax
    subq $1, %rdi
    movq (%rdx, %rdi, 8), %rdi
    cmpq %rdi, %rax
    jl .sec
 .sec:
     movq    %rdi, %rax
     jmp .exit
 .check1:
    cmpq %r9, %rdi
    jge .loop1
    jmp .exit
.loop1:
  movq %r8, %r10
  movq %r9, %r11
  movq $0, %r12
   incq %r8
   incq %r9
 .check2:
    cmpq  $0, %r10
    jge .loop2
    jmp .check3
.check3:
   cmpq %r11, %rdi
   jg .loop3    
   cmpq %r12, %rax
   jl .last
   jmp .check1
.last:
    movq %r12, %rax
    jmp .check1
.loop2:
    addq (%rdx, %r10, 8), %r12
    decq  %r10
    jmp .check2
.loop3:
   movq (%rdx, %r11, 8), %r12
   incq %r12
   jmp .check3
 .exit:
      ret
      
