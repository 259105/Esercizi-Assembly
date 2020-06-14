.data
parola: .ascii "Ci Ao A TutTi "
.text
.globl main
.ent main
main:
	la $s0,parola
ciclo:
	lb $a0,($s0)
	beq $a0,$0,fine
	jal converti
	sb $v0,($s0)
	addi $s0,$s0,1
	b ciclo
fine:
	### addi $t0,$0,'\n'
	### sb $t0,($s0)
	la $a0,parola
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.end main

.globl converti
.ent converti
converti:
	move $v0,$a0
	bgt $a0,'z',salta
	blt $a0,'a',salta
	addi $v0,$v0,-32
salta: 
	jr $ra
.end converti
