.section .rodata
	msg_main_print1:
	.string "Enter two numbers:"

	msg_main_scan:
	.string "%d%d"

	msg_main_print2:
	.string "Addition is: %d"


.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $32,%esp  #24

	movl $msg_main_print1,(%esp)
	call printf

	leal -4(%ebp),%eax
	leal -8(%ebp),%ebx
	
	movl $msg_main_scan,(%esp)
	movl %eax,4(%esp)
	movl %ebx,8(%esp)
	call scanf
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx

	movl %eax,(%esp)
	movl %edx,4(%esp)
	call addition
	movl %eax,-12(%ebp)

	movl $msg_main_print2,(%esp)
	movl %eax,4(%esp)
	call printf

	movl $0,(%esp)
	call exit
	

.globl addition
.type addition,@function
addition:
	pushl %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	addl %edx,%eax
	
	movl %ebp,%esp
	popl %ebp	

	ret	

