NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 0
.data
prezzi: .word 39, 1880, 2394, 1000, 1590
scontati: .space DIM
.text
.globl main
.ent main
main:
	addi $sp,$sp,-4
	sw $ra,($sp)
	
	la $a0, prezzi
	la $a1, scontati
	li $a2, NUM
	li $a3, SCONTO
	li $t0, ARROTONDA
	subu $sp, 4
	sw $t0, ($sp)
	jal calcola_sconto
	addi $sp,$sp,4
	move $a0,$v0
	li $v0,1
	syscall
	
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
.end main
.globl calcola_sconto
.ent calcola_sconto
calcola_sconto:
	lw $t3,($sp)
	li $t2,0
	li $v0,0
loop:
	lw $t0,($a0)
	addi $a0,$a0,4
	mul $t0,$t0,$a3
	li $t1,100
	div $t0,$t1
	mfhi $t1
	mflo $t0
	bne $t3,1,noArr
	blt $t1,50,noArr
	addi $t0,$t0,1
noArr:
	sw $t0,($a1)
	addi $a1,$a1,4
	add $v0,$v0,$t0
	addi $t2,$t2,1
	bne $t2,$a2,loop
	jr $ra
.end calcola_sconto