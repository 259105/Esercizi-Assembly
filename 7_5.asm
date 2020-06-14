.data
M: 	.word 1, 2, 3
		.word 4, 10, 6
		.word 7, 8, 9
.text
.globl main
.ent main
main:
	addi $sp,$sp,-4
	sw $ra,($sp)
	
	la $s0, M
	lw $a0,($s0)
	lw $a1,4($s0)
	lw $a2,8($s0)
	lw $a3,12($s0)
	addi $sp,$sp,-20
	lw $t0,16($s0)	#1
	sw $t0,($sp)
	lw $t0, 20($s0)	#2
	sw $t0,4($sp)
	lw $t0,24($s0)	#3
	sw $t0,8($sp)
	lw $t0,28($s0)	#4
	sw $t0,12($sp)
	lw $t0,32($s0)	#5
	sw $t0,16($sp)
	
	jal determinante3x3
	addi $sp,$sp,20
	move $a0,$v0
	li $v0,1
	syscall
	
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
.ent main

.globl determinante3x3
.ent determinante3x3
determinante3x3:
	addi $sp,$sp,-4
	sw $ra,($sp)
	
	move $t0,$a0
	move $t1,$a1
	move $t2,$a2
	move $t3,$a3
	lw $t4,4($sp)
	lw $t5,8($sp)
	lw $t6,12($sp)
	lw $t7,16($sp)
	lw $t8,20($sp)
	
	move $a0,$t4
	move $a1,$t5
	move $a2,$t7
	move $a3,$t8
	jal determinante2x2
	mul $s0,$t0,$v0
	
	move $a0,$t3
	move $a1,$t5
	move $a2,$t6
	move $a3,$t8
	jal determinante2x2
	mul $s1,$t1,$v0
	
	move $a0,$t3
	move $a1,$t4
	move $a2,$t6
	move $a3,$t7
	jal determinante2x2
	mul $s2,$t2,$v0
	
	sub $v0,$s0,$s1
	add $v0,$v0,$s2
	
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
.end determinante3x3

.globl determinante2x2
.ent determinante2x2
determinante2x2:
	mul $a0,$a0,$a3
	mul $a2,$a2,$a1
	sub $v0,$a0,$a2
	jr $ra
.end determinante2x2