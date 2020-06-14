.data
R1=3 * 4
C1=5 * 4
C2=6 * 4
Matrice: .word 154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
.ent main
main:
	
	# contatore i
	li $t0,0
loopi:
	beq $t0,R1,finei
	
	# contatore j
	li $t1,0
	# somma
	li $t2,0
	
	loopj:
		beq $t1, C1,finej
		
		mul $t3,$t0,6
		add $t3,$t3,$t1
		lw $t3,Matrice($t3)
		
		add $t2,$t2,$t3
		
		addi $t1,$t1,4
		j loopj
	finej:
	
	mul $t3,$t0,6
	add $t3,$t3,$t1
	sw $t2,Matrice($t3)
	
	addi $t0,$t0,4
	j loopi
finei:

	# contatore i
	li $t0,0
loopi1:
	beq $t0,C2,finei1
	
	# contatore j
	li $t1,0
	# somma
	li $t2,0
	
	loopj1:
		beq $t1, R1,finej1
		
		mul $t3,$t1,6
		add $t3,$t3,$t0
		lw $t3,Matrice($t3)
		
		add $t2,$t2,$t3
		
		addi $t1,$t1,4
		j loopj1
	finej1:
	
	mul $t3,$t1,6
	add $t3,$t3,$t0
	sw $t2,Matrice($t3)
	
	addi $t0,$t0,4
	j loopi1
finei1:

	li $v0, 10
	syscall
.end main