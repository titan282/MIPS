.data
	message: .asciiz "Hello everybody"
.text
	main:
	li $a1,100
	li $a2, 50
	jal addNumbers
	#print result
	li $v0, 1
	la $a0, ($v1)
	syscall
	#Exit
	li $v0, 10
	syscall
	
	addNumbers:
		add $v1,$a1,$a2
		jr $ra
		