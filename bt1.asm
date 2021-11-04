#Nhap chuoi xuat chuoi
.data
	str1: .asciiz "Nhap mot chuoi: "
	str2: .asciiz "Chuoi da nhap: "
	str_input: .asciiz
.text
	.globl main
main:
	#Print str1
	li $v0,4
	la $a0,str1
	syscall
	#Read str_input
	li $v0, 8
	la $a0, str_input
	la $a1, 50
	syscall
	#printf str2
	addi $t1, $a0,0 #save strinput vao t1
	li $v0,4
	la $a0,str2
	syscall
	#print strinput
	li $v0, 4
	la $a0, ($t1)
	syscall 
