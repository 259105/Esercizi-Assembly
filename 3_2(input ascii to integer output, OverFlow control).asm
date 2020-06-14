.data
messageIn: .asciiz "Inserisci un numero: "
messageErr: .asciiz "\nL'input non e' un carattere numerico"
messageOK: .asciiz "L'input inserito è: "
messageEmpty: .asciiz "Non hai inserito nulla"
messageOver: .asciiz "\nL'input è troppo grande"

.text
.globl main
.ent main
main:
	
	la $a0, messageIn
	li $v0,4
	syscall
	move $t0,$0
	move $t1,$0 #accumulatore
	li $t3, 10
	
loop:
	li $v0, 12
	syscall
	beq $v0 ,'\n', exitloop
	blt $v0,'0',notAnumber
	bgt $v0,'9',notAnumber
	addi $t0,$t0,1
	
	
	multu $t1,$t3
	mfhi $t1
	bne $t1, $0, overFlow
	mflo $t1
	sub $t2,$v0, '0'
	add $t2,$t1,$t2
	bltu $t2,$t1,overFlow
	move $t1,$t2
	
	j loop
exitloop:
	beq $t0,0,noInput
	la $a0,messageOK
	li $v0,4
	syscall
	move $a0, $t1
	li $v0,1
	syscall
	j fine
noInput:
	la $a0,messageEmpty
	j printMessage
notAnumber:
	la $a0,messageErr
	j printMessage
overFlow:
	la $a0,messageOver
	j printMessage
printMessage:
	li $v0,4
	syscall
fine:	
	li $v0, 10
	syscall
.end main