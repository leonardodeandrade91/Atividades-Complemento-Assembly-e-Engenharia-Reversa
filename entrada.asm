; Programa para entrada de dados:

; Variávelis declaradas e inicializadas

SYS_EXIT	equ 1
RET_EXIT	equ 5
SYS_READ	equ 3
SYS_WRITE	equ 4
STD_IN		equ 0
STD_OUT		equ 1
MAX_IN		equ 10

; Sessões:

segment .data
	msg db "Entre com seu nome: ", 0xA, 0xD
	len equ $- msg

; Sessão para inicialização de informações que serão usadas:

segment .bss
	nome resb 2

segment .text
	global _start

; Função:

_start:
	; Usando as variáveis fica mais fácil saber o que cada comando faz
	mov eax, SYS_WRITE
	mov ebx, STD_OUT
	mov ecx, msg
	mov edx, len

	int 0x80

	; Entrada de dados, na ordem leitura, entrada, variável e máximo de caracteres:

	mov eax, SYS_READ
	mov ebx, STD_IN
	mov ecx, nome
	mov edx, MAX_IN

	int 0x80

exit:
	mov eax, SYS_EXIT
	mov ebx, RET_EXIT

	int 0x80