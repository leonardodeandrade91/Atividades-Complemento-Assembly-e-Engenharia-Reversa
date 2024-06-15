section .data:
	; Isso define a variável com o nome msg do tipo binário
	; E que ela está na posição 0xa

	msg db "Olá, Mundo!", 0xa ; Cada caractere ocupa 1 byte, msg é um ponteiro para a mensgem

	; Isso define o tamanho da variável:

	len equ $- msg

section .text:
	; Primeiro, nessa sessão do programa, ele entra nesse método

	global _start

; Criação do método:
_start:
	; Acumulador de registro de dados, ele move edx para len, ecx para msg, etc;
	mov edx, len

	; Acumulador de registro de conta (operações string). Move ecx para nossa mensagem (onde ela é escrita):
	mov ecx, msg

	; Acumulador de registro base. Nosso arquivo de saída (no caso nossa mensagem):
	mov ebx, 1

	; Acumulador pra operações numéricas. Manda informação pro sistema (no caso de tamanho):
	mov eax, 4

	; Endereço do Kernel (manda pro Kernel executar os códigos de _start):
	int 0x80

	; Saída do programa, para finalizar ele:
	mov eax, 1
	mov ebx, 0

	int 0x80	