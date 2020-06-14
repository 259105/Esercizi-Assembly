.data
start: .asciiz "Inserisci i valori rispettivamente di a, b e c separati da un accapo:\n"
NoReali: .asciiz "NON esistono soluzioni REALI\n"
Reali: .asciiz "Esistono soluzioni REALI\n"
.text
.globl main
.ent main
main:
	la $a0,start
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,5
	syscall
	move $t2,$v0
	
	mul $t3,$t1,$t1  # b^2
	mul $t4,$t2,$t0  # a*c
	sll $t4,$t4,2		# a*c*4
	sub $t3,$t3,$t4	# b^2 - 4*a*c
	slt $t4,$t3,$0
	beq $t4,1,noSol
	la $a0,Reali
	b print
noSol:
	la $a0,NoReali
print:
	li $v0,4
	syscall
	li $v0, 10
	syscall
.end main