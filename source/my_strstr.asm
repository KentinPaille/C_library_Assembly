section .text
global strstr

strstr:
    xor rax, rax

_loop:
    cmp byte [rdi], 0
    je _end
    mov rcx, -1

_check:
    inc rcx
    cmp byte [rsi + rcx], 0
    je _found
    mov r10b, byte [rsi + rcx]
    cmp byte [rdi + rcx], r10b
    je _check
    inc rdi
    jmp _loop

_found:
    mov rax, rdi
    ret

_end:
    xor rax, rax
    ret