section .text
global memmove

memmove:
	mov	rcx, 0
    mov r10, rdi

_loop:
	cmp	rcx, rdx
	jz	_res_rcx
	mov	r11b, byte [rsi + rcx]
	mov	byte [r10 + rcx], r11b
	inc	rcx
	jmp	_loop

_res_rcx:
    mov rcx, 0

_cpy:
    cmp	rcx, rdx
    jz	end
    mov	r11b, byte [r10 + rcx]
    mov	byte [rdi + rcx], r11b
    inc	rcx
    jmp	_cpy

end:
	mov rax, rdi
	ret