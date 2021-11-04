# Nhap chuoi n phan tu va xuat no
.data
	str1: .asciiz "Nhap n: "
	str2: .asciiz "Nhap chuoi: "
	space: .asciiz " "
	array: .word 0:30
.text 
	.globl main
main: 
	#Nhap n:
	li $v0, 4
	la $a0, str1
	syscall
	#Read n
	li $v0, 5
	syscall
	
	li $v0, 4
	la $a0, str2
	
	la $t1, ($v0)
	addi $t2, $t1,-1
	li $s1,0 # i=0
	li $s2,0
	while1: bgt $s1,$t2,while2 
		#read integer store int array
		li $v0, 5
		syscall
		mul $t3, $s1,4
		sw $v0, array($t3)
		addi $s1, $s1, 1
		j while1
	while2: bgt $s2, $t2, exit
		li $v0,1
		mul $t3, $s2,4
		lw $a0, array($t3)
		syscall
		li $v0, 4
		la $a0, space
		syscall
	   	addi $s2,$s2,1
	   	j while2
exit: