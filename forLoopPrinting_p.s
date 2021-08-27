.section .rodata
	msg_main_print:
	.string "Enter the value:\t:"
	
	msg_main_scan:
	.string "%d"

	msg_main_print1:
	.string "*\t"

	msg_main_print2:
	.string "\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $12,%esp

	pushl $msg_main_print
	call printf
	addl $4,%esp

	#scanf
	leal -4(%ebp),%ebx
	pushl %ebx
	pushl $msg_main_scan	
	call scanf
	addl $8,%esp

	#for(counter1=0 ; i<no ; counter1++)

	movl $0,-8(%ebp)
	jmp label_condition_for1

label_code_for1:

	#for(counter2 = 0; counter2<no ;counter++)
	movl $0,-12(%ebp)
	jmp label_condition_for2
	
label_code_for2:
	pushl $msg_main_print1
	call printf
	addl $4,%esp
	
	#increment (for2)
	addl $1,-12(%ebp)
	
label_condition_for2:
	movl -4(%ebp),%edx   #no
	movl -12(%ebp),%eax  #counter2
	cmpl %edx,%eax
	jl label_code_for2

	pushl $msg_main_print2
	call printf
	addl $4,%esp

	#increment (for1)
	addl $1,-8(%ebp)
	
label_condition_for1:
	movl -4(%ebp),%edx  #no
	movl -8(%ebp),%eax  #counter
	cmpl %edx,%eax
	jl label_code_for1


	pushl $0
	call exit

