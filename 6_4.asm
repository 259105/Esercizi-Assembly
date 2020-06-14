.data
vettore: .word 4, 13, 5, 10, 0
.text
.globl main
.ent main
main:
	la $a0, vettore
	li $a1, 5
	jal massimo
	move $a0,$v0
	li $v0,1
	syscall
	li $v0, 10
	syscall
.end main
massimo:
	move $t0, $a0 #indirizzo del vettore
	move $t1, $a1 #lunghezza del vettore
	li $t2,0 #contatore
	li $v0,0 #massimo
ciclo:
	lw $t3,($t0)
	addi $t0,$t0,4
	addi $t2,$t2,1
	ble $t3,$v0,salta
	move $v0,$t3
	salta:
	beq $t2,$t1,esci
	b ciclo
esci:
	jr $ra
.end massimo