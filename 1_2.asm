.data
var1: .byte 'm'
var2: .byte 'i'
var3: .byte 'p'
var4: .byte 's'
var5: .byte 0 # serve alla funzione di stampa per indicare la terminazione della stringa 
					# equivale ad un \0
.text
.globl main
.ent main
main:
	#Converto in Maiuscolo
	# il -32 si poteva ricavare anche facendo la sotrazione dtra A-a e poi correttamente sommarlo
	# agli altri caratteri
	lb $t0,var1
	addi $t0,-32
	sb $t0,var1
	lb $t0,var2
	addi $t0,-32
	sb $t0,var2
	lb $t0,var3
	addi $t0,-32
	sb $t0,var3
	lb $t0,var4
	addi $t0,-32
	sb $t0,var4
	#Stampa caratteri
	li $v0,4
	la $a0,var1
	syscall # stampa i caratteri dal primo fino allo 0
	
	li $v0,10
	syscall
.end main