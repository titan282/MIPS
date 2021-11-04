#Nhap n va tinh tu 1 den n
.data
	message: .asciiz "Nhap n: "
	message2: .asciiz "Tong tu 1 den n la: "
.text
main:
	#print(message)
	li $v0, 4
	la $a0, message
	syscall
	#read(n)
	li $v0,5
	syscall
	
	la $t1,($v0)
	li $s0, 1 # index=1
	li $s1,0 #sum-0
	while: bgt $s0,$t1,exit #i>n thoat while 
		add $s1,$s1,$s0
		addi $s0, $s0, 1
		j while
	exit:
		#print(message2)
		li $v0,4
		la $a0,message2
		syscall
		#print(sum)
		li $v0,1
		la $a0, ($s1)
		syscall
	