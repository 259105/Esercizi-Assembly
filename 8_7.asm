RIGHE = 4
COLONNE = 5
.data
matrice: .byte 0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9, 24, 8, 25, 43, 62
.text
.globl main
.ent main
main:
	addi $sp,$sp,-4
	sw $ra,($sp)
	la $a0, matrice
	li $a1, 14
	li $a2, RIGHE
	li $a3, COLONNE
	jal contaVicini
	move $a0,$v0
	li $v0,1
	syscall
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
.end main
.globl contaVicini
.ent contaVicini
contaVicini:
	li $v0,0
	div $a1,$a3
	mflo $t0 #riga i
	mfhi $t1 #colonna j
	addi $t2,$t0,-1 #riga m
	addi $t3,$t1,-1 #colonna n
	li $t4,0
loop:
	blt $t2,0,salta
	bge $t2,$a2,salta
	li $t5,0
	addi $t3,$t1,-1 # remposto colonna iniziale
	loop1:
		blt $t3,0,salta1
		bge $t3,$a3,salta1
		bne $t3,$t1,continua
		beq $t2,$t0,salta1
		continua:
			move $t6,$t3
			mul $t7,$t2,$a3
			add $t6,$t6,$t7
			add $t7,$t6,$a0
			lbu $t7,($t7)
			add $v0,$v0,$t7
		salta1:
		addi $t3,$t3,1
		addi $t5,$t5,1
		bne $t5,3,loop1
salta:
	addi $t2,$t2,1
	addi $t4,$t4,1
	bne $t4,3,loop
	jr $ra
.end contaVicini