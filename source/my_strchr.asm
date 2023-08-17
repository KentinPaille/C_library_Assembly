section .text
global strchr

strchr:
    xor rax, rax

_loop:
    cmp byte [rdi], 0
    je _end
    cmp byte [rdi], sil
    je _found
    inc rdi
    jmp _loop

_found:
    mov rax, rdi
    ret

_end:
    cmp byte [rdi], sil
    je _found
    ret
