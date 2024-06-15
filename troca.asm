global getValorASM ; Mesmo nome no arquivo cpp

segment .text

getValorASM:
	mov eax, edi ; Pega o valor que receberá do C++
	add eax, 1

	ret