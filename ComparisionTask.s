.equ LT,1
.equ LE,2
.equ GT,4
.equ GE,8
.equ EE,16

.section .rodata
	msg_main_print1:
	.string "Enter the two numbers for showing relation :"

	msg_main_scan:
	.string "%d %d"

	msg_main_check:
	.string "check : %d\n"

	msg_main_print_1if1:
	.string "\n%d is less than %d\n"

	msg_main_print_1if2:
	.string "\n%d is less than or equal to %d\n"

	msg_main_print_1if3:
	.string "\n%d is not greater than %d\n"

	msg_main_print_1if4:
	.string "\n%d is not greater than equal %d\n"

	msg_main_print_2if1:
	.string "\n%d is not less than %d\n"

	msg_main_print_2if2:
	.string "\n%d is not less than or equal to %d\n"

	msg_main_print_2if3:
	.string "\n%d is greater than %d\n"

	msg_main_print_2if4:
	.string "\n%d is greater than or equal to %d\n"

	msg_main_print_3if1:
	.string "\n%d is not less than %d\n"
	
	msg_main_print_3if2:
	.string "\n%d is less than or equal to %d\n"
		
	msg_main_print_3if3:
	.string "\n%d is not greater than %d\n"
	
	msg_main_print_3if4:
	.string "\n%d is greater than or equal to %d\n"

	msg_main_print_3if5:
	.string "\n%d is equal to %d\n\n"

	msg_main_print_else:
	.string "\n%d and %d is not equal to %d\n\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $9,%esp
	
	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax   #scanf
	leal -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_scan 
	call scanf
	addl $12,%esp

	movl -4(%ebp),%eax  #push para
	movl -8(%ebp),%edx  
	pushl %edx
	pushl %eax
	call compare       #comapare call
	addl $8,%esp
	movb %al,-9(%ebp)
	
	movb -9(%ebp),%al
	andb $LT,%al
	cmpb $LT,%al
	jne  label_main_1stif_false 

	movb -9(%ebp),%al
	andb $LE,%al
	cmpb $LE,%al
	jne label_main_1stif_false 

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_1if1
	call printf
	addl $12,%esp
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_1if2
	call printf
	addl $12,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_1if3
	call printf
	addl $12,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_1if4
	call printf
	addl $12,%esp
		
	jmp label_else
	
label_main_1stif_false :
	
	xorl %eax,%eax

	movb -9(%ebp),%al

	andb $GT,%al
	cmpb $GT,%al
	jne  label_main_2ndif_false

	movb -9(%ebp),%al	
	andb $GE,%al
	cmpb $GE,%al
	jne  label_main_2ndif_false
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_2if1
	call printf
	addl $12,%esp
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_2if2
	call printf
	addl $12,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_2if3
	call printf
	addl $12,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_2if4
	call printf
	addl $12,%esp
		
	jmp label_else	
	
label_main_2ndif_false:
	
	xorl %eax,%eax

	movb -9(%ebp),%al

	andb $EE,%al
	cmpb $EE,%al
	jne  label_else
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_3if1
	call printf
	addl $12,%esp
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_3if2
	call printf
	addl $12,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_3if3
	call printf
	addl $12,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_3if4
	call printf
	addl $12,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_3if5
	call printf
	addl $12,%esp
		
	jmp label_exit	
	
label_else:
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_print_else
	call printf
	addl $12,%esp

label_exit:
	pushl $0
	call exit

.globl compare
.type compare,@function
compare:
	pushl %ebp
	movl %esp,%ebp

	subl $1,%esp

	xorl %ecx,%ecx    #zero out
	xorl %eax,%eax
	xorl %ebx,%ebx
	xorl %edx,%edx

	movb $0,-1(%ebp)
	movb -1(%ebp),%cl    #0 => %ecx   // cl beacause 1byte	

	movl 8(%ebp),%eax    
	movl 12(%ebp),%edx
	
	cmpl %edx,%eax    #cmp eax and edx
	jge label_greaterThan_1stif
	
	orb $LT,%cl
	orb $LE,%cl
		
label_greaterThan_1stif:
	jle label_lessThan_2ndif

	orb $GT,%cl
	orb $GE,%cl

label_lessThan_2ndif:

	jne label_notEqual_3rdif
	
	orb $LE,%cl
	orb $GE,%cl
	orb $EE,%cl

	
label_notEqual_3rdif:
	movb %cl,%al	
	
	movl %ebp,%esp
	popl %ebp
	ret
