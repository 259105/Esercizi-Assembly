.data
message:  .asciiz "Inserisci un numero"
messagep: .asciiz "Il numero è pari"
messaged: .asciiz "Il numero è dispari"
.text
.globl main
.ent main
main:
	#stampa messaggio
	la $a0,message
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	add $t0,$v0,$0
	
	andi $t0,$t0,1
	la $a0,messagep
	beq $t0,$0,fine
	la $a0,messaged
fine:	
	li $v0, 4
	syscall 

	li $v0, 10
	syscall
	
.end main