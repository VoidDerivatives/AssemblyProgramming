.section .rodata
	msg_main_print1:
	.string "fNo1 = %f\nfNo2 = %f\n"

	msg_main_print2:
	.string "fAns1 = %f\t\n"

	msg_main_print3:
	.string "fAns2 = %f\t\n"

	int_data:
	.int 30

	
.section .data
	.globl fNo1
	.type fNo1,@object
	.size fNo1,4
	.align 4
	fNo1:
		.float 10.22

 	.globl fNo2
	.type fNo2,@object
	.size fNo2,4
	.align 4
	fNo2:
		.float 20.22

.section .bss
	.comm fAns1 , 4 ,4
	.comm fAns2 , 4 ,4

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $16,%esp

	finit 

	flds fNo2
	flds fNo1
	
	movl $msg_main_print1,(%esp)	
	fstpl 4(%esp)    #fno1(8byte)
	fstpl 12(%esp)	#fno2
	call printf
	
	################	
	#fAns1 = fno1 + fNo2
	flds fNo1
	flds fNo2
	fadd %st(1),%st(0)
		
	fstps fAns1
	################
	#fadd
	#fAns2 = fno1 + 30
	#filds int_data
	#flds fNo1
	#fadd %st(1),%st(0)	

	#fstps fAns2
	################		
	#faddp 
	#filds int_data
	#flds fNo1
	#faddp

	#fstps fAns2
	###############
	#fiadd
	flds fNo1
	fiadd int_data
	
	fstps fAns2
	###############
	flds fAns1
	movl $msg_main_print2,(%esp)
	fstpl 4(%esp)
	call printf
	
	flds fAns2
	movl $msg_main_print3,(%esp)
	fstpl 4(%esp)
	call printf

	movl $0,(%esp)
	call exit

