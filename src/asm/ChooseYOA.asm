
;Uninitialized Data Section
	section .bss				; block started by symbol
	UninitDat: resb 4			; reserve 4 bytes UninitDat(x32)
	
	section	.rodata				;uninitialized data
	section	.comment			;Exclude Line when finalized.

;Data Section
section .data
greeting db 'Choose Your Own Adventure.', 0


;Text Setion
section .text
global _start

_start:
	; write our string to stdout(its the game's title.)
	mov rax, 1					; syscall: write
	mov rdi, 1					; file descriptor: stdout
	mov rsi, greeting			;pointer to string
	mov rdx, 27					; length of string
	syscall

	mov eax, 4005				; eax=4005(lower portion, or rax)
	mov [UninitDat], eax		; UinitDat=4005(eax)

	; exit
	mov rax, 60					; syscall: exit
	xor rdi, rdi			; exit code 0
	syscall