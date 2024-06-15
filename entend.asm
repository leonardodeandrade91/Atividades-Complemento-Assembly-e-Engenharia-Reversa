section .text
	global _start

_start:
	mov eax, 1
	mov ebx, 2 ; Valor de retorno ao método

	int 0x80