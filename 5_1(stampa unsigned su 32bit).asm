.data
numero: .word 3141592653
.text
.globl main
.ent main
main:
	
	lw $a0,numero
	li $v0,1
	syscall
	
	li $a0, '\n'
	li $v0,11
	syscall
	
	li $t0,10  # costante
	lw $t1, numero
	li $s0,0  # n cifre
ciclo1:
	divu $t1,$t0
	mfhi $t2
	addi $sp,$sp,-4
	sw $t2,($sp)
	addi $s0,$s0,1
	mflo $t1
	beq $t1,$0,ciclo2
	b ciclo1
ciclo2:
	lw $t2,($sp)
	addi $sp,$sp,4
	addi $s0,$s0,-1
	addi $t2,$t2,'0'
	move $a0,$t2
	li $v0, 11
	syscall
	beq $s0,$0,fine
	b ciclo2
fine:
	li $v0, 10
	syscall
.end main