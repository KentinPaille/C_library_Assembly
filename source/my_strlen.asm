section .text
global strlen

strlen:
    mov rax, 0
    test rdi, rdi
    je _end

_loop:
    cmp byte [rdi + rax], 0x00
    je _end
    inc rax
    jmp _loop

_end:
    ret
