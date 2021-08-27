.section .rodata
	msg_main_SourceFile:
	.string "file_copy_source.txt"

	msg_main_DestinationFile:
	.string "file_copy_Destination.txt"
	
	msg_main_FileErrorSource:
	.string "\n cant open source file \n"	
	
	msg_main_FileErrorDestination:
	.string "\n cant open destination file \n"

	msg_main_ReadMode:
	.string "r"

	msg_main_WriteMode:
	.string "w"
		
	msg_main_copied:
	.string "\n Copied Successful \n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp
	
	subl $16,%esp	

	movl $0,-4(%ebp)  #fpsource = NULL
	movl $0,-8(%ebp)  #fpdestination = NULL

	# Source File open
	movl $msg_main_SourceFile,(%esp)
	movl $msg_main_ReadMode,4(%esp)
	call fopen

	movl %eax,-4(%ebp)

	cmpl $0,%eax
	jne label_fpSource_ISNotEqual		
	
	#source File failed to open
	movl $msg_main_FileErrorSource,(%esp)
	call printf
	
	movl $-1,(%esp)
	call exit

label_fpSource_ISNotEqual:

	#Destination File open
	movl $msg_main_DestinationFile,(%esp)
	movl $msg_main_WriteMode,4(%esp)
	call fopen

	movl %eax,-8(%ebp)

	cmpl $0,%eax
	jne label_fpDestination_ISNotEqual		
	
	#Destination File failed to open
	movl $msg_main_FileErrorDestination,(%esp)
	call printf
	
	#fclose(fpsource)
	movl -4(%ebp),%eax
	movl %eax,(%esp)
	call fclose

	#fpsource = NULL
	movl $0,-4(%ebp)

	movl $-1,(%esp)
	call exit

label_fpDestination_ISNotEqual:

	movl -4(%ebp),%eax
	
	movl %eax,(%esp)
	call fgetc

	movb %al,-9(%ebp)

	movb $-1,%bl

	cmpb %al,%bl
	jne label_condition_false

	jmp label_exit_while_loop

label_condition_false:
	xorl %eax,%eax
	movb -9(%ebp),%al
	movl -8(%ebp),%ebx
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call fputc
 	
	jmp label_fpDestination_ISNotEqual
	

label_exit_while_loop:

	movl -4(%ebp),%eax
	movl -8(%ebp),%ebx
	
	movl %eax,(%esp)
	call fclose
	
	movl $0,-4(%ebp)
	movl %ebx,(%esp)
	call fclose
	
	movl $0,-8(%ebp)
	movl $msg_main_copied,(%esp)
	call printf	


	movl $0,(%esp)
	call exit
