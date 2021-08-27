
#substaction little endian	
.section .rodata
	msg_main_print:
	.string "Addition is : %qd"

.section .data
	.globl g_ino1
	.type g_ino1,@object
	.size g_ino1,8
	.align 4
	g_ino1:
		.quad 4294967296

	.globl g_ino2
	.type g_ino2,@object
	.size g_ino2,8
	.align 4
	g_ino2:
		.quad 4294967300


.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $16,%esp
	
	movl g_ino1,%eax
	movl g_ino1+4,%edx
						
	movl g_ino2,%ecx
	movl g_ino2+4,%ebx

	subl %eax,%ecx
	sbbl %ebx,%edx

	movl $msg_main_print,(%esp)
	movl %ecx,4(%esp)
	movl %edx,8(%esp)
	call printf


	
	




	movl $0,(%esp)
	call exit

