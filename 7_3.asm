.data
output: .ascii "Ci sono voluti tot elementi: "
NUM=19
.text
.globl main
.ent main
main:
	addi $sp,$sp,-4
	sw $ra,($sp)
	li $a0,NUM
	jal sequenzaDiCollatz
	move $s0,$v0
	la $a0,output
	li $v0,4
	syscall
	move $a0,$s0
	li $v0,1
	syscall
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
.end main

.globl sequenzaDiCollatz
.ent sequenzaDiCollatz
sequenzaDiCollatz:
	addi $sp,$sp,-4
	sw $ra,($sp)
	add $s0,$0,1
ciclo:
	addi $s0,$s0,1
	jal calcolaSuccessivo
	move $a0,$v0
	bne $v0,1,ciclo
	move $v0,$s0
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
.end sequenzaDiCollatz

.globl calcolaSuccessivo
.ent calcolaSuccessivo
calcolaSuccessivo:
	addi $sp,$sp,-4
	sw $s0,($sp)
	
	and $t0,$a0,1
	bne $t0,$0,dispari
	div $a0,$a0,2
	b stampa
dispari:
	mul $a0,$a0,3
	addi $a0,$a0,1
stampa:
	move $s0,$a0
	li $v0,1
	syscall
	li $a0,'\n'
	li $v0,11
	syscall
	move $v0,$s0
	
	lw $s0, ($sp)
	addi $sp,$sp,4
	jr $ra
.end calcolaSuccessivo