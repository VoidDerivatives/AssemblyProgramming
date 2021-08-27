.section .rodata
	msg_main_print1:
	.string "Enter the numenominator:\t"

	msg_main_print2:
	.string "Enter the denominator:\t"

	msg_main_scan:
	.string "%d"
	
	msg_main_print3:
	.string "Queiont is :\t%d\n"
	
	msg_main_print4:
	.string "Remainder is :\t%d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $12,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax
	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $8,%esp

	pushl $msg_main_print2
	call printf
	addl $4,%esp

	leal -8(%ebp),%eax
	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $8,%esp

	xorl %eax,%eax
	xorl %edx,%edx
	xorl %ecx,%ecx
	xorl %ebx,%ebx

	movl -4(%ebp),%eax
	movl -8(%ebp),%ecx
	divl %ecx
	
	movl %edx,-12(%ebp)    #backup remainder	
	
	pushl %eax
	pushl $msg_main_print3
	call printf
	addl $8,%esp

	movl -12(%ebp),%edx
	pushl %edx
	pushl $msg_main_print4
	call printf
	addl $8,%esp

	pushl $0
	call exit
	
		










	




