.equ MAX,256

.section .rodata
	msg_main_print1:
	.string "chars_spaces_tabs_newlines_count.txt"

	msg_main_print2:
	.string "\n Cant open File"

	msg_main_print1Size:
	.equ Print1Size1,msg_main_print1Size - msg_main_print2  

	msg_main_char:
	.string "\nNo of characters are %d\n"

	msg_main_space:
	.string "No of spaces are %d\n"

	msg_main_tabs:
	.string "No of tabs are %d\n"

	msg_main_lines:
	.string "No of lines are %d\n"	 

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $304,%esp

	movl $0,-8(%ebp)
	movl $0,-12(%ebp)
	movl $0,-16(%ebp)
	movl $0,-20(%ebp)

	movl $5,%eax
	movl $msg_main_print1,%ebx
	movl $00,%ecx
	int $0x80

	movl %eax,-4(%ebp)

	cmpl $-1,%eax
	je label_if_condition_true	

	jmp label_while1_condition

label_while1_code:		

	addl %eax,-8(%ebp)

	movl $0,-28(%ebp)   #counter
	jmp label_for_condition		

label_for_code:
	
	movb -284(%ebp,%edx,1),%al

	cmpb $' ',%al
	je label_space

	cmpb $'\t',%al
	je label_tab

	cmpb $'\n',%al
	je label_lines

	jmp label_for_increment

label_space:

	addl $1,-12(%ebp)
	jmp label_for_increment
	
label_tab:

	addl $1,-16(%ebp)
        jmp label_for_increment

label_lines:

	addl $1,-20(%ebp)

label_for_increment:

	addl $1,-28(%ebp)

label_for_condition:
	movl -28(%ebp),%edx   #counter
	movl -24(%ebp),%eax	

	cmpl %eax,%edx
	jl label_for_code


label_while1_condition:
	
	movl $3,%eax	
	movl -4(%ebp),%ebx   #fd
	leal -284(%ebp),%ecx  #Buffer	
	movl $MAX,%edx
	int $0x80	

	movl %eax,-24(%ebp)    #ReadCount

	cmpl $0,%eax
	jg label_while1_code	
	
	movl $6,%eax
	movl -4(%ebp),%ebx
	int $0x80

	movl -8(%ebp),%eax
	movl $msg_main_char,(%esp)
	movl %eax,4(%esp)
	call printf
	
	movl -12(%ebp),%ebx
	movl $msg_main_space,(%esp)
	movl %ebx,4(%esp)
	call printf
	
	movl -16(%ebp),%ecx
	movl $msg_main_tabs,(%esp)
	movl %ecx,4(%esp)
	call printf
	
	movl -20(%ebp),%edx
	movl $msg_main_lines,(%esp)
	movl %edx,4(%esp)
	call printf
	
	movl $1,%eax
	movl $0,%ebx
	int $0x80

label_if_condition_true:

	movl $4,%eax
	movl $1,%ebx
	movl $msg_main_print2,%ecx
	movl $Print1Size1,%edx
	int $0x80	

	movl $1,%eax
	movl $-1,%ebx
	int $0x80
