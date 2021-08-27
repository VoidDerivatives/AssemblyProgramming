.section .rodata
	msg_main_print1:
	.string "Enter the no1 and no2:\t"
	
	msg_main_scan:
	.string "%d%d"

	msg_main_print2:
	.string "Multiplication is : %d"

.section .rodata
.globl main
.type main,@function
main:
	pushl %ebp
	movl %ebp,%esp
	
	subl $8,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %eax
	pushl %edx
	pushl $msg_main_scan
	call scanf
	addl $8,%esp
	
	

	 
	
	
