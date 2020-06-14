.data
N=7
.text
.globl main
.ent main
main:
	addi $sp,$sp,-4
	sw $ra, ($sp)
	
	li $t0,4
	li $t1,2
	li $t2,-5
	li $t3,3
	
	li $s0,8
	li $s1,4
	li $s2,27
	li $s3,9
	li $s4,64
	li $s5,16
	
	add $a0,$0,$0
	add $a0,$a0,$t0
	add $a0,$a0,$t1
	add $a0,$a0,$t2
	add $a0,$a0,$t3
	
	mul $t4,$t0,$s0
	add $a1,$0,$0
	add $a1,$a1,$t4
	mul $t4,$t1,$s1
	add $a1,$a1,$t4
	mul $t4,$t2,2
	add $a1,$a1,$t4
	add $a1,$a1,$t3
	
	mul $t4,$t0,$s2
	add $a2,$0,$0
	add $a2,$a2,$t4
	mul $t4,$t1,$s3
	add $a2,$a2,$t4
	mul $t4,$t2,3
	add $a2,$a2,$t4
	add $a2,$a2,$t3
	
	mul $t4,$t0,$s4
	add $a3,$0,$0
	add $a3,$a3,$t4
	mul $t4,$t1,$s5
	add $a3,$a3,$t4
	mul $t4,$t2,4
	add $a3,$a3,$t4
	add $a3,$a3,$t3
	
	addi $sp,$sp,-4
	li $t4,N
	sw $t4,($sp)
	addi $sp,$sp,-16
	sw $t0,($sp)
	sw $t1,4($sp)
	sw $t2,8($sp)
	sw $t3,12($sp)
	jal polinomio
	lw $t3,12($sp)
	lw $t2,8($sp)
	lw $t1,4($sp)
	lw $t0,($sp)
	addi $sp,$sp,16
	addi $sp,$sp,4
	
	move $a0,$v0
	li $v0,1
	syscall
	
	lw $ra,($sp)
	addi $sp,4
	jr $ra
.end main

.globl polinomio
.ent polinomio
polinomio:
	addi $sp,$sp,-24
	sw $s0,($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s3,12($sp)
	sw $s4,16($sp)
	sw $s5,20($sp)
	
	sub $t0,$a1,$a0
	sub $t1,$a2,$a1
	sub $t2,$a3,$a2
	sub $s0,$t1,$t0
	sub $s1,$t2,$t1
	sub $s2,$s1,$s0
	move $v0,$a3

	lw $t4,40($sp)
	addi $t4,$t4,-4
ciclo:
	add $s1,$s1,$s2
	add $t2,$t2,$s1
	add $v0,$v0,$t2
	addi $t4,$t4,-1
	bne $t4,$0,ciclo
	
	lw $s5,20($sp)
	lw $s4,16($sp)
	lw $s3,12($sp)
	lw $s2,8($sp)
	lw $s1,4($sp)
	lw $s0,0($sp)
	addi $sp,$sp,24
	jr $ra
.end polinomio