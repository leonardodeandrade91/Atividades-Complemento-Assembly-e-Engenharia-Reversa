section .data ; Variáveis fixas
	; Tit é o tipo da variável
	tit			db 10, "+-------------+", 10, "| Calculadora |", 10, "             ", 10, "+-------------+", 0
	ltit		equ $- tit

	obVal1		db 10, "Valor 1: ", 0
	lobVal1		equ $- obVal1

	obVal2		db 10, "Valor 2: ", 0
	lobVal2		equ $- obVal2

	opc1		db 10, "1, Adicionar", 0
	lopc1		equ $- opc1

	opc2		db 10, "2, Subtrair", 0
	lopc2		equ $- opc2

	opc3		db 10, "3, Multiplicar", 0
	lopc3		equ $- opc3

	opc4		db 10, "4, Dividir", 0
	lopc4		equ $- opc4

	msgOpc		db 10, "Deseja realizar? ", 0
	lmsgOpc		equ $- msgOpc

	msgErro		db 10, "Valor da Opção Inválida!", 0
	lmsgErro	equ $- msgErro

	salLinha	db 10, 0
	lsalLinha 	db $- salLinha

section .bss ; Variáveis que podem mudar de valor
	opc 		resb 2
	num1		resb 10
	num2		resb 10
	result 		resb 10

section .text
	global _start

_start:
	mov ecx, tit
	mov edx, ltit
	call mst_saida

	; Valor 1

	mov ecx, obVal1
	mov edx, lobVal1
	call mst_saida

	mov ecx, num1
	mov edx, 10
	mov eax, 3
	mov ebx, 0

	int 80h

	; Valor 2

	mov ecx, obVal2
	mov edx, lobVal2
	call mst_saida

	mov ecx, num2
	mov edx, 10
	mov eax, 3
	mov ebx, 0

	int 80h

	; Opção 1

	mov ecx, opc1
	mov edx, lopc1
	call mst_saida

	; Opção 2

	mov ecx, opc2
	mov edx, lopc2
	call mst_saida

	; Opção 3

	mov ecx, opc3
	mov edx, lopc3
	call mst_saida

	; Opção 4

	mov ecx, opc4
	mov edx, lopc4
	call mst_saida

	; Ler opções:

	mov ecx, msgOpc
	mov edx, lmsgOpc
	call mst_saida

	mov ecx, opc
	mov edx, 2
	mov eax, 3
	mov ebx, 0

	int 80h

	; Conversões para decimal

	mov ah, [opc]
	sub ah, '0'

	; Verifica opções:

	cmp ah, 1
	je adicionar

	cmp ah, 2
	je subtrair

	cmp ah, 3
	je multiplicar

	cmp ah, 4
	je dividir

	mov ecx, msgErro
	mov edx, lmsgErro
	call mst_saida
	jmp exit

adicionar:
	add eax, ebx

	jmp exit

subtrair:
	sub eax, ebx

	jmp exit

multiplicar:
	mov ebx, eax
	mul ebx

	jmp exit

dividir:
	mov ebx, eax
	div ebx

	jmp exit

mst_saida:
	mov eax, 4
	mov ebx, 0

	int 80h

	ret

exit:
	mov ecx, salLinha
	mov edx, lsalLinha
	call mst_saida

	mov eax, 1
	mov ebx, 0

	int 80h