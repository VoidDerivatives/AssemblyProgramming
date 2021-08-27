.section .rodata
	msg_main_print:
	.string "Ino1 = %d \nIno2 = %d \niAns1 = %d \niAns2 = %d"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $16,%esp

	movl $10,-4(%ebp)
	movl $20,-8(%ebp)
	
	movl -4(%ebp),%eax
	movl %eax,-12(%ebp)
	subl $1,%eax
	movl %eax,-4(%ebp)

	movl -8(%ebp),%eax
	subl $1,%eax
	movl %eax,-16(%ebp)
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
	
