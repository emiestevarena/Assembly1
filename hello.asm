;
;Constants
;
SYS_WRITE equ 1

section .data
	askName db "Enter name",10
	askName_l equ $-askName
	text db "Hi, "
		

section .bss
	inName resb 16

section .text
	global _start

_start:

	call _printHi

	mov rax, 60
	mov rdi, 0
	syscall

_printHi:
	call _eNameA
	call _eNameB
	call _printHiA
	call _printHiB
	ret
	
_printHiA:

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, text
	mov rdx, 4
	syscall
	ret

_printHiB:
	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, inName
	mov rdx, 16
	syscall
	ret

_eNameA:

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, askName
	mov rdx, askName_l
	syscall
	ret

_eNameB:

	mov rax, 0
	mov	rdi, 0
	mov rsi, inName
	mov rdx, 16
	syscall
	ret