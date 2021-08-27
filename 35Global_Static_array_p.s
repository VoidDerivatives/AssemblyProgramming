.equ MAX,50

.section .data
	.globl arr1
	.type arr1,@object
	.size arr1,12
	.align 4
	arr1:
		.int 10
		.int 20
		.int 30

.section .bss
	.comm arr2,200,4

.section .rodata
	msg_main_print1:
	.string "Enter value of n(<%d):\t"

	msg_main_scan1:
	.string "%d"

	msg_main_print2:
	.string "Enter %d values:\t"

	msg_main_print3:
	.string "arr1 is:\n"

	msg_main_print4:
	.string "arr2 is:\n"

	msg_main_print5:
	.string "%d value is:\t%d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $8,%esp

	pushl $MAX 
	pushl $msg_main_print1
	call printf
	addl $8,%esp

	leal -4(%ebp),%ebx
	pushl %ebx
	pushl $msg_main_scan1
	call scanf
	addl $8,%esp

	#for loop
	movl $0,-8(%ebp)
	
	jmp label_cond_for1
	
label_back_for1:
	
	pushl %edx
	pushl $msg_main_print2
	call printf
	addl $8,%esp

	#code of scanf 
	movl -8(%ebp),%edx
	leal arr2(,%edx,4),%ebx
	pushl %ebx
	pushl $msg_main_scan1
	call scanf 	
	addl $8,%esp	

	#increment
	addl $1,-8(%ebp)

label_cond_for1:
	movl -4(%ebp),%eax   #imax
	movl -8(%ebp),%edx   #icounter
	cmpl %eax,%edx
	jl  label_back_for1
		
	
	pushl $msg_main_print3
	call printf
	addl $4,%esp

	#2nd for loop

	movl $0,-8(%ebp)
	jmp label_main_cond

label_main_for_code:
	
	#printf
	movl arr1(,%edx,4),%ebx
	movl -8(%ebp),%edx	
	pushl %ebx
	pushl %edx
	pushl $msg_main_print5
	call printf
	addl $12,%esp

	#increment
	addl $1,-8(%ebp)

label_main_cond:
	movl $3,%eax
	movl -8(%ebp),%edx
	cmpl %eax,%edx
	jl label_main_for_code   

		
	############
	
	pushl $msg_main_print4
	call printf
	addl $4,%esp
	
	#3rd for loop
	movl $0,-8(%ebp)
	jmp label_main_condition

label_main_code:
	
	#printf
	movl arr2(,%edx,4),%eax
	movl -8(%ebp),%edx
	pushl %eax
	pushl %edx
        pushl $msg_main_print5
	call printf
	addl $12,%esp

	#increment
	addl $1,-8(%ebp)

label_main_condition:
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	cmpl %eax,%edx
	jl  label_main_code	

	pushl $0
	call exit




