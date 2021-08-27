.section .rodata
	msg_main_print:
	.string "Enter the numbers :\t"
	
	msg_main_scan:
	.string "%d"

	msg_main_print1:
	.string "%d\n"	
	
.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $8,%esp

	pushl $msg_main_print
	call printf
	addl $4,%esp

	leal -4(%ebp),%ebx
	pushl %ebx
	pushl $msg_main_scan
	call scanf
	addl $8,%esp

	movl $1,-8(%ebp)

	jmp main_cond
	
main_for:

	xorl %ecx,%ecx
	xorl %edx,%edx
	
	movl $2,%ecx
	divl %ecx
		
	cmpl $0,%edx
	
	jne main_not_equal 	
	addl $1,-8(%ebp)
	jmp main_cond

main_not_equal:
	movl -8(%ebp),%eax        #qotionent gela ahee 
	pushl %eax
	pushl $msg_main_print1
	call printf
	addl $8,%esp

	addl $1,-8(%ebp)
main_cond:

 	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
	cmpl %edx,%eax
	jl main_for	
	
main_break:
	
	pushl $0
	call exit

