.data
n: .word 12
k: .word 2
.text
.globl main
.ent main
main:
	lw $a0,n
	lw	$a1,k
	jal combina
	move $a0,$v0
	li $v0,1
	syscall
	li $v0, 10
	syscall
.end main
combina:
	move $t0, $a0	# n
	move $t1, $a1	# k
	sub $t2,$t0,$t1
	addi $t2,$t2,1	# n-k+1
	li $t3,1				# numeratore
	li $t4,1				# denominatore
ciclo:
	mul $t3,$t3,$t2
	addi $t2,$t2,1
	bgt $t2,$t0,avanti
	b ciclo
avanti:
	mul $t4,$t4,$t1
	addi $t1,$t1,-1
	beq $t1,1,esci
	b avanti
esci:
	div $v0,$t3,$t4
	jr $ra
.end combina