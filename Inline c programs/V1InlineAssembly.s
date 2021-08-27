.section .text
.globl addition
.type addition,@function
addition:
	pushl %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	
	addl %ecx,%eax

	movl %ebp,%esp
	popl %ebp
	ret
