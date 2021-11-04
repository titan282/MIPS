#Tinh Min Max mang bang ham
.data 
	array: .word 0:30
	mess1: .asciiz "Nhap do dai mang: "
	mess2: .asciiz "Nhap mang so nguyen: \n"
	messageMax: .asciiz "Max cua mang la: "
	messageMin: .asciiz "\nMin cua mang la: "
.text
main:
	la $a0, mess1
	jal print
	jal readInt
	move $s1,$v0
	
	la $a0,mess2
	jal print
	jal readArray
	jal maxMinArray # array, s1
	
	move $t1, $v0 #max
	move $t2, $v1 #min
	la $a0, messageMax
	jal print
	move $a0, $t1
	jal printInt
	la $a0,messageMin
	jal print
	move $a0, $t2
	jal printInt

	
	#exit
	li $v0,10
	syscall

readArray:
	addi $sp,$sp, -4
	sw $ra, 0($sp)
	li $t0,0
	while1: beq $t0, $s1, exitWhile1 # Nhap
		jal readInt
		mul $t1,$t0,4
		sw $v0, array($t1)
		addi $t0,$t0,1
		j while1
	exitWhile1:
	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra
maxMinArray:
	addi $sp,$sp, -4
	sw $ra, 0($sp)
	li $t0,0
	lw $t3,array+0 #max
	lw $t4,array+0 #min
	while2: beq $t0,$s1,exitWhile2
		la $a1,($t3) #?oi so 1 la max
		mul $t2,$t0,4
		lw $a2,array($t2) # doi so 2 la 1 so trong array
		jal max2num
		la $t3,($v1)

		la $a1, ($t4) #a1 la  min
		jal min2num
		la $t4,($v1)
		addi $t0,$t0,1
		j while2
	exitWhile2:
	move $v0, $t3 #v0 la max
	move $v1, $t4 #v1 la min
	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra
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
print:
	li $v0,4
	syscall
	jr $ra
readInt:
	li $v0,5
	syscall
	jr $ra
printInt: 
	li $v0,1
	syscall
	jr $ra
