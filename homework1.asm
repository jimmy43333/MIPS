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
  add  $a0,$zero,$s1

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
  li  $s0, -1         
  add  $s1,$zero,$a0  #s1是有幾個空白  
  li  $s2, 1          #s2是有幾個星號
  diamondup:  beq $s0,$s1, exitdiamondup
              jal starandspace
              addi  $s1,$s1,-1
              addi  $s2,$s2,2
              j diamondup
  exitdiamondup:  addi  $s1,$s1,2
                  addi  $s2,$s2,-2
  diamonddown:  beq $s0,$s2, exitdiamonddown
                jal starandspace
                addi  $s1,$s1,1
                addi  $s2,$s2,-2
                j diamonddown
  exitdiamonddown:  #把資料還回去
  

  
  
triangle:
trapezoid:
starandspace:
  
.data
printout1: .ascliz "Input:\n"

