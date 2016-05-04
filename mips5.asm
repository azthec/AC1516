.data

	_text: 
		.asciiz "This is the string to be used to generate the histogram."
	_histogram:
		.word 0:26                    #array de inteiros

.text

	#valores ascii A-Z 65-90 & a-z 97-122

	la $s0, _text                         #load pointer to beggining of _text
	la $s1, _histogram                    # load pointer to beggining of _histogram

	_loop:
		lb $t0, 0($s0)                  #set t0 to point at beggining of text
		beq $t0, $zero, _print            #string terminated, exit, null terminator = \0 ascii ou seja 00000000
		addiu $t1, $zero, 65            # set $t1 a 65 para depois verificar se o caracter é maisculo
		blt $t0, $t1, _exit2            #se t0 for menor que t1 entao branch para exit1 (numero nao é uma letra)			porque nao sair para exit2?
		addiu $t1, $zero, 90	        #set t1 para 90 para depois verificar se o caracter é minusculo
		bgt $t0, $t1, _exit1		#se t0 for maior que t1 entao branch para exit1 (numero nao é uma letra)
		subi $t0, $t0, 65		#subtrai ao codigo da letra 65, para ir parar a posicao certa da do vector histogram
		sll $t0, $t0, 2			#avança o "ponteiro" de _text 4 casas para a direita
		add $t1, $s1, $s0		#
		lw $t2, 0($t1)
		addiu $t2, $t2, 1		#aumentar o valor do caracter t2 do array por 1
		sw $t2, 0($t1)
		j _loop
	
	_exit1: 
		addiu $t1, $zero, 97
		blt $t0, $t1, _exit2
		addiu $t1, $zero, 122
		bgt $t0, $t1, _exit2
		subi $t0, $t0, 97
		sll $t0, $t0, 2
		add $t1, $s1, $s0
		lw $t2, 0($t1)
		addiu $t2, $t2, 1
		sw $t2, 0($t1)
		j _loop
	
	
	
	_exit2:
		addiu $s0,$s0,1
		j _loop
	
	
	
	_print: 					#fazer print syscall exit syscall
		addiu $s0, $zero, 0
	_printloop:
		la $s1, _histogram
		beq $s0, 26, _end
		addiu $a0, $s1, 0
		addiu $s1, $s1, 1
		addiu $v0, $zero, 1
		syscall
		j _printloop
	_end:
		addiu $v0, $zero, 10
		syscall
	
	
	
	
	
	
	
	