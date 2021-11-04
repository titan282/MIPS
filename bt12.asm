#Nhap xuat chuoi duoi dang Function
.data
	message1: .asciiz "Nhap mot chuoi: "
	message2: .asciiz "Chuoi da nhap: "
	buf: .asciiz 
	
.text
main:
	la $a1,message1
	jal print
	jal readBuf
	la $a1,message2
	jal print
	la $a1,buf
	jal print
	
	#exit
	li $v0,10
	syscall
readBuf:
	li $v0, 8
	la $a0, buf
	li $a1, 50
	syscall
	jr $ra
print:
	li $v0,4
	la $a0, ($a1)
	syscall
	jr $ra
