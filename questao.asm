global question

segment .text

; Par é qualquer número que subtrair 2 sucessivamente será igual a zero
; Se for menor que zero, ele é ímpar

question:
	mov ebx, edi ; Por onde recebemos o valor
	jmp _testar	 ; Pula até o ponto da função testar

_testar:
	cmp ebx, 0	 ; Compara o valor de ebx com zero
	je _par		 ; Igual a zero
	je _impar	 ; Menor que zero
	sub ebx, 2
	jmp _testar

_par:
	mov eax, 1
	ret

_impar:
	mov eax, 0
	ret