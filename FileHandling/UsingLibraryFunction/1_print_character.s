#1_print_character

.section .rodata
	msg_main_FileName:
	.string "print_characters.txt"

	msg_main_ReadMode:
	.string "r"

	msg_main_FileError:
	.string "\n cant open File: \n"

	msg_main_CharacterPrint:
	.string "%c"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $16,%esp

	movl $0,-4(%ebp) #fp = NULL
		
	#File open
	movl $msg_main_FileName,(%esp)
	movl $msg_main_ReadMode,4(%esp)
	call fopen

	movl %eax,-4(%ebp)

	cmpl $0,%eax
	jne label_fp_ISNotEqual		
	
	# File failed to open
	movl $msg_main_FileError,(%esp)
	call printf
	
	movl $-1,(%esp)
	call exit

label_fp_ISNotEqual:
	
	movl -4(%ebp),%eax
	
	movl %eax,(%esp)
	call fgetc

	movb %al,-5(%ebp)

	movb $-1,%bl

	cmpb %al,%bl
	jne label_condition_false

	jmp label_exit_while_loop


label_condition_false:

	movl $msg_main_CharacterPrint,(%esp)
	movl %eax,4(%esp)
	call printf	
	
	##label is already exist
	jmp label_fp_ISNotEqual 

label_exit_while_loop:
	movl -4(%ebp),%eax
	
	movl %eax,(%esp)
	call fclose

	#sanskar
	movl $0,-4(%ebp)
	
	movl $0,(%esp)
	call exit

