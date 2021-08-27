.equ MAX,256

.section .rodata
	msg_main_print1:
	.string "print_characters.txt"

	msg_main_print2:
	.string "\n Cant open File"

	msg_main_print1Size:
	.equ Print1Size1,msg_main_print1Size - msg_main_print2

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $288,%esp				
	
	movl $5,%eax   #open System call
	movl $msg_main_print1,%ebx
	movl $00,%ecx
	int $0x80
			
	movl %eax,-4(%ebp)
	
	cmpl $-1,%eax
	je label_if_true
	
	jmp label_while_condition

label_while_code:		
	
	movl $4,%eax  #write system call 
	movl $1,%ebx
	leal -260(%ebp),%ecx  #Buffer
	movl -264(%ebp),%edx
	int $0x80		
	

label_while_condition:	
	movl $3,%eax	
	movl -4(%ebp),%ebx   #fd
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
	movl $0,%ebx
	int $0x80	
	
label_if_true:

	movl $4,%eax
	movl $1,%ebx
	movl $msg_main_print2,%ecx
	movl $Print1Size1,%edx
	int $0x80
	
	movl $1,%eax
	movl $-1,%ebx
	int $0x80	
	
