#evenSum.asm
	.data
prompt: .asciiz "Please Enter Number: " 
message: .asciiz "The sum of all even numbers from 0 to your number is: "
	.text 
	
main:	#Print prompt
	la $a0, prompt 		# load address of prompt string to register 4
	li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	syscall			# issue a system call to print prompt
	
	#read integer
	li $v0, 5		# load immediate 5 (service 5 - read integer) to register 2
	syscall			# issue a system call to read integer
	add $t0, $v0, $zero	# copy integer in register 2 to register 8
	
	li $t1, 0  		# initialize register 9 to 0 (counter)
	li $t2, 0  		# initialize register 10 to 0 (total)
	
	#loop condition
loop:	bgt $t1, $t0 endloop	# if value of register 9 is greater than that of register 8, branch to label endLoop
	# loop body total = total + counter;
	add $t2, $t2, $t1	# add values of register 10 and register 9 and assign result to register 10
	# loop body counter = counter + 2;	
	addi $t1, $t1, 2	# increment value of register 9 by 2
	# jump to loop condtion
	j loop			# jump (unconditional branch) to label loop
	
	# end loop
endloop: #Print message
	 la $a0, message	# load address of message string to register 4
	 li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	 syscall		# issue a system call to print message
	 
	 #print result
	 add $a0,$t2, $zero	# copy integer in register 10 to register 4
	 li $v0, 1		# load immediate 1 (service 1 - print integer) to register 2
	 syscall		# issue a system call to print integer
	 
	 #end program
	 li $v0, 10		# load immediate 10 (service 10 - terminate program) to register 2
	 syscall		# issue a system call to terminate program
	