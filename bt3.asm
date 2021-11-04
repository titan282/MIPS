#Nhap ky tu hoa xuat ky tu thuong
.data 
	str1: .asciiz "Nhap mot ky tu: "
	str2: .asciiz "\n Ky tu thuong: "
.text 
	.globl main
main:
	#print str1
	li $v0, 4
	la $a0, str1
	syscall
	
	#read char-input
	
	li $v0, 12
	syscall
	
	# luu v0 vao t1 print str2
	la $t1, ($v0)
	li $v0, 4
	la $a0, str2
	syscall
	
	# print output
	
	addi $a0, $t1, 32
	li $v0, 11
	syscall
