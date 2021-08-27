.section .rodata
	msg_main_print1:
	.string "Enter the two numbers"

	msg_main_scan:
	.string "%d%d"

	msg_main_print2:
	.string "\nSum is :\t%d\n"

	msg_main_print3:
	.string "\nDiff is :\t%d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $16,%esp

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

	leal -16(%ebp),%eax
	leal -12(%ebp),%edx
	movl -8(%ebp),%ecx
	movl -4(%ebp),%ebx
	pushl %eax
	pushl %edx
	pushl %ecx
	pushl %ebx
	call SumDiff
	addl $16,%esp

	movl -12(%ebp),%eax
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $8,%esp

	movl -16(%ebp),%eax
	pushl %eax
	pushl $msg_main_print3
	call printf
	addl $8,%esp

	pushl $0
	call exit

.globl SumDiff
.type SumDiff,@function
SumDiff:
	pushl %ebp
	movl %esp,%ebp 

	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	addl %edx,%eax
	movl 16(%ebp),%ebx
	movl %eax,(%ebx)

	movl 8(%ebp),%eax
	subl %edx,%eax
	movl 20(%ebp),%ebx
	movl %eax,(%ebx)

	movl %ebp,%esp
	popl %ebp
		
	ret
