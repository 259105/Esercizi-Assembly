.data

DIM = 10
tav: .space DIM*DIM

.text
.globl main
.ent main
main:
	
	# contatore i
	li $t0,1
	#contatore j
	li $t1,1
	# indirizzo matrice
	la $s0,tav
	
loopi:
	beq $t0,11,finei
	
	loopj:
		beq $t1,11,finej
		
		
		mul $t2,$t0,$t1
		
		sb $t2,($s0)
		addi $s0,$s0,1
		
		addi $t1,$t1,1
		j loopj
	finej:
		
		
		li $t1,1
		
		addi $t0,$t0,1
		j loopi
	
finei:
	
	li $v0, 10
	syscall
.end main