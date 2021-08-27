.section .rodata
	msg_main_print1:
	.string "Hello\n"

	msg_main_print2:
	.string "iRet = %d\n"

	msg_main_print3:
	.string "%d\n"
	
	msg_main_print4:
	.string "%d %d\n"

	msg_main_print5:
	.string "%d %c\n"

	msg_main_print6:
	.string "%c %d\n"

	msg_main_print7:
	.string "%d %c %s\n"

	msg_main_print8:
	.string "Addition is %d\n"

	msg_main_print9:
	.string "Bye"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $32,%esp
	
	#iRet = myprintf("Hello\n"); 
	movl $msg_main_print1,%ebx
	movl %ebx,(%esp)
	call myprintf
	movl %eax,-4(%ebp)
		
	#myprintf("iRet = %d\n", iRet);
	movl $msg_main_print2,%eax
	movl -4(%ebp),%ebx	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call myprintf

	#myprintf("%d\n", 10);	
	movl $msg_main_print3,%eax
	movl %eax,(%esp)
	movl $10,4(%esp)
	call myprintf

	#myprintf("%d %d\n", 10, 20);  
	movl $msg_main_print4,%eax
	movl %eax,(%esp)
	movl $10,4(%esp)
	movl $20,8(%esp)
	call myprintf

	#myprintf("%d %c\n", 10, 'A');
	movl $msg_main_print5,%eax
	movl %eax,(%esp)
	movl $10,4(%esp)
	movl $'A',8(%esp)
	call myprintf	

	#myprintf("%c %d\n", 'B', 20);
	movl $msg_main_print6,%eax
	movl %eax,(%esp)
	movl $'B',4(%esp)
	movl $20,8(%esp)
	call myprintf	
	
	#myprintf("%d %c %s\n", 30, 'C', "Bye");
	leal msg_main_print7,%eax
	leal msg_main_print9,%edx
	movl %eax,(%esp)
	movl $30,4(%esp)
	movl $'C',8(%esp)
	movl %edx,12(%esp)
	call myprintf		

#######################################################
###########ADDITION####################################	
##############   1   #############################	
	#iRet = addition(2, 10, 20);	
	#myprintf("Addition is %d\n", iRet);	
	movl $2,(%esp)
	movl $10,4(%esp)
	movl $20,8(%esp)
	call addition

	movl %eax,-4(%esp)
	
	leal msg_main_print8,%ebx
	movl %ebx,(%esp)
	movl %eax,4(%esp)
	call myprintf	
	
##############   2   #############################	
	#iRet = addition(3, 10, 20, 30);
	#myprintf("Addition is %d\n", iRet);
	
	movl $3,(%esp)
	movl $10,4(%esp)
	movl $20,8(%esp)
	movl $30,12(%esp)
	call addition

	movl %eax,-4(%esp)

	leal msg_main_print8,%ebx
	movl %ebx,(%esp)
	movl %eax,4(%esp)
	call myprintf	

##############   3   #############################		
	#iRet = addition(4, 10, 20, 30, 40);
	#myprintf("Addition is %d\n", iRet);
	
	movl $4,(%esp)
	movl $10,4(%esp)
	movl $20,8(%esp)
	movl $30,12(%esp)
	movl $40,16(%esp)
	call addition

	movl %eax,-4(%esp)

	leal msg_main_print8,%ebx
	movl %ebx,(%esp)
	movl %eax,4(%esp)
	call myprintf

	movl $0,(%esp)
	call exit

 
.globl myprintf
.type myprintf,@function
myprintf:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	movl $0,-8(%ebp)   #pptr = NULL
	
	leal 12(%ebp),%ebx  #pptr,pszFormat
	movl %ebx,-8(%ebp)	
	
	movl 8(%ebp),%eax    #address of pszformat(movl)
	leal 12(%ebp),%ebx   #address of pptr   	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call vprintf
	
	movl %eax,-4(%ebp)

	movl $0,-8(%ebp)   #va_end(pptr)

	#movl -4(%ebp),%eax  #lihil nhi tri chalel(optimise)

	movl %ebp,%esp
	popl %ebp
	ret
		
.globl addition
.type addition,@function
addition:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp
	
	movl $0,-12(%ebp)   #pptr = NULL

	leal 12(%ebp),%ebx  #pptr,pszFormat
	movl %ebx,-12(%ebp)
	
#for(iCounter = 0, iSum = 0; iCounter < iParamCount; iCounter+)	
        movl $0,-8(%ebp)
	movl $0,-4(%ebp)

	jmp label_condition
	
label_code:
	
	movl -12(%ebp),%eax  #pptr value
	movl (%eax),%eax
	movl -4(%ebp),%edx   #sum
	addl %edx,%eax
	movl %eax,-4(%ebp)  

	addl $4,-12(%ebp)			

	addl $1,-8(%ebp)

label_condition:
	movl -8(%ebp),%eax  #icounter
	movl 8(%ebp),%ecx   #iparametercount
	cmpl %ecx,%eax
	jl label_code
		
	movl $0,-8(%ebp)   #va_end(pptr)

	movl -4(%ebp),%eax	

	movl %ebp,%esp
	popl %ebp
	ret
