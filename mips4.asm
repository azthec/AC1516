.data
	_squares:
		.word 0:64
		
		
.text

	la $s3, _squares
	
	_main:
		
				# i      = $s0
				# sum     = $s1
				# upto    = $s2
				# squares = $s3
		addiu $v0, $zero, 5
		syscall
		add $a0, $zero, $v0
		
		jal _storeValues
		
		jal _computeSum
		
		addiu $a0, $s1, 0
		addiu $v0, $zero 1
		syscall
		addiu $v0, $zero, 10
		syscall
		
	_storeValues:
		
		addiu $s0, $zero, 0
		_loop:
		bge $s0, $a0, _exit
			
			mul $t0, $s0, $s0
			sw  $t0, 0($s3)
			addiu $s3, $s3, 4
			
		
		addiu $s0, $s0, 1
		j _loop
		
		_exit:
		
		jr $ra
		
	_computeSum:
		
		addiu $s1, $zero, 0
		la $s3, _squares
		
		addiu $s0, $zero, 0
		_loop2:
		bge $s0, $a0, _exit2
		
			lw $t0, 0($s3)
			addiu $s3, $s3, 4
			add $s1, $s1, $t0
			
		addiu $s0, $s0, 1
		j _loop2
		
		_exit2:
		
		jr $ra
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			