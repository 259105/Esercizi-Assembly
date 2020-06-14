.data
str_orig: .asciiz "% nella citta' dolente, % nell'eterno dolore, % tra la perduta gente %"
str_sost: .asciiz "per me si va"
str_new: .space 200
.text
.globl main
.ent main
main:
	addi  $sp,$sp,-4
	sw $ra,($sp)
	la $a0, str_orig
	la $a1, str_sost
	la $a2, str_new
	jal sostituisci
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
.end main
.globl sostituisci
.ent sostituisci
sostituisci:
loop:
	lb $t0,($a0)
	addi $a0,$a0,1
	beq $t0,$0,fine
	bne $t0,'%',salta
	move $t1,$a1
	loop1:
		lb $t2,($a1)
		addi $a1,$a1,1
		beq $t2,$0,finesalto
		sb $t2,($a2)
		addi $a2,$a2,1
		b loop1
salta:
	sb $t0,($a2)
	addi $a2,$a2,1
finesalto:
	move $a1,$t1
	b loop
fine:
	jr $ra
.end sostituisci