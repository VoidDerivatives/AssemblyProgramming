.section .rodata
	msg_main_print1:
	.string "\n\nEnter the string (Maximum 20 character):\t"

	msg_main_print2:
	.string "\n\nEnter the character to be found:\t"

	msg_main_print3:
	.string "\n\nCharacter is not found\t"

	msg_main_print4:
	.string "\n\nCharacter is found at %d Loaction\n"

	msg_main_scan:
	.string "%c"

	msg_main_check:
	.string "%c"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $48,%esp

	#printf("\n\nEnter the string (Maximum 20 character):\t");
	movl $msg_main_print1,(%esp)
	call printf

	leal -20(%ebp),%ebx
	movl %ebx,(%esp)
	call gets

	#printf("\n\nEnter the character to be found:\t");
	movl $msg_main_print2,(%esp)
	call printf

	leal -21(%ebp),%ebx
	movl $msg_main_scan,(%esp)
	movl %ebx,4(%esp)
	call scanf
	
	leal -20(%ebp),%eax
	leal -21(%ebp),%ebx
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call MyStrchr

	movl %eax,-25(%ebp)
	
	cmpl $0,%eax
	jne label_main_not_equal
		
	movl $msg_main_print3,(%esp)
	call printf

	jmp label_main_exit

label_main_not_equal:
	leal -20(%ebp),%ebx
	subl %ebx,%eax
		
	movl $msg_main_print4,(%esp)
	movl %eax,4(%esp)
	call printf

label_main_exit:
	
	movl $0,(%esp)
	call exit

.globl MyStrchr
.type MyStrchr,@function
MyStrchr:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	movl 8(%ebp),%edi		

	movl %edi,(%esp)
	call Mystrlen

	movl %eax,%ecx #size

	movl 12(%ebp),%eax
	movb (%eax),%al
 
	repne scasb
	je label_equal	

	movl $0,%eax
	
	jmp label_exit
label_equal:
	#dec %edi
	movl %edi,%eax	
	 
label_exit:	
	movl %ebp,%esp
	popl %ebp
	ret
