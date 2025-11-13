section .data
greeting db 'Greetings, Kindly Good Sir.', 0

section .text
global _start

_start:
	; write our string to stdout
	mov rax, 1			; syscall: write
	mov rdi, 1			; file descriptor: stdout
	mov rsi, greeting		;pointer to string
	mov rdx, 27			; length of string
	syscall

	; exit
	mov rax, 60			; syscall: exit
	xor rdi, rdi		; exit code 0
	syscall