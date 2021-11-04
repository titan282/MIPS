# Nhap 1 ky tu va in ra lien truoc,lien sau
.data
	str1: .asciiz "Nhap mot ki tu: "
	str2: .asciiz "\nKy tu lien truoc: "
	str3: .asciiz "\nKy tu lien sau: "
.text
	.globl main
main:
	#In chuoi 1
	li $v0, 4
	la $a0, str1
	syscall
	#Doc char
	li $v0, 12
	syscall
	
	#Luu char vao t1
	la $t1, ($v0)
	# Doc chuoi 2
	li $v0, 4
	la $a0, str2
	syscall
	# Hien lien ke t1
	
	addi $a0, $t1, -1
	li $v0, 11
	syscall
	# prin chuoi 3
	li $v0, 4
	la $a0, str3
	syscall
	#in lien ke
	addi $a0, $t1, 1
	li $v0, 11
	syscall
	
	
	
	
	
