# xac dinh so nao lon hon
.data 
	str1: .asciiz "Nhap so thu nhat: "
	str2: .asciiz "Nhap so thu hai: "
	str3: .ascii "So lon hon la: "
.text
	.globl main
main: 
	#print str1
	li $v0, 4
	la $a0, str1
	syscall
	#read num1
	li $v0,5
	syscall
	la $t1, ($v0) #load so 1 vao t1
	#print str2
	li $v0, 4
	la $a0, str2
	syscall
	#read num2
	li $v0, 5
	syscall
	la $t2, ($v0) #load so 2 vao t2
	#print str3
	li $v0, 4
	la $a0, str3
	syscall
	#if else so sanh 2 so
	slt $t3,$t1,$t2
	beqz $t3,else
	la $a0, ($t2)
	li $v0, 1
	syscall
	j Endif
	else: 
		la $a0, ($t1)
		li $v0, 1
		syscall
	Endif: 
	
	
