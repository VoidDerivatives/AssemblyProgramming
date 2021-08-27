.section .rodata
	msg_main_print1:
	.string "Enter the two numbers:\t"
	
	msg_main_scan:
	.string "%d%d"
	
	msg_main_print2:
	.string "Multiplication is :\t%d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $8,%esp
	
	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax
	leal -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $12,%esp
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%ecx
	mull %ecx
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $8,%esp

	pushl $0
	call exit

	

	
	
