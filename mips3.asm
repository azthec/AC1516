##folha5 ex4

.data

_squares:
	.word 0:64

.text
				# i      = $s0
				# sum     = $s1
				# upto    = $s2
				# squares = $s3
		
		
	la $s3, _squares	#coloca pointer do squares na primeira posicao do array

_main:
	
	
	addiu $v0, $zero, 5	#scanf int, fica guardado em $v0
	syscall
	
	add $a0,$zero,$v0
	jal _storeValues

	jal _computeSum
	
	
	
	addiu $a0, $s1, 0
	addiu $v0, $zero, 1
	syscall
	addiu $v0, $zero, 10
	syscall				#termina programa
	
_storeValues:
					#inicilizar variaveis do loop
	addiu $s0, $zero, 0		#inicializar i
	
_loop:  
	bge $s0, $a0, _exit		#termina o loop
	
	mul $t1, $s0, $s0		#multipla i*i e guarda no t1
	sw $t1, 0($s3)			# guarda o valor de t0, no array s3, na posição
	addiu $s3, $s3, 4		# faz pointer andar uma casa (4b) para a frente
	
		
	addiu $s0, $s0, 1		#adiciona 1 a i
	j	_loop 			#volta ao inicio do loop
	
_exit:
	
	
	jr $ra				#acaba funcao salta para onde estava na main
	
_computeSum:
	addiu $s1, $zero, 0 		#inicializar sum
					#inicilizar variaveis do loop
	addiu $s0, $zero, 0		#reinicializar i
	la $s3, _squares 		#reinicializar pointer do array
	
_loop2:  
	bge $s0, $a0, _exit2		#termina o loop
	
	lw $t1, 0($s3)
	addiu $s3, $s3, 4
	
	add $s1, $s1, $t1
		
	addiu $s0, $s0, 1		#adiciona 1 a i
	j	_loop2			#volta ao inicio do loop
	
_exit2: 
	
	addiu $a0, $s1, 0


	jr $ra				#acaba funcao salta para onde estava na main
