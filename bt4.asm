#Nhap va tinh tong hieu 2 so do
.data
	str1: .asciiz "Nhap so thu nhat: "
	str2: .asciiz "Nhap so thu hai: "
	sum_str: .asciiz "Tong: "
	hieu_str: .asciiz "\nHieu: "
	tich_str: .asciiz "\nTich: "
	thuong_str: .asciiz "\nThuong: "
	du_str: .asciiz " du "
.text 
	.globl main
main: 
	#print str1
	li $v0, 4
	la $a0, str1
	syscall
	#read int
	li $v0,5
	syscall
	la $t1, ($v0) #so 1 luu vao t1
	#print str2
	li $v0, 4
	la $a0, str2
	syscall
	#read int 
	li $v0,5
	syscall
	la $t2, ($v0) # luu so 2 vao t2
	
	#print sum
	li $v0, 4
	la $a0, sum_str
	syscall
	add $a0, $t1,$t2
	li $v0, 1
	syscall
	#print hieu
	li $v0, 4
	la $a0, hieu_str
	syscall
	sub $a0, $t1, $t2
	li $v0, 1
	syscall
	#print tich
	li $v0, 4
	la $a0, tich_str
	syscall
	mult $t1,$t2
	mflo $t3
	la $a0, ($t3)
	li $v0, 1
	syscall
	
	#print thuong
	li $v0, 4
	la $a0, thuong_str
	syscall
	div $t1,$t2
	mflo $a0
	li $v0,1
	syscall
	li $v0, 4
	la $a0, du_str
	syscall
	mfhi $a0
	li $v0, 1
	syscall
