#intAdder.asm
	.data
prompt1: .asciiz "Please Enter Number1: "
prompt2: .asciiz "Please Enter Number2: "
message: .asciiz "Total is: "
	.text 
	
	#Print prompt1
main: 	la $a0, prompt1		# load address of prompt1 string to register 4
	li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	syscall			# issue a system call to print prompt1
	
	#read integer
	li $v0, 5		# load immediate 5 (service 5 - read integer) to register 2
	syscall			# issue a system call to read integer
	add $t0, $v0, $zero	# copy integer in register 2 to register 8

	#print prompt2
	la $a0, prompt2		# load address of prompt2 string to register 4
	li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	syscall			# issue a system call to print prompt2
	
	#read integer
	li $v0, 5		# load immediate 5 (service 5 - read integer) to register 2
	syscall			# issue a system call to read integer
	add $t1, $v0, $zero	# copy integer in register 2 to register 9
	
	#add two integers
	add $t2, $t0, $t1	# add two integers and save result to register 10
	
	#Print message
	la $a0, message		# load address of message string to register 4
	li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	syscall			# issue a system call to print message
	
	#print result
	add $a0, $t2 , $zero	# copy integer in register 10 to register 4
	li $v0, 1		# load immediate 1 (service 1 - print integer) to register 2
	syscall			# issue a system call to print integer
	
	#end program
	li $v0, 10		# load immediate 10 (service 10 - terminate program) to register 2
	syscall			# issue a system call to terminate program
	
	
