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
	je  label_add
	
	cmpl $2,%eax
	je label_sub

	cmpl $3,%eax
	je label_mult

	cmpl $4,%eax
	je label_div
	
	jmp label_default

label_add:
	pushl $msg_main_add
	call printf
	addl $4,%esp

label_sub:
	pushl $msg_main_sub
	call printf
	addl $4,%esp

label_mult:
	pushl $msg_main_mult
	call printf
	addl $4,%esp

label_div:
	pushl $msg_main_div
	call printf
	addl $4,%esp

label_default:
 	pushl $msg_main_Invaild
	call printf
	addl $4,%esp

	pushl $0
	call exit


