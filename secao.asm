section .data
	ola db "Olá, "
	ana db "Ana."

section .text
	global _start

_start:
	; Imprimindo a mensagem "Olá"
	mov rax, 1
	mov rdi, 1
	mov rsi, ola
	mov rdx, 9

	syscall

	; Encerrando o programa
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