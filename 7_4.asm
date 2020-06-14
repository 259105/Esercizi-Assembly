.data
M: 	.word 1, 2
		.word 3, 4
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
	jal determinante2x2
	move $a0,$v0
	li $v0,1
	syscall
	
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
.ent main

.globl determinante2x2
.ent determinante2x2
determinante2x2:
	mul $a0,$a0,$a3
	mul $a2,$a2,$a1
	sub $v0,$a0,$a2
	jr $ra
.end determinante2x2