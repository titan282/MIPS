#Nhap 2 so va Tinh tong,tru, nhan, chia duoi dang thu tuc
.data 
	mess1: .asciiz "Nhap so thu nhat: "
	mess2: .asciiz "Nhap so thu hai: "
	messSum: .asciiz "Tong: "
	messSub: .asciiz "\nHieu: "
	messMul: .asciiz "\nTich: "
	messDiv: .asciiz "\nThuong: "
	messRe: .asciiz " du "
.text	
main:
	la $a1,mess1
	jal printStr
	jal readInt
	move $t1, $v0
	
	la $a1,mess2
	jal printStr
	jal readInt
	move $t2, $v0
	
	
	#SUM
	la $a1,messSum
	jal printStr
	jal sum
	#Hieu
	la $a1,messSub
	jal printStr
	jal hieu
	#Tich
	la $a1,messMul
	jal printStr
	jal tich
	#Thuong
	la $a1, messDiv
	jal printStr
	jal thuong
	#exit
	li $v0,10
	syscall
readInt:
	li $v0, 5
	syscall
	jr $ra
printStr:
	li $v0,4
	la $a0, ($a1)
	syscall
	jr $ra
printInt:
	li $v0,1
	la $a0,($a1)
	syscall
	jr $ra
sum: 
	move $a1,$t1
	move $a2, $t2
	add $v0, $a1,$a2
	addi $sp,$sp, -4
	sw $ra, 0($sp)
	move $a1, $v0
	jal printInt
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra
	
hieu:
	move $a1,$t1
	move $a2, $t2
	sub $v0, $a1, $a2
	addi $sp,$sp, -4
	
	sw $ra, 0($sp)
	move $a1, $v0
	jal printInt
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra
tich:
	move $a1,$t1
	move $a2, $t2
	mul $v0, $a1,$a2
	
	addi $sp,$sp, -4
	sw $ra, 0($sp)
	move $a1, $v0
	jal printInt
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra
thuong:
	move $a1,$t1
	move $a2, $t2
	div $a1,$a2
	mflo $v0
	mfhi $v1
	
	addi $sp,$sp, -4
	sw $ra, 0($sp)
	move $a1, $v0
	jal printInt
	la $a1, messRe
	jal printStr
	move $a1, $v1
	jal printInt
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra