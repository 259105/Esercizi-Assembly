.data
var: .word 0x3FFFFFF0
.text
.globl main
.ent main
main:
	lw $t1,var
	sll $t1,$t1,1
	
	add $a0,$t1,$0
	li $v0, 1
	syscall
	
	addiu $a0,$t1,40 #non si rende conto che è un overflow perchè è unsigned
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
.end main