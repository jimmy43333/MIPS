.text
.globl 	main

main:
  li		$v0, 4
  la		$a0, printout1
  syscall

  li		$v0, 5
  syscall
  move	$s0, $v0

  li		$v0, 5
  syscall
  move	$s1, $v0
  add  $a0,$zero,$s1    #s1 is space number
  
  addi	$t0,$zero,1
  beq	$s0, $t0, diamand
  addi	$t0,$zero,2
  beq	$s0, $t0, triangle
  addi	$t0,$zero,3
  beq	$s0, $t0, trapezoid
  li	$v0, 10
  syscall
  
diamond:
 	addi  $sp,$sp,-16
 	sw  $ra, 0($sp)
 	sw  $s0, 4($sp)
 	sw  $s1, 8($sp)
 	sw  $s2, 12($sp)
 	
 	li  $s0, -1         
 	add $s1,$zero,$a0      #s1 is space number  
 	li $s2, 1              #s2 is star number
 	add $a1,$zero,$s2
 	
 	diamondup:	beq $s0,$s1, exitdiamondup
 			add $a1, $zero, $s1
 			add $a2, $zero, $s2
              		jal starandspace
              		addi  $s1,$s1,-1
              		addi  $s2,$s2,2
              		j diamondup
        exitdiamondup:  addi  $s1,$s1,2
        		addi  $s2,$s2,-2
        diamonddown:	beq $s0,$s2, exitdiamonddown
        		add $a1, $zero, $s1
        		add $a2, $zero, $s2
        		jal starandspace
        		addi  $s1,$s1,1
        		addi  $s2,$s2,-2
        		j diamonddown
        exitdiamonddown:  #把資料還回去
			lw	$s0, 0($sp)
			lw	$s1, 4($sp)
			lw	$s2, 8($sp)
			lw	$ra, 12($sp)
			addi	$sp, $sp, 16
			jr	$ra

triangle:
	addi	$sp, $sp, -16		# $a0 is input n
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	
	li	$s0, -1         
 	add	$s1,$zero,$a0      # s1 is space number  
 	li	$s2, 1             # s2 is star number
 	add	$a2,$zero,$s2
 	
 	tri:	beq $s0,$s1, exittri
 		add $a1, $zero, $s1
 		add $a2, $zero, $s2
        	jal starandspace
        	addi  $s1,$s1,-1
        	addi  $s2,$s2,2
        	j tri
        exittri:  #把資料還回去
        	lw	$s0, 0($sp)
		lw	$s1, 4($sp)
		lw	$s2, 8($sp)
		lw	$ra, 12($sp)
		addi	$sp, $sp, 16
		jr	$ra

trapezoid:
	addi	$sp, $sp, -16	 # a0 is input
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	
	li $s0, -1
	add $s1, $zero, $a0
	addi $s1, $s1, -1	# s1 is space number
	add $s2, $zero, $a0	# s2 is star number
	trape:	beq $s0, $s1, exittrape
		add $a1, $zero, $s1
 		add $a2, $zero, $s2
 		jal starandspace
 		addi $s1, $s1, -1 
 		addi $s2, $s2, 2
 		j trape
 	exittrape:	#把資料還回去
 		lw	$s0, 0($sp)
		lw	$s1, 4($sp)
		lw	$s2, 8($sp)
		lw	$ra, 12($sp)
		addi	$sp, $sp, 16
		jr	$ra
	
	
starandspace:
	addi	$sp, $sp, -16     #space number is $a1, star number is $a2
	sw	$ra, 12($sp)
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	
  	move	$s1, $a1
	move	$s2, $a2
  printspace:   beq	$s1, $zero, exit1
		li	$v0, 4
	        la	$a0, space
		syscall
		addi	$s1,$s1,-1
		j	printspace
  exit1:	li	$s2, 0
  printstar:	beq	$s2, $zero, exit2
		li	$v0, 4
		la	$a0, star
		syscall
		addi	$s1, $s1, -1
		j	printstar
  exit2:	li	$v0, 4
		la	$a0, lf
		syscall
		lw	$s0, 0($sp)
		lw	$s1, 4($sp)
		lw	$s2, 8($sp)
		lw	$ra, 12($sp)
		addi	$sp, $sp, 16
		jr	$ra
  
.data
printout1: .ascliz "Input:\n"
space:	.ascliz "_"
star:	.ascliz "*"
lf:	.ascliz "\n"
