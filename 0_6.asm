.data
DIM=5
Vett: .space DIM*4
StringIn: .asciiz "Inserire numeri\n"
StringOut: .asciiz "Stampa numeri\n"
Separatore: .asciiz "; "
.text
.globl main
.ent main
main:
	#Stampa messaggio inserimento dati
	la $a0, StringIn
	li $v0, 4
	syscall
	#Inizializzazioni variabili
	la $t0, Vett
	li $t1,0 #contatore
ciclo_in:
	beq $t1,DIM,done
	li $v0, 5
	syscall
	sw $v0,($t0)
	add $t0,$t0,4
	add $t1,$t1,1
	j ciclo_in
done:
	#Stampa messaggio stampa dati
	la $a0, StringOut
	li $v0, 4
	syscall
	#Inizializzazioni variabili
	la $t0, Vett
	li $t1,0
ciclo_out:
	beq $t1,DIM,done1
	lw $a0,($t0)
	li $v0, 1
	syscall
	la $a0,Separatore
	li $v0, 4
	syscall
	add $t0,$t0,4
	add $t1,$t1,1
	j ciclo_out
done1:
	#Terminazione
	li $v0, 10
	syscall
.end main
	