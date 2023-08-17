section .text
global strcasecmp

strcasecmp:
    xor rax, rax
    mov rcx, 0

_loop:
    mov r10b, byte [rdi + rcx]
    mov r11b, byte [rsi + rcx]
    cmp r10b, 'a'
    jl _not_lowercase
    cmp r10b, 'z'
    jg _not_lowercase
    sub r10b, 32

_not_lowercase:
    cmp r11b, 'a'
    jl _comp
    cmp r11b, 'z'
    jg _comp
    sub r11b, 32

_comp:
    cmp r10b, r11b
    jne end
    cmp r10b, 0
    je end
    cmp r11b, 0
    je end
    inc rcx
    jmp _loop

end:
    movzx rax, r10b
    movzx rcx, r11b
    sub rax, rcx
    ret