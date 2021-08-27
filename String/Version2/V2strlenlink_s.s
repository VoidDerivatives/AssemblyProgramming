.globl Mystrlen
.type Mystrlen,@function
Mystrlen:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp
	
	movl $0,-4(%ebp)
	jmp label_condition

label_code:
	addl $1,-4(%ebp)
	
label_condition:
	movb $0,%al
	movl -4(%ebp),%ecx  #counter
	movl 8(%ebp),%ebx  
	movb (%ebx,%ecx,1),%bl  #character
	cmpb %bl,%al
	jne label_code

 	movl -4(%ebp),%eax
	
	movl %ebp,%esp
	popl %ebp
		 
	ret

