section .text
global memcpy

memcpy:
	mov	rcx, 0

_loop:
	cmp	rcx, rdx
	jz	end
	mov	r10b, byte [rsi + rcx]
	mov	byte [rdi + rcx], r10b
	inc	rcx
	jmp	_loop

end:
	mov rax, rdi
	ret