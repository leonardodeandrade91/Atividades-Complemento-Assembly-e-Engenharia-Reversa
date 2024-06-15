section .data
	v1 dw '105', 0xa ; 5 no formato variável

section .bss ; Na .bss colocamos todas as variáveis que quisermos
	buffer: resb 10 ; Máximo de caracteres permitidos

section .text
	global _start

_start:
	call converter_valor
	call mostrar_valor

_final: ; Label indicando finalização:
	mov eax, 1
	mov ebx, 0

	int 0x80

converter_valor:
	lea esi, [v1]
	mov ecx, 3
	call string_to_int
	add eax, 1

	ret

mostrar_valor:
	lea esi, [buffer]
	call int_to_string
	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	mov edx, 10

	int 0x80

	ret

; Converte string para inteiro:

string_to_int:
	xor ebx, ebx

.prox_digito:
	movzx eax, byte [esi]
	inc esi
	sub al, '0'
	imul ebx, 10
	add ebx, eax
	loop .prox_digito
	mov eax, ebx

	ret

; Converter inteiro para string:
; Entrada eax (inteiro pra converter) e esi (ponteiro da string)
; Saída eax

int_to_string:
	add esi, 9
	mov byte [esi], 0
	mov ebx, 10

.prox_digito:
	xor edx, edx
	div ebx
	add dl, '0'
	dec esi
	mov [esi], dl
	test eax, eax
	jnz .prox_digito ; Pule até ser zero
	mov eax, esi

	ret