#In xau nguoc
.data
	message1: .asciiz "Nhap chuoi: "
	string: .asciiz
.text
main:
	#print(message1)
	li $v0,4
	la $a0, message1
	syscall
	#read(string)
	li $v0, 8
	la $a0, string
	la $a1,30
	syscall
	
	jal lengthStr
	la $t1, ($v1)
	
	addi $t0,$t1,-1
	while: beq $t0,-1,exit
		lb $t2, string($t0)
		#print(t2)
		li $v0,11
		la $a0,($t2)
		syscall

		addi $t0,$t0,-1
		j while
	exit:
		li $v0,10
		syscall		 
lengthStr:
	li $t0,0
	lb $s1,string+0
	whileFunc: beq $s1, 0, exitFunction
		addi $t0, $t0,1
		lb $s1,string($t0)
		j whileFunc
	exitFunction:
	addi $v1, $t0,-1
	jr $ra
