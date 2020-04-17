.data
DIM=5
StringIn: .asciiz "Inserisci numeri:\n"
StringOut: .asciiz "Stampo numero minimo:\n"
.text
.globl main
.ent main
main:
	la $a0,StringIn
	li $v0, 4
	syscall
	li $v0,5
	syscall
	add $t1,$0,$v0
	li $t2,1
ciclo_input:
	beq $t2,DIM,done
	li $v0,5
	syscall
	ble $t1,$v0,continue
	add $t1,$0,$v0
continue:
	add $t2,$t2,1
	j ciclo_input
done:
	la $a0,StringOut
	li $v0,4
	syscall
	add $a0,$0,$t1
	li $v0,1
	syscall
	li $v0,10
	syscall
.end main	