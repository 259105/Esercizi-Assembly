.data
errormessage: .asciiz "Numero inserito non rappresentabile in byte\n"
err_mess: .asciiz "Introdurre valori compresi tra -127 e 128"
.text
.globl main
.ent main
main:
	#t0 :=a
	li $v0, 5
	syscall
	add $t0,$v0,$0
	#t1 :=b
	li $v0, 5
	syscall
	add $t1,$v0,$0
	
	#scifto a destra di 8 e deve essere 0
	srl $t2,$t0,8
	bne $t2,$0,fine
	srl $t2,$t1,8
	bne $t2,$0,fine
	
	#con l'and
	li $v0,5
	syscall
	li $t2 0xFFFFFF00  # Significa che ci sono dei byte se non è uguale a zero
	and $t0,v0,t1 			# A in $t0 
	bne $t0, $0, errore
	
	li $v0,5
	syscall
	li $t2, 0xFFFFFF00
	and $t1,v0,t1 			# B in $t0 
	bne $t1, $0, errore
	
	not $t3, $t1		# not B
	and $t3,$t0,$t3	# A and (not B)
	not $t3,$t3		#not(A and (not B))
	xor $t0,$t0,$t1	
	or	 $t0,$t3,$t0
	
	li $t1,0x000000FF # Faccio una maschera perche voglio solo un byte
	and $t0,$t0,$t1
	move $a0,$t0
	li $v0,1
	syscall
	
	j fine
	
errore:
	la, $a0,err_mess
	li $v0,4
	syscall
	
fine:
	li $v0, 10
	syscall
.end main