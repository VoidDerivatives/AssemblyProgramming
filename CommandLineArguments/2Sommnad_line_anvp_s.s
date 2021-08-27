.section .rodata 
	msg_main_print:
	.string "Envp values are:"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp
	
	subl $16,%esp

	movl $msg_main_print,(%esp)
	call puts		
	    
	movl 4(%ebp),%edx 	 #argc
	addl $1,%edx             #argc + 1
	movl $4,%eax          
	mull %edx

	leal 8(%ebp),%ebx
	addl %ebx,%eax 
	
	movl %eax,-8(%ebp)    #backup
	
	movl $0,-4(%ebp)	#counter
	jmp label_main_condition	

label_main_code:
		
	movl %eax,(%esp)
	call puts			
											
	addl $1,-4(%ebp)		
			
label_main_condition:	
	movl -4(%ebp),%ecx   #counter
	movl -8(%ebp),%edx   #envp[0]
	movl (%edx,%ecx,4),%eax

	cmpl $0,%eax
	jne label_main_code	

	movl $0,(%esp)
	call exit
		
