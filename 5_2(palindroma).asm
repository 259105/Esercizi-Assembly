.data
start: .asciiz "Inserire la parola terminata da un a capo\n"
outputWrong: .asciiz "La parola inserita NON è Palindroma\n"
outputOK: .asciiz "La parola inserita è palindroma\n"
Errore: .asciiz "Non hai inserito nessuna parola\n"
.text
.globl main
.ent main
main:
	add $t0,$sp,$0  # salvo il puntatore all'inizo dello stack
	add $s0,$sp,$0 # salvo il puntatore all'inizo dello stack
 	la $a0,start
	li $v0,4
	syscall
ciclo1:
	li $v0, 12
	syscall
	beq $v0,'\n',checkEmpty
	addi $sp,$sp,-4
	sw $v0,($sp)
	b ciclo1
checkEmpty:
	beq $t0,$sp,err
ciclo2:
	addi $t0,$t0,-4
	lw $t2,($t0)
	lw $t3,($sp)
	addi $sp,$sp,4
	bne $t2,$t3,nopal
	ble $t0,$sp,pal
	b ciclo2
nopal:
	la $a0,outputWrong
	b print
pal:
	la $a0,outputOK
	b print
err:
	la $a0,Errore
print:
	li $v0,4
	syscall
	
	li $v0, 10
	syscall
.end main