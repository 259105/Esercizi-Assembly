.data
NUM=3
.text
.globl main
.ent main
main:
	addi $sp,$sp,-4
	sw $ra,($sp)
	li $a0,NUM
	jal calcolaSuccessivo
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
.end main

.globl calcolaSuccessivo
.ent calcolaSuccessivo
calcolaSuccessivo:
	and $t0,$a0,1
	bne $t0,$0,dispari
	div $a0,$a0,2
	b stampa
dispari:
	mul $a0,$a0,3
	addi $a0,$a0,1
stampa:
	li $v0,1
	syscall
	move $a0,$v0
	jr $ra
.end calcolaSuccessivo