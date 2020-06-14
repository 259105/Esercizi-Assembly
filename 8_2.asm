DIM=6
.data
anni: .word 1945, 2008, 1800, 2006, 1748, 1600
risultato: .space DIM
.text
.globl main
.ent main
main:
	add $sp,$sp,-4
	sw $ra,($sp)
	
	la $a0,anni
	la $a1,risultato
	li $a2,DIM
	jal bisestile
	
	lw $ra,($sp)
	add $sp,$sp,4
	jr $ra
.end main
.globl bisestile
.ent bisestile
bisestile:
	li $t2,0
loop:
	lw $t0,($a0)
	addi $a0,$a0,4
	li $t1,100
	div $t0,$t1
	mfhi $t1
	bne $t1,$0,else1
	li $t1,400
	div $t0,$t1
	mfhi $t1
	bne $t1,$0,else2
	li $t1,1
	sb $t1,($a1)
	addi $a1,$a1,1
	b fine
else2:
	sb $0,($a1)
	addi $a1,$a1,1
	b fine
else1:
	li $t1,4
	div $t0,$t1
	mfhi $t1
	bne $t1,$0,else3
	li $t1,1
	sb $t1,($a1)
	addi $a1,$a1,1
	b fine
else3:
	sb $0,($a1)
	addi $a1,$a1,1
	b fine
fine:
	addi $t2,$t2,1
	bne $t2,$a2,loop
	jr $ra
.end bisestile