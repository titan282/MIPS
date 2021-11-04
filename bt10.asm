#Nhap mang so nguyen lay ra so lon nhat
.data
	array: .word 0:30
	message1: .asciiz "Nhap do dai mang:  "
	message2: .asciiz "Nhap mang so nguyen: \n"
	messageMax: .asciiz "Max cua mang la: "
	messageMin: .asciiz "\nMin cua mang la: "
.text
main: 
	#print(message1)
	li $v0,4
	la $a0, message1
	syscall
	#read(n)
	li $v0,5
	syscall
	la $t1, ($v0) # n= t1
	#print(message2)
	li $v0,4
	la $a0, message2
	syscall
	
	li $t2,0
	while1: beq $t2, $t1, initial # Nhap
		#read(int)
		li $v0,5
		syscall
		mul $t4,$t2,4
		sw $v0, array($t4)
		addi $t2,$t2,1
		j while1
	initial:
		lw $s1,array+0 #max
		lw $s2,array+0 #min
		li $t2,0
	while2: beq $t2, $t1, exit
		la $a1,($s1) #a1 max
		mul $t4,$t2,4
		lw $a2,array($t4)
		jal max2num
		la $s1,($v1)
		
		la $a1, ($s2) #a1 min
		jal min2num
		la $s2,($v1)
		addi $t2,$t2,1
		j while2
	exit:
		#print(messageMax)
		li $v0, 4
		la $a0, messageMax
		syscall
		#print(max)
		li $v0,1
		la $a0, ($s1)
		syscall
		#print(messageMin)
		li $v0, 4
		la $a0, messageMin
		syscall
		#print(min)
		li $v0, 1
		la $a0, ($s2)
		syscall
		#exit
		li $v0,10
		syscall
max2num:
	bgt $a1,$a2, assignMax
	la $v1, ($a2)
	j exitFunction
	assignMax: 
		la $v1, ($a1)
	exitFunction:
		jr $ra
min2num:
	bgt $a1,$a2, assignMin
	la $v1, ($a1)
	exitFunctionMin:
	jr $ra
	assignMin: 
		la $v1, ($a2)
		j exitFunctionMin	 
