.section .rodata
	msg_main_print1:
	.string "\n\nEnter the string1(Maximum 40 characters):\t"

	msg_main_print2:
	.string "\n\nstring is not found\t"

	msg_main_print3:
	.string "\n\nstring is found at %d Loaction\n"

	msg_main_print4:
	.string "\n\nstring is found In \t%s\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp
	
	subl $96,%esp

	#string 1
	movl $msg_main_print1,(%esp)
	call printf

	leal -40(%ebp),%ebx
	movl %ebx,(%esp)
	call gets
	
	#string 2
	movl $msg_main_print1,(%esp)
	call printf

	leal -80(%ebp),%ebx
	movl %ebx,(%esp)
	call gets

	leal -40(%ebp),%eax
	leal -80(%ebp),%ebx
	movl %eax,(%esp)
	movl %ebx,4(%esp)	
	call MyStrstr

	






	movl $0,(%esp)
	call exit	

.globl MyStrstr
.type MyStrstr,@function
MyStrstr:
	pushl %ebp
	movl %esp,%ebp
	
			






			







	movl %ebp,%esp
	popl %ebp
	ret
