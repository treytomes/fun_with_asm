; ------------------------------------------------------------------------------
; Write a little triangle of asterisks to standard output.
; Runs on 64-bit Linux only.
;
; To assembly and run:
;
;	nasm -felf64 hello.asm && ld hello.o && ./a.out
; ------------------------------------------------------------------------------

	global	_start

	section	.text
_start:

	mov	rcx, 8
_block:
	push	rcx
_line:
	mov	al, '*'
	call	_writeChar
	loop	_line
	pop	rcx
	mov	al, 10
	call	_writeChar
	loop	_block
		
	mov	rax, 60			; system call for exit
	xor	rdi, rdi		; exit code 0
	syscall				; invoke operating system to exit

; ------------------------------------------------------------------------------
; Write a single character to standard output.
;
; Input:
;	AL	The character to write.
; ------------------------------------------------------------------------------
_writeChar:
	push	rax
	push	rbx
	push	rcx
	push	rdi
	push	rsi

	xor	rbx, rbx
	mov	bl, al
	push	rbx			; top of stack = string to output
	mov	rsi, rsp		; address of the string to output
	mov	rdx, 1			; print 1 byte
	
	mov	rax, 1			; system call for write
	mov	rdi, 1			; file handle 1 is stdout
	syscall
	
	pop	rbx			; pull the string off the stack
	
	pop	rsi
	pop	rdi
	pop	rcx
	pop	rbx
	pop	rax
	ret

	section	.data

