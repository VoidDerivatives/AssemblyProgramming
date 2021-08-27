.section .rodata
	msg_main_print1:
	.string "Enter number1:"

	msg_main_print2:
	.string "Enter number2:"
	
	msg_main_scan1:
	.string "%f"

	msg_main_scan2:
	.string "%f"

	msg_main_print3:
	.string "Number1 is less than Number2"

	msg_main_print4:
	.string "Number1 is greater than Number2"
	
	msg_main_print5:
	.string "Number1 and Number2 is Equal"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $32,%esp

	movl $msg_main_print1,(%esp)	
	call printf

	#scanf("%f",&fNo1);
	leal -4(%ebp),%eax
	movl $msg_main_scan1,(%esp)
	movl %eax,4(%esp)
	call scanf

	movl $msg_main_print2,(%esp)	
	call printf

	#scanf("%f",&fNo1);
	leal -8(%ebp),%eax
	movl $msg_main_scan2,(%esp)
	movl %eax,4(%esp)
	call scanf
	
	#check = Comparism(fNo1,fNo2);
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	movl %eax,(%esp)
	movl %edx,4(%esp)
	call Comparism

	movl %eax,-12(%ebp)

	cmpl $1,%eax
	je label_less_than

	cmpl $-1,%eax
	je label_greater_than
	
	movl $msg_main_print5,(%esp)
	call printf

	jmp label_exit

label_less_than:
	
	movl $msg_main_print3,(%esp)
	call printf

	jmp label_exit
label_greater_than:

	movl $msg_main_print4,(%esp)
	call printf
label_exit:

	movl $0,(%esp)
	call exit

.globl Comparism
.type Comparism,@function
Comparism:
	pushl %ebp
	movl %esp,%ebp

	flds 12(%ebp)   #fNO2
	flds 8(%ebp)	#fNo1

	fcomi
	#fcompp 
	#fstsw 
	#sahf

	jb label_less_than2
	ja label_greater_than2
	
	movl $0,%eax
	jmp label_comp_exit

label_less_than2:
	movl $1,%eax
	jmp label_comp_exit

label_greater_than2:
	movl $-1,%eax
	jmp label_comp_exit
	
label_comp_exit:

	movl %ebp,%esp
	popl %ebp
	ret

	
	






