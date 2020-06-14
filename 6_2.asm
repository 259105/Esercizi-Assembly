.data
.text
.globl main
.ent main
main:
	li $v0,5
	syscall
	move $s0,$v0
	move $a0,$s0
	jal stampaTriangolo
	move $a0,$s0
	jal stampaQuadrato
	li $v0, 10
	syscall
.end main
stampaTriangolo:
	addi $t2,$a0,1
	li $t0,1		# contatore a 1
	li $v0,11	# per non scriverlo sempre prima della syscall
cicloRigheTriangolo:
	li $a0,'*'
	li $t1,0
cicloColonneTriangolo:
	syscall
	addi $t1,$t1,1
	bne $t1,$t0,cicloColonneTriangolo
	li $a0, '\n'
	syscall
	addi $t0,$t0,1
	bne $t0,$t2,cicloRigheTriangolo
	jr $ra
.end stampaTriangolo
stampaQuadrato:
	addi $t2,$a0,1
	addi $t3,$a0,0
	li $t0,1		# contatore a 1
	li $v0,11	# per non scriverlo sempre prima della syscall
cicloRigheQuadrato:
	li $a0,'*'
	li $t1,0
cicloColonneQuadrato:
	syscall
	addi $t1,$t1,1
	bne $t1,$t3,cicloColonneQuadrato
	li $a0, '\n'
	syscall
	addi $t0,$t0,1
	bne $t0,$t2,cicloRigheQuadrato
	jr $ra
	jr $ra
.end stampaQuadrato