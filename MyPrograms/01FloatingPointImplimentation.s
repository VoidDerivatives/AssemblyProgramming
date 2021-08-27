.section .rodata
	msg_main_print1:
	.string "Enter the floating number"

	msg_main_print2:
	.string "exponent is : %d\n"

	msg_main_scan1:
	.string "%f"

	msg_main_print3:
	.string "%f\n"

.section .text 
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $564,%esp

	movl $msg_main_print1,(%esp)
	call printf

	#movl $3.4 * 10E17,-540(%ebp)
	leal -540(%ebp),%eax

	movl $msg_main_scan1,(%esp)
	movl %eax,4(%esp)
	call scanf

	movl -540(%ebp),%eax
	movl $msg_main_print3,(%esp)	
	movl %eax,4(%esp)
	call printf	
	
	movl $0,(%esp)
	call exit
	
