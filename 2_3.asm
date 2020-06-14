.data
va: .word 1
vb: .word 2
vc: .word 3
.text
.globl main
.ent main
main:
	
	lw $t0, va
	lw $t1, vb
	lw $t2, vc
	
	ble $t0,$t1,p1
		#sw $t0, vb
		#sw $t1, va
		#lw $t0, va
		#lw $t1, vb
	move $t3,$t0
	move $t0,$t1
	move $t1,$t3
p1:
	ble $t0,$t2,p2
		#sw $t0, vc
		#sw $t2, va
		#lw $t0, va
		#lw $t2, vc
	move $t3,$t0
	move $t0,$t2
	move $t2,$t0
p2:
	ble $t1,$t2,p3
		#sw $t1, vc
		#sw $t2, vb
		#lw $t1, vb
		#lw $t2, vc
	move $t3,$t1
	move $t1,$t2
	move $t2,$t1
p3:
	sw $t0,a
	sw $t1,b
	sw $t2,c
	
	# Serve per sampare un carettere a riga
	move $a0, $t0,
	li $v0,1
	syscall
	li $a0, '\n'
	li $v0, 11
	syscall
	
	li $v0, 10
	syscall
.end main