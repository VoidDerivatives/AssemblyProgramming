.section .rodata
	msg_main_FileName:
	.string "student_structure_from_keyboard_to_file.txt"

	msg_main_FileMode:
	.string "w"

	msg_main_FileError:
	.string "\n Cant open File \n"

	msg_main_EnterInfo:
	.string "\n\n Enter name,roll no and percentage \n"

	msg_main_scan1:
	.string "%s %d %f"

	msg_main_ManyRecord:
	.string "\n Add another record (Y/N)"

	msg_main_scan2:
	.string "%c %c"

	msg_main_FilePrinting:
	.string "%s %d %f \n" 
	
	
.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $80,%esp

	movl $0,-4(%ebp) #fp = NULL
	
	movb $'Y',-5(%ebp)
	
	#fileopen
	movl $msg_main_FileName,(%esp)
	movl $msg_main_FileMode,4(%esp)
	call fopen

	movl %eax,-4(%ebp)

	cmpl $0,%eax
	jne label_Not_Equal

	movl $msg_main_FileError,(%esp)
	call printf

	movl $-1,(%esp)
	call exit	
			
label_Not_Equal:
	jmp label_condition


label_code:
	movl $msg_main_EnterInfo,(%esp)
	call printf
	
	leal -53(%ebp),%ebx
	leal -13(%ebp),%eax
	leal -9(%ebp),%edx

	movl $msg_main_scan1,(%esp)
	movl %ebx,4(%esp)	
	movl %eax,8(%esp)
	movl %edx,12(%esp)
	call scanf
	
	#######fprintf
	movl -4(%ebp),%eax		
	#leal -53(%ebp),%ebx (optimise)
	movl -13(%ebp),%edx
	#float
	flds -9(%ebp)

	movl %eax,(%esp)
	movl $msg_main_FilePrinting,4(%esp)
	movl %ebx,8(%esp)	
	movl %edx,12(%esp)
	fstpl  16(%esp)
	call fprintf

	movl $msg_main_ManyRecord,(%esp)
	call printf

	leal -54(%ebp),%eax
	leal -5(%ebp),%ebx 

	movl $msg_main_scan2,(%esp)
	movl %eax,4(%esp)
	movl %ebx,8(%esp)
	call scanf
label_condition:
	movb -5(%ebp),%al
	cmpb $'Y',%al
	je label_code

	cmpb $'y',%al
	je label_code

	################
	movl -4(%ebp),%eax
	movl %eax,(%esp)
	call fclose

	movl $0,-4(%ebp)


	movl $0,(%esp)
	call exit
