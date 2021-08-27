.equ MAX,50
.section .rodata
	msg_main_print1:
	.string "Enter value of n(< %d):\t"

	msg_main_scan:
	.string "%d"

	msg_main_print2:
	.string "Enter %d value:\t"

	msg_main_print3:
	.string "Entered elements are:\n"
	
	msg_main_print4:
	.string "%d value is:\t%d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp


	subl $208,%esp

	pushl $MAX
	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%ebx
	pushl %ebx
	pushl $msg_main_scan
	call scanf
	addl $8,%esp

	movl $0,-8(%ebp)
	jmp main_cond_for1

main_code_for1:
	
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $8,%esp

	movl -8(%ebp),%eax
		
	leal -208(%ebp,%eax,4),%ebx
	pushl %ebx
	pushl $msg_main_scan
	call scanf
	addl $8,%esp

	addl $1,-8(%ebp)

main_cond_for1:
	movl -4(%ebp),%edx
	movl -8(%ebp),%eax
	cmpl %edx,%eax
	jl main_code_for1

	#printf for2 
	pushl  $msg_main_print3
	call printf
	addl $4,%esp
	
	#for2
	movl $0,-8(%ebp)
	jmp main_cond_for2

main_code_for2:
		
	movl -208(%ebp,%eax,4),%ebx
	pushl %ebx
	pushl %eax
	pushl $msg_main_print4
	call printf
	addl $8,%eax

	addl $1,-8(%ebp)	

main_cond_for2:
	movl -4(%ebp),%edx
	movl -8(%ebp),%eax
	cmpl %edx,%eax		
	jl main_code_for2


	pushl $0
	call exit

		

