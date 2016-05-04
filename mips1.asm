##folha5 ex1

.data



.text

_main: 
	# i     = $s0
	# sum   = $s1
	# upTo  = $s2
	
	#Step 1. Load the service number in register $v0. 
	#Step 2. Load argument values, if any, in $a0, $a1, $a2, or $f12 as specified. 
	#Step 3. Issue the SYSCALL instruction. Step 4. Retrieve return values, if any, from result registers as specified.
	addiu $v0, $zero, 5     #coloca 5 na posicao do syscall,estes números sao o numero de instrucao para o syscall correr
	syscall			# (cont.) li nao faz parte do mipsr200
	addiu $s1, $zero, 0     
	
	#isto tambem é para o loop ciclo for
	addiu $s0, $zero, 0
	add  $t0, $zero, $v0
	
_loop:	
	bge $s0, $t0, _exit		#termina o loop
	
		mul $t1, $s0, $s0
		add $s1, $s1, $t1
		
	addiu $s0, $s0, 1		#adiciona 1 a i
	j	_loop 			#volta ao inicio do loop
	
_exit:
	addiu $a0, $zero, 0
	add $a0, $s1, 0
	addiu $v0, $zero, 1
	syscall
	addiu $v0, $zero, 10
	syscall				#termina programa