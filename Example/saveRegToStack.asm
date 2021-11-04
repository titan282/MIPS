.data
.text
main: 
	addi $s0, $0, 10
	jal add30
	
	b printValues0
	
	#Exit
	li $v0,10
	syscall
add30: 
	addi $sp, $sp, -8
	sw $s0,0($sp)
	sw $ra,4($sp) 
	addi $s0, $s0, 30
	
	b printValues0
	
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp,$sp,8
	jr $ra
printValues0: 
	li $v0,1
	la $a0, ($s0)
	syscall
	jr $ra