.section .rodata 
	msg_main_print:
	.string "Enter the three numbers:\t"

	msg_main_scan:
	.string "%d%d%d"
	
	msg_main_print1:
	.string "Answer is : %d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl  %esp,%ebp
			
	subl  $16,%esp

	pushl $msg_main_print
	call  printf
	addl  $4,%esp

	leal  -4(%ebp),%eax
	leal  -8(%ebp),%edx
	leal  -12(%ebp),%ebx
	pushl %ebx						
	pushl %edx
	pushl %eax		
	pushl $msg_main_scan
	call  scanf
	addl  $12,%esp
			
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	cmpl %edx,%eax
	jl    Label_result_less_than_true           
	movl $0,%eax
	jmp Label_result_less_than_false 
               
Label_result_less_than_true:
	movl $1,%eax		
		
Label_result_less_than_false:
	movl -12(%ebp),%edx
	cmp   %edx,%eax
	jne   Label_result_not_equal 
	movl $0,%eax
	jmp  Label_done 

 Label_result_not_equal:
	movl $1,%eax

 Label_done:
        movl %eax,-16(%ebp)
	
	pushl %eax
	pushl $msg_main_print1
	call printf
	addl $8,%esp


	pushl $0
	call exit







	



