.data
	myArray: .space 12
.text 
main:
	li $s0, 10
	li $s1, 100
	li $s2, 1000
	
	sw $s0, myArray+0
	sw $s1, myArray+4
	sw $s2, myArray+8
	
	li $v0,1
	lw $a0, myArray
	syscall