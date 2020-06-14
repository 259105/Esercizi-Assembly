.data

tab: .word somma,sottrazione,moltiplic,divisione

opa: .word 2043
opb: .word 5
res: .space 4

.text
.globl main
.ent main
main:
	
	lw $t0,opa
	lw $t1,opb
	
	li $v0, 5
	syscall
	
	blt $v0,0,err
	bgt $v0,3,err
	
	# funzionamento switch
	sll $t2,$v0,2
	lw $t2,tab($t2)
	jr $t2
	
somma:
	add $t0,$t0,$t1
	b fine
sottrazione:
	sub $t0,$t0,$t1
	b fine
moltiplic:
	mul $t0, $t0,$t1
	b fine
divisione:
	div $t0,$t0,$t1
	b fine

fine: 
	sw $t0, res
err:
	li $v0, 10
	syscall
.end main