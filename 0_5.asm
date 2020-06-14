				.data
				DIM 4
S1: 			.asciiz "Inserire numeri\n"
S2:			.asciiz "Numeri inseriti\n"
space :		.ascii " ; "
Vett:			.space 20
				.text
				.globl main
				.ent main
main:
				la  $a0, S1
				li $v0,	4
				syscall
				
				la $t0, Vett
				li $t1, 0
				
	uno:
				li $v0, 5
				syscall
				sw $v0,($t0)
				beq $t1,DIM, print_num
				add $t1,$t1,1
				add $t0,$t0,4
				j uno
				
	print_num:
				la $a0, S2
				li $v0, 4 
				syscall
				la $t0,Vett
				
				
				li	$v0,	10
				syscall
			
				.end main