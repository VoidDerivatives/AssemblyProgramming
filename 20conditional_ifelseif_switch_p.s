.section .rodata
	msg_main_print_choice:
	.string "1. Addition \n2. substraction \n3. multiplication \n4.division\n"

	msg_main_print_enter:
	.string "Enter your choice:\t"

	msg_main_scan:
	.string "%d"
	
	msg_main_add:
	.string "Addition\n"
	
	msg_main_sub:
	.string "substraction\n"

	msg_main_mult:
	.string "Multiplication\n"
	
	msg_main_div:
	.string "division\n"

	msg_main_Invaild:
	.string "Invaild choice\n"
.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $4,%esp
	
	pushl $msg_main_print_choice
	call printf
	addl $4,%esp

	pushl $msg_main_print_enter
	call printf
	addl $4,%esp
	
	leal -4(%ebp),%eax
	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $8,%esp


	movl -4(%ebp),%eax
	cmpl $1,%eax
	jne  label_else_if1
	
	pushl $msg_main_add
	call printf
	addl $4,%esp
	jmp label_exit

label_else_if1:
	cmpl $2,%eax
	jne label_else_if2
	
	pushl $msg_main_sub
	call printf
	addl $4,%esp
	jmp label_exit

label_else_if2:
	cmpl $3,%eax
	jne label_else_if3
	
	pushl $msg_main_mult
	call printf
	addl $4,%esp
	jmp label_exit

label_else_if3:
	cmpl $4,%eax
	jne label_else

	pushl $msg_main_div
	call printf
	addl $4,%esp
	jmp label_exit

label_else:
	pushl $msg_main_Invaild
	call printf
	addl $4,%esp

label_exit:
	pushl $0
	call exit

	
	





	



	





