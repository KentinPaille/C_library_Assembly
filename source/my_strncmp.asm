section .text
global strncmp

strncmp:
    test rdi, rdi
    jz _exit
    test rsi, rsi
    jz _exit
    mov rcx, rdx

_loop:
    mov r10b, byte [rdi]
	mov r11b, byte [rsi]
	cmp r10b, 0
	je _end
	cmp r11b, 0
	je _end
	cmp r10b, r11b
	jne _end
    dec rcx
    jz _end
	inc rdi
	inc rsi
	jmp _loop

_exit:
    mov rax, 0
    ret

_end:
    movzx rax, r10b
    movzx rbx, r11b
    sub rax, rbx
    ret