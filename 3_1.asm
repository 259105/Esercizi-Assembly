.data
messageIn: .asciiz "Inserisci un numero: "
messageErr: .asciiz "\nL'input non e' un carattere numerico"
messageOK: .asciiz "L'input e' corretto"
messageEmpty: .asciiz "Non hai inserito nulla"
.text
.globl main
.ent main
main:
	
	la $a0, messageIn
	li $v0,4
	syscall
	move $t0,$0
	
loop:
	li $v0, 12
	syscall
	beq $v0 ,'\n', exitloop
	blt $v0,'0',notAnumber
	bgt $v0,'9',notAnumber
	addi $t0,$t0,1
	j loop
exitloop:
	beq $t0,0,noInput
	la $a0,messageOK
	j printMessage
noInput:
	la $a0,messageEmpty
	j printMessage
notAnumber:
	la $a0,messageErr
	j printMessage
printMessage:
	li $v0,4
	syscall
	
	li $v0, 10
	syscall
.end main