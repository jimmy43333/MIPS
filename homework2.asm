  .text
  .globl	main

main:
  	li		$v0, 4
	la		$a0, printout1
	syscall
	
	li $v0, 5
	syscall
	move $s6, $v0   #s6 is A
	
	li $v0, 5
	syscall
	move $s0, $v0   #s0 is B
	
	li $v0, 5
	syscall
	move $s7, $v0   #s7 is M
	
	li		$v0, 4
	la		$a0, printout2
	syscall

	beq		$s0, $zero, true
	add		$a0, $zero, $s0
	jal		function
	add 		$s2, $zero, $v0
	div		$s2, $s7
	mfhi		$a0
	j		false

true:	li		$a0, 1
false:	li		$v0, 1
	syscall
	#srl		$s1, $s0, 1
	#sll		$s1, $s1, 1
	#li		$v0, 1
	#add		$a0, $zero, $s1
	#syscall
	li		$v0, 10
	syscall
	  
function:     # a0 is B
    addi	$sp, $sp, -20
	  sw		$ra, 16($sp)
	  sw		$s0, 0($sp)
	  sw		$s1, 4($sp)
	  sw		$s2, 8($sp)
	  sw		$s3, 12($sp)
		
	add		$s0, $zero, $a0
	li		$s2, 1
	li		$s1, 2
	div		$s0, $s1
	mflo	$s0
	mfhi	$s1
	beq		$s1, $zero, divisible
	div		$s6, $s7
	mfhi	$s3
	mult	$s2, $s3
	mflo	$s2	
  divisible:
    li		$t0, 1
		beq		$s0, $t0, ffun
		add		$a0, $zero, $s0
		jal		function
		add		$s3, $zero, $v0
		mult	$s2, $s3
		mflo	$s2
		div		$s2, $s7
		mfhi	$s2
		mult	$s2, $s3
		mflo	$s2
		j		efun
	ffun:	    #do some s0(B) is 1
		div		$s6, $s7
		mfhi	$s3
		mult	$s2, $s3
		mflo	$s2
		div		$s2, $s7
		mfhi	$s2
		mult	$s2, $s3
		mflo	$s2
	efun:	    #end judge that recursive or 1, $s2 is the answer
		div		$s2, $s7
		mfhi	$v0
		#add		$v0, $zero, $s2

		lw		$s0, 0($sp)
		lw		$s1, 4($sp)
		lw		$s2, 8($sp)
		lw		$s3, 12($sp)
		lw		$ra, 16($sp)
		addi	$sp, $sp, 20
		jr		$ra
		
		.data
printout1:  .asciiz "Input:\n"
printout2:  .asciiz "Output:\n"
	
