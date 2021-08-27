.section .rodata 
	msg_main_print1:
	.string "\n 1. Addition \n 2. Substraction \n 3. multiplication \n 4. Division \n 5. Exit\n\n"

	msg_main_print2:
	.string "Enter your choice:\t"

	msg_main_scan1:
	.string "%d"

	msg_main_print3:
	.string "Enter the numbers :\t"

	msg_main_scan2:
	.string "%d%d"

	msg_main_print4:
	.string "Enter the valid choice\n"

	msg_main_print5:
	.string "Answer is %d\n\n"

	msg_main_print6:
	.string "Are you want to enter more choice ?(1/0) :\t"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	#do
	#choices
continue_again:
	pushl $msg_main_print1
	call printf
	addl $4,%esp

	#enter choice 
	pushl $msg_main_print2
	call printf
	addl $4,%esp

	#scanf
	leal -16(%ebp),%eax
	pushl %eax
	pushl $msg_main_scan1
	call scanf
	addl $8,%esp

	#if ,1st cond
	movl -16(%ebp),%eax
	cmpl $0,%eax
	jle  label_cond_false 
	
	#2nd cond
	cmpl $5,%eax	
	jge  label_cond_false

	pushl $msg_main_print3
	call  printf
	addl  $4,%esp

	leal  -4(%ebp),%eax
	leal  -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_scan2
	call scanf
	addl $12,%esp
	 
#cond false
label_cond_false:
	movl -16(%ebp),%eax
	
	cmpl $1,%eax
	je case1_add

	cmpl $2,%eax
	je  case2_sub

	cmpl $3,%eax
	je  case3_mul

	cmpl $4,%eax
	je case4_div

	cmpl $5,%eax
	je case5_exit

	pushl $msg_main_print4
	call printf
	addl $4,%esp

	movl $1,-16(%ebp)

	jmp continue_again	
	
case1_add:
	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
	pushl %eax
	pushl %edx
	call addition
	addl $8,%esp
	movl %eax,-12(%ebp)
	jmp  label_stop

case2_sub:
	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
	pushl %eax
	pushl %edx
	call substraction
	addl $8,%esp
	movl %eax,-12(%ebp)
	jmp  label_stop

case3_mul:
	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
	pushl %eax
	pushl %edx
	call multiplication
	addl $8,%esp
	movl %eax,-12(%ebp)
	jmp  label_stop

case4_div:
	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
	pushl %eax
	pushl %edx
	call division
	addl $8,%esp
	movl %eax,-12(%ebp)
	jmp  label_stop

#exit 
label_stop:
	movl -12(%ebp),%eax
	pushl %eax
	pushl $msg_main_print5
	call printf
	addl $8,%esp
	
	pushl $msg_main_print6
	call printf
	addl $4,%esp

	leal -16(%ebp),%eax
	pushl %eax
	pushl $msg_main_scan1
	call scanf
	addl $8,%esp
	
	movl -16(%ebp),%eax
	cmpl $1,%eax
	je  continue_again
	
case5_exit:
	pushl $0
	call exit 


.globl addition
.type addition,@function
addition:
	pushl %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%edx
	movl 12(%ebp),%eax
	addl %edx,%eax
	
	movl %ebp,%esp
	popl %ebp
	
	ret

.globl substraction
.type substraction,@function
substraction:
	pushl %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%edx
	movl 12(%ebp),%eax
	subl %edx,%eax
	
	movl %ebp,%esp
	popl %ebp
	
	ret

.globl multiplication
.type multiplication,@function
multiplication:
	pushl %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	mull %edx
	
	movl %ebp,%esp
	popl %ebp
	
	ret

.globl division
.type division,@function
division:
	pushl %ebp
	movl %esp,%ebp
	
	xorl %edx,%edx
	xorl %eax,%eax
	xorl %ecx,%ecx
	xorl %ebx,%ebx

	movl 8(%ebp),%eax
	movl 12(%ebp),%ecx
	divl %ecx
	
	movl %ebp,%esp
	popl %ebp
	
	ret

