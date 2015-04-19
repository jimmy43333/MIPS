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
  addi  $a0,$zero,$s1

  addi	$t0,$zero,1
  beq		$s0, $t0, diamand
  addi	$t0,$zero,2
  beq		$s0, $t0, triangle
  addi	$t0,$zero,3
  beq		$s0, $t0, trapezoid
  li		$v0, 10
  syscall
  
diamond:
  addi  $sp,$sp,-12
  sw  $ra, 0($sp)
  sw  $s0, 4($sp)
  sw  $s1, 8($sp)
  
  
  
  
triangle:
trapezoid:
.data
printout1: .ascliz "Input:\n"

