section .text
global strrchr

strrchr:
    xor rax, rax

find_last:
    cmp byte [rdi], 0
    je end
    cmp byte [rdi], sil
    je set_last
    inc rdi
    jmp find_last

set_last:
    mov rax, rdi
    inc rdi
    jmp find_last

_ret:
    mov rax, rdi
    ret

end:
    cmp rsi, 0
    je _ret
    ret