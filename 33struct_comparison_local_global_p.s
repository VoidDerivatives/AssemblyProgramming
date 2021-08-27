.section .rodata
	msg_main_print1:
	.string "obj1 is \n"
	
	msg_main_print2:
	.string "chchar = %c ,iNo = %d ,shiNo = %hd\n\n"

	msg_main_print3:
	.string "obj2 is \n"

	msg_main_print4:    
	.string "obj3 is \n"

	msg_main_print5:
	.string "obj1 &obj2 comparision is \n"

	msg_main_print6:
	.string "Equal\n"

	msg_main_print7:
	.string "Not equal\n"

	msg_main_print8:
	.string "obj2 and obj3 comparision is\n"

.section .data
	.globl obj1
	.type obj1,@object
	.size obj1,12
	.align 4
	obj1:
		.ascii "A"
		.zero 3
		.int 10
		.value 4 
		
.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $24,%esp

	#init obj2
	xorl %eax,%eax
	movb $'B',%al
	movl %eax,-12(%ebp)

	movl $30,%eax
	movl %eax,-8(%ebp)

	xorl %eax,%eax
	movw $40,%ax
	movl %eax,-4(%ebp)

	#init obj3
	xorl %eax,%eax
	movb $'B',%al
	movl %eax,-24(%ebp)

	movl $30,%eax
	movl %eax,-20(%ebp)

	xorl %eax,%eax
	movw $40,%ax
	movl %eax,-16(%ebp)

	# print object 1
	pushl $msg_main_print1
	call printf
	addl $4,%esp

	movl $obj1,%ebx
	xorl %eax,%eax
	movl (%ebx),%eax   #char
	movl 4(%ebx),%edx   #int
	movl 8(%ebx),%ecx   #short
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $16,%esp

	#obj2 printing   
	pushl $msg_main_print3
	call printf
	addl $4,%esp

	leal -12(%ebp),%ebx
	xorl %eax,%eax
	movl (%ebx),%eax    #char
	xorl %edx,%edx
	movl 8(%ebx),%edx     #short
	movl 4(%ebx),%ecx     #int
	pushl %edx
	pushl %ecx
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $16,%esp

	#obj3 printing
	pushl $msg_main_print4
	call printf
	addl $4,%esp

	xorl %edx,%edx
	xorl %eax,%eax
	
	leal -24(%ebp),%ebx
	movb (%ebx),%al
	movw 8(%ebx),%dx
	movl 4(%ebx),%ecx
	pushl %edx
	pushl %ecx
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $16,%esp

	#comparision obj1 and obj2

	pushl $msg_main_print5
	call printf
	addl $4,%esp
	
	xorl %eax,%eax	
	xorl %edx,%edx
	
	movl $obj1,%ebx
	movb (%ebx),%al
	leal -12(%ebp),%ecx
	movb (%ecx),%dl
	cmpb %al,%dl
	jne label_not_equal
					
	movl 4(%ebx),%eax
	movl 4(%ecx),%edx
	cmpl %eax,%edx
	jne label_not_equal
	
	movl $1,%eax	
	jmp label_last_cond


label_not_equal:
	movl $0,%eax

label_last_cond:
	cmpl $0,%eax
	je label_not_equal1
 
	movw 8(%ebx),%ax
	movw 8(%ecx),%dx
	cmpw %ax,%dx
	jne label_not_equal1
		
	pushl $msg_main_print6
	call printf
	addl $4,%esp

	jmp label_second_if

label_not_equal1:
	pushl $msg_main_print7
	call printf
	addl $4,%esp
	

	# comparision obj2 and obj3
label_second_if:
	pushl $msg_main_print8
	call printf
	addl $4,%esp
	
	xorl %eax,%eax	
	xorl %edx,%edx
	xorl %ecx,%ecx
	
	leal -24(%ebp),%ebx
	movb (%ebx),%al
	leal -12(%ebp),%ecx
	movb (%ecx),%dl
	cmpb %al,%dl
	jne label_not_equal_2ndif
					
	movl 4(%ebx),%eax
	movl 4(%ecx),%edx
	cmpl %eax,%edx
	jne label_not_equal_2ndif
	
	movl $1,%eax
	jmp label_last_cond_2ndif

label_not_equal_2ndif:
	movl $0,%eax

label_last_cond_2ndif:
	cmpl $0,%eax
	je label_not_equal1_2ndif
 
	movw 8(%ebx),%ax
	movw 8(%ecx),%dx
	cmpw %ax,%dx
	jne label_not_equal1_2ndif
		
	pushl $msg_main_print6
	call printf
	addl $4,%esp

	jmp label_exit

label_not_equal1_2ndif:
	pushl $msg_main_print7
	call printf
	addl $4,%esp
		
label_exit:
	pushl $0
	call exit


	
