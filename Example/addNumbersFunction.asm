.data
	message: .asciiz "True"
	message2: .asciiz "False"
.text
	main:
	li $t2,50
	li $t3, 40
	
	slt $t1, $t2, $t3
	bnez $t1, trueBranch
	b falseBranch
	
	trueBranch:
		li $v0, 4
		la $a0, message
		syscall
		j END
	falseBranch:
		li $v0, 4
		la $a0, message2
		syscall
		j END	
END: