section .text
    global memset

memset:
    cmp rdi, 0
    je _end
    mov rax, rdi
    cmp rsi, 0
    je _end
    cmp rdx, 0
    jle _end

_loop:
    cmp rdx, 0
    je _end
    mov byte [rax], sil
    inc rax
    dec rdx
    jmp _loop

_end:
    mov rax, rdi
    ret

