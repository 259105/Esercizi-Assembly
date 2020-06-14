.data

NUM_ELEM =4
DIM = 4 * NUM_ELEM

vX: .word 1, 2, 3, 4
vY: .word 1, 2, 3, 4
M: .space DIM * NUM_ELEM
.text
.globl main
.ent main
main:
	
	# contatore i
	li $t0,0
	#contatore j
	li $t1,0
	# indirizzo matrice
	la $s0,M
	# indirizzo vX
	la $s1,vX
	#indirizzo vY
	la $s2, vY
	
loopi:
	beq $t0,NUM_ELEM,finei
	
	lw $t2, ($s1)
	addi $s1,$s1,4
	
	loopj:
		beq $t1,NUM_ELEM,finej
		
		lw $t3,($s2)
		addi $s2,$s2,4
		
		mul $t3,$t2,$t3
		
		sw $t3,($s0)
		addi $s0,$s0,4
		
		addi $t1,$t1,1
		j loopj
	finej:
		
		# reset
		la $s2, vY
		li $t1,0
		
		addi $t0,$t0,1
		j loopi
	
finei:
	li $v0, 10
	syscall
.end main