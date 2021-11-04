#Nhap chuoi va tinh length
.data
	message1: .asciiz "Nhap chuoi: "
	message2: .asciiz "Chieu dai cua chuoi tren la: "
	string: .asciiz 
.text
main: 
	#print(message1)
	li $v0,4
	la $a0, message1
	syscall
	#read(string)
	li $v0, 8
	la $a0,string
	li $a1, 50
	syscall 
	li $s1,0
	lb $s2,string+0
	while: beq $s2, 0, exit
		addi $s1, $s1,1
		lb $s2,string($s1)
		j while
	exit:
		#print(message2)
		li $v0,4
		la $a0, message2
		syscall
		#print(numberOfString)
		li $v0,1
		addi $s1, $s1, -1 # Do /n
		la $a0,($s1)
		syscall