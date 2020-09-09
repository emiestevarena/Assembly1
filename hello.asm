;
;Constants
;
SYS_WRITE equ 1

section .data
	askName db "Enter name",10
	text db "Hi, "
	exc db "!",10

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
	call _printHiC
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

_printHiC:

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, exc
	mov rdx, 2
	syscall
	ret

_eNameA:

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, askName
	mov rdx, 11
	syscall
	ret

_eNameB:

	mov rax, 0
	mov	rdi, 0
	mov rsi, inName
	mov rdx, 16
	syscall
	ret