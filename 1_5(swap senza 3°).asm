.data
message: .asciiz "Inserisci numero: "
.text
.globl main
.ent main
main:
	la $a0, message
	li $v0,4
	syscall
	li $v0,5
	syscall
	add $t1,$0,$v0
	
	la $a0, message
	li $v0,4
	syscall
	li $v0,5
	syscall
	add $t2,$0,$v0
	
	#scambia t1 e t2 senza usarne 3
	add $t1,$t1,$t2
	sub $t2,$t1,$t2
	sub $t1,$t1,$t2
	
	li $v0, 10
	syscall
.end main