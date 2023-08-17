section .text
global strcspn

strcspn:
    xor rax, rax
    mov rcx, 0

_loop:
    cmp byte [rdi], 0
    je _end
    mov rbx, rsi

_check:
    cmp byte [rbx], 0
    je _incr
    mov r10b, byte [rbx]
    cmp byte [rdi], r10b
    je _find
    inc rbx
    jmp _check

_incr:
    inc rdi
    inc rcx
    jmp _loop

_find:
    mov rax, rcx
    ret

_end:
    mov rax, rcx
    ret