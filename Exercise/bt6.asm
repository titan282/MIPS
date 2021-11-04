.data 
	str1: .asciiz "Nhap vao mot ky tu: "
	str2: .asciiz "Ky tu vua nhap: "
	str3: .asciiz
	str4: .asciiz " la so\n"
	str5: .asciiz " la chu hoa\n"
	str6: .asciiz " la chu thuong\n"
.text 
	.globl main
main:
	loop:
	#pint str1
	li $v0,4
	la $a0, str1
	syscall
	#read charactor
	li $v0,12
	syscall
	la $t1,($v0)
	#compare < 58
	slti $t2,$t1,58
	beqz $t2,next1
	#print la so
	li $v0, 4
	la $a0, str4
	syscall
	j  loop
	next1:
	#print la chu
	slti $t2,$t1,91
	beqz $t2,next2
	li $v0,4
	la $a0,str5
	syscall
	j loop
	next2:
	li $v0, 4
	la $a0, str6
	syscall
	j loop
	
	
