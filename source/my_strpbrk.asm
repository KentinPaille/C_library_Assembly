section .text
global strpbrk

strpbrk:
    xor rax, rax

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
    jmp _loop

_find:
    mov rax, rdi
    ret

_end:
    xor rax, rax
    ret