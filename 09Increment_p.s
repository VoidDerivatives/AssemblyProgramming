.section .rodata
	msg_main_print:
	.string "ino1 = %d \nino2 = %d \nians1 = %d\n ians2=%d"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $ebp,%16
	
	movl $10,-4(%ebp)
	movl $20,-8(%ebp)
	
	movl -4(%ebp),%eax
	addl $1,%eax
	movl %eax,-12(%ebp)
	movl %eax,-4(%ebp)

	movl -8(%ebp),%eax
	movl %eax,-16(%ebp)	
	addl $1,%eax
	movl %eax,-8(%ebp)

	movl -16(%ebp),%eax
	movl -12(%ebp),%edx
	movl -8(%ebp),%ebx
	movl -4(%ebp),%ecx
	pushl %eax
	pushl %edx
	pushl %ebx
	pushl %ecx
	pushl $msg_main_print
	call printf
	addl $20,%esp

	pushl $0
	call exit
	
