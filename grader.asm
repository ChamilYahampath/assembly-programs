#grader.asm
	.data
prompt:	.asciiz "Enter your marks: "
message: .asciiz "\nyour grade is "
marks:  .word 0
grade:	.byte 'D'
	.text
	
main:	#print prompt
	la $a0, prompt			# load address of prompt string to register 4
	li $v0, 4			# load immediate 4 (service 4 - print string) to register 2
	syscall				# issue a system call to print prompt
	
	#read integer
	li $v0, 5			# load immediate 5 (service 5 - read integer) to register 2
	syscall				# issue a system call to read integer
	add $t0, $v0, $zero		# copy integer in register 2 to register 8
	
	li $t1, 70			# load immediate 70 to register 9
	#condition if (marks >= 70)
	blt $t0, $t1, endIf1		# if value of register 8 is less than that of register 9, branch to label endIf1
	#then block grade = 'A';
	li $t2, 'A'			# load immediate 'A' to register 10
	sw $t2, grade			# store word in register 10 at memory address in grade
	j endIf				# jump (unconditional branch) to label endIf
	
endIf1:	li $t3, 60			# load immediate 60 to register 11
	#endIf1 (marks >= 60)
	blt $t0, $t3, endIf2		# if value of register 8 is less than that of register 11, branch to label endIf1
	#then block grade = 'B';	
	li $t4, 'B'			# load immediate 'B' to register 12
	sw $t4, grade			# store word in register 12 at memory address in grade
	j endIf				# jump (unconditional branch) to label endIf
	
endIf2:	li $t5, 50			# load immediate 50 to register 13
	#endIf2 (marks >= 50)		
	blt $t0, $t5, endIf		# if value of register 8 is less than that of register 13, branch to label endIf1
	#then block grade = 'C';
	li $t6, 'C'			# load immediate 'C' to register 14
	sw $t6, grade			# store word in register 14 at memory address in grade
	j endIf				# jump (unconditional branch) to label endIf
	
endIf: 	#Print message
	la $a0, message			# load address of message string to register 4
	li $v0, 4			# load immediate 4 (service 4 - print string) to register 2
	syscall				# issue a system call to print message
	
	#print result
	la $a0, grade			# load address of grade to register 4
	syscall				# issue a system call to print result
	
	# end program
	li $v0, 10			# load immediate 10 (service 10: terminate program) to register 2
	syscall				# issue a system call to terminate program
	
	