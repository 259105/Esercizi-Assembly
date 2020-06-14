.data
DIM = 5
.text
.globl main
.ent main
main:
	
	add $t0,$0,$0 # contatore
	add $t1,$0,$0 # somma
	# messaggio input
	
loop:
	li $v0,5
	syscall
	add $t1,$v0,$t1
	addi $t0,$t0,1
	
	bne $t0,DIM,loop
	
	# messaggio out

	div $t1,$t1,DIM
	
	li $v0, 1
	move $a0,$t1
	syscall
	

	li $v0, 10
	syscall
.end main