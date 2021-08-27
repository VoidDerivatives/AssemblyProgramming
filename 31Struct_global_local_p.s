.section .rodata
	msg_main_print1:
	.string "obj1 is \n"
	
	msg_main_print2:
	.string "chchar = %c ,ino =%d ,schiNO =%hd \n\n"

	msg_main_print3:
	.string "obj2 is \n"

.section .data
	.globl obj1
	.type obj1,@object
	.size obj1,12
	.align 4
	obj1:
		.ascii "A"
		.zero   3
		.int   10
		.value 30
 
.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $12,%esp

	movb $'B',-12(%ebp)
	movl $30,-8(%ebp)
	movw $40,-4(%ebp)

	pushl $msg_main_print1
	call printf
	addl $4,%esp
	
	movl $obj1,%ebx
	xorl %eax,%eax
	movb (%ebx),%al
	movl 4(%ebx),%edx
	xorl %ecx,%ecx
	movw 8(%ebx),%cx
	pushl %ecx 
	pushl %edx
	pushl %eax 
	pushl $msg_main_print2
	call printf
	addl $16,%esp

	pushl $msg_main_print3
	call printf
	addl $4,%esp

	leal -12(%ebp),%ebx
	xorl %eax,%eax
	movb  (%ebx),%al
	movl 4(%ebx),%edx
	xorl %ecx,%ecx
	movw 8(%ebx),%cx
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $16,%esp

 	pushl $0
	call exit

