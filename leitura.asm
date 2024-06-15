section .data
	perg db "Como você se chama? "
	tamPerg equ $- perg

	ola db "Olá, "
	tamOla equ $- ola
	tamNome equ 10

section .bss
	nome resb tamNome

section .text
	global _start

_start:
	; Imprimindo a mensagem "Como você se chama"
	mov rax, 1
	mov rdi, 1
	mov rsi, perg
	mov rdx, tamPerg

	syscall

	; Ler o nome do usuário
	mov rax, 0
	mov rdi, 0
	mov rsi, nome
	mov rdx, tamNome

	syscall

	; Imprimir "Olá"
	mov rax, 1
	mov rdi, 1
	mov rsi, ola
	mov rdx, tamOla

	syscall

	; Imprimir nome do usuário
	mov rax, 1
	mov rdi, 1
	mov rsi, nome
	mov rdx, tamNome

	syscall

	; Encerrar o programa
	mov rax, 60
	mov rdi, 0

	syscall

; Registradores como ax são de 16 bits, eax de 32 bits e rax de 64 bits
; Registradores estão na CPU
; Dentro do rax tem eax, do eax tem ax, etc.
; rax - id do system call
; rdi - primeiro parâmetro
; rsi - segundo parâmetro
; rdx - terceiro parâmetro
; r10 - quarto parâmetro
; r9 - quinto parâmetro
; r8 - sexto parâmetro

; Chamadas syscall:
; 0 - sys_read
; 1 - sys_write
; 2 - sys_open
; 3 - sys_close
; 60 - sys_exit

; rdi:
; 0 - entrada padrão
; 1 - saída padrão
; 2 - erro

; sys_exit:
; 0 - deu certo
; 1 - deu erro