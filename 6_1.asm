.data
.text
.globl main
.ent main
main:
	jal stampaTriangolo
	jal stampaQuadrato
	li $v0, 10
	syscall
.end main
stampaTriangolo:
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
	bne $t0,9,cicloRigheTriangolo
	jr $ra
.end stampaTriangolo
stampaQuadrato:
	li $t0,1		# contatore a 1
	li $v0,11	# per non scriverlo sempre prima della syscall
cicloRigheQuadrato:
	li $a0,'*'
	li $t1,0
cicloColonneQuadrato:
	syscall
	addi $t1,$t1,1
	bne $t1,8,cicloColonneQuadrato
	li $a0, '\n'
	syscall
	addi $t0,$t0,1
	bne $t0,9,cicloRigheQuadrato
	jr $ra
	jr $ra
.end stampaQuadrato