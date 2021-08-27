.equ MAX,256

.section .rodata
	msg_main_print1:
	.string "keyboard_to_file.txt"

	msg_main_FileFailure:
	.string "\n Cant open File"
	
	msg_main_print1Size1:
	.equ Print1Size1,msg_main_print1Size1 - msg_main_FileFailure

	msg_main_instruction:
	.string "\n To stop the process, please press the key (ctrl + D)"
	
	msg_main_print2Size2:
	.equ Print2Size2,msg_main_print2Size2 - msg_main_instruction
	
	msg_main_print2:
	.string "\nEnter strings:\n"

	msg_main_print3Size3:
	.equ Print3Size3,msg_main_print3Size3 - msg_main_print2

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $288,%esp				
	
	movl $5,%eax
	movl $msg_main_print1,%ebx
	movl $001101,%ecx
	movl $0666,%edx	
	int $0x80

	movl %eax,-4(%ebp)
	
	cmpl $-1,%eax
	je label_if_true
	
	movl $4,%eax	
	movl $1,%ebx
	movl $msg_main_instruction,%ecx
	movl $Print2Size2,%edx
	int $0x80
	
	movl $4,%eax	
	movl $1,%ebx
	movl $msg_main_print2,%ecx	
	movl $Print3Size3,%edx
	int $0x80

	jmp label_while_condition

label_while_code:		

	movl $4,%eax	
	movl -4(%ebp),%ebx
	leal -260(%ebp),%ecx
	movl -264(%ebp),%edx 
	int $0x80

label_while_condition:	

	movl $3,%eax
	movl $1,%ebx
	leal -260(%ebp),%ecx  #Buffer
	movl $MAX,%edx
	int $0x80

	movl %eax,-264(%ebp)    #ReadCount

	cmpl $0,%eax
	jg label_while_code	

	movl $6,%eax
	movl -4(%ebp),%ebx
	int $0x80	

	movl $1,%eax
	movl 0,%ebx
	int $0x80

label_if_true:

	movl $4,%eax	
	movl $1,%ebx
	movl $msg_main_FileFailure,%ecx	
	movl $Print1Size1,%edx
	int $0x80
	
	movl $1,%eax
	movl -1,%ebx
	int $0x80	
	
