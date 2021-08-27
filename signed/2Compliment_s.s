.section .rodata
	msg_main_print1:
	.string "Enter number:\t"

	msg_main_scan:
	.string "%d"

	msg_main_print2:
	.string "2's compliment is : %d"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp
	
	subl $16,%esp

	movl $msg_main_print1,(%esp)
	call printf

	leal -4(%ebp),%ebx
	movl $msg_main_scan,(%esp)
	movl %ebx,4(%esp)
	call scanf

	movl -4(%ebp),%eax
	#notl %eax   #version1
	#addl $1,%eax	
	
	movl $0,%ebx  #version2
	subl %eax,%ebx

	movl $msg_main_print2,(%esp)
	movl %eax,4(%esp)
	call printf

	movl $0,(%esp)
	call exit


