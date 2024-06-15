section .data
	; dd - Define double word - 4 bytes
	; db - Define byte - 1 byte
	; dw - Define word - 2 bytes
	; dq - Define quad word - 4 bytes
	; dt - Define ten word - 10 bytes

	x dd 50

	y dd 10

	msg1 db "X maior que Y", 0xa
	len1 equ $- msg1
	msg2 db "Y maior que X", 0xa
	len2 equ $- msg2

section .text
	global _start

_start:
	mov eax, DWORD [x]
	mov ebx, DWORD [y]
	cmp eax, ebx ; Pode ser maior, menor ou igual

	; Chamada de método e compara números:
	jge maior	; Significados: je = | jg > | jge >= | jl < | jle <= | jne !=
	mov edx, len2
	mov ecx, msg2

	; Pula para outro método:
	jmp final

; Definição dos métodos:

maior:
	mov edx, len1
	mov ecx, msg1

final:
	mov ebx, 1
	mov eax, 4

	int 0x80

	mov eax, 1

	int 0x80