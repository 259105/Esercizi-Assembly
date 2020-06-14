DIM = 5
nextCol = 4
nextRow = 4*DIM
nextDiag = 4*(DIM +1)
cellaFine= nextDiag*DIM
.data
Matrice:	.word 1, 0, 0, 0, 0
				.word 0, 1, 0, 2, 0
				.word 0, 0, 1, 0, 0
				.word 0, 1, 0, 1, 0
				.word 0, 0, 0, 0, 1
.text
.globl main
.ent main
main:
	li $t0,2
	la $s0,Matrice
	li $s3,0
	li $s4,0
mainciclo:
	move $t1,$s0
	move $t2,$s0
ciclo1:	
	addi $t1,$t1,nextCol
	addi $t2,$t2,nextRow
	addi $s3,$s3,1
	lw $s1,($t1)
	lw $s2,($t2)
	bne $s1,$s2,NoSimm
	bne $t0,2,next
	beq $s1,$0,next
	addi $t0,$t0,-1
next:	
	blt $s3,4,ciclo1
	addi $s0,$s0,nextDiag
	addi $s4,$s4,1
	move $s3,$s4
	bne $s4,4,mainciclo
	b fine
NoSimm:
	li $t0,0
fine:
	move $a0,$t0
	li $v0,1
	syscall
	li $v0, 10
	syscall
.end main