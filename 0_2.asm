			.data
wVar 	.word 3

			.text
			.globl main
			.ent main

main:

			li 		$to,	10
			sw 	$t0,	wVar
			
			li	$v0,	10
			syscall
			
			.end main
