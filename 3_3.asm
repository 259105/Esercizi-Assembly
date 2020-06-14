.data
giorno: .byte 231
ora: .byte 16
minuti: .byte 47
risultato: .space 4
messageOverFlow: .asciiz "L'input è troppo grande"
.text
.globl main
.ent main
main:
	
	lbu $t0,giorno
	lbu $t1,ora
	lbu $t2,minuti
	# non puù avere in principio un overFlow
	
	mul $t0,$t0,24
	addu $t1,$t0,$t1
	mul $t1,$t1,60
	addu $t2,$t1,$t2
	sw $t2, risultato

	move $a0,$t2
	li $v0,1
	syscall
	
	li $v0, 10
	syscall
.end main