.section .rodata
	msg_main_print:
	.string "Enter the three numbers \t:"
	
	msg_main_scan:
	.string "%d%d%d"

	msg_main_print1:
	.string "no1 :%d\n no2:%d\n no3:%d\n ans:%d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $16,%esp
	
	pushl $msg_main_print
	call printf
	addl $4,%esp
	
	leal -4(%ebp),%eax
	leal -8(%ebp),%edx
	leal -12(%ebp),%ebx
	pushl %ebx
	pushl %edx
	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $16,%esp

	movl -4(%ebp),%eax
	cmp $0,%eax
	je   label_result_zero
	
	movl -8(%ebp),%eax
	addl $1,-8(%ebp)
	cmp $0,%eax
	je   label_result_zero
	
	movl $1,%eax
	jmp label_second_and
label_result_zero:	
 	movl $0,%eax
	
label_second_and:
	cmpl $0,%eax
	je  label_second_result
	
	movl -12(%ebp),%eax
	addl $1,-12(%ebp)
	cmp $0,%eax
	je  label_second_result
	
	movl $1,%eax
	jmp label_final_result	

 label_second_result:
	movl $0,%eax			
label_final_result:
	movl %eax,-16(%esp)

	movl -12(%ebp),%edx
	movl -8(%ebp),%ebx
	movl -4(%ebp),%ecx
	pushl %eax
	pushl %edx
	pushl %ebx
	pushl %ecx
	pushl $msg_main_print1
	call printf
	addl $20,%esp

	pushl $0
	call exit








	
