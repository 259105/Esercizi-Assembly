.data

NUM_ELEM=20
DIM=4*NUM_ELEM
wVet: .space DIM

.text
.globl main
.ent main
main:
	
	
	
	la $t1,wVet 	#  puntaro al primo elemento
	li $t2,1
	li $t3,1
	
	sw $t2, 0($t1)
	sw $t3, 4($t1)
	addi $t1,$t1,8
	li $t0,2			# contatore elementi
	
loop:
	beq $t0,NUM_ELEM,fine
	add $t4,$t2,$t3
	sw $t4, ($t1)
	move $t2,$t3
	move $t3,$t4
	add $t1,$t1,4
	addi $t0,$t0,1
	j loop


fine:
	
	li $v0, 10
	syscall
.end main