.section .rodata
	msg_main_print1:
	.string "Enter the obj2 values:\n"

	msg_main_print2:
	.string "Enter the chchar:\t"

	msg_main_print3:
	.string "Enter the iNo:\t\t"

	msg_main_print4:
	.string "Enter the shiNo:\t"

	msg_main_scan1:
	.string "%c"
	
	msg_main_scan2:
	.string "%d"
	
	msg_main_scan3:
	.string "%hd"

	msg_main_print5:
	.string "obj2 is \n"

	msg_main_print6:
	.string "chchar = %c ,iNo =%d,shiNo = %hd\n"

	msg_main_print7:
	.string "obj1 is:\n"

.section .bss
	.comm obj1,12,4

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $24,%esp

	#enter  obj2
	pushl $msg_main_print1
	call printf
	addl $4,%esp

	pushl $msg_main_print2
	call printf
	addl $4,%esp	

	leal -12(%ebp),%ebx
	pushl %ebx
	pushl $msg_main_scan1
	call scanf
	addl $8,%esp

	pushl $msg_main_print3
	call printf
	addl $4,%esp

	leal -8(%ebp),%ebx
	pushl %ebx
	pushl $msg_main_scan2
	call scanf
	addl $8,%esp

	pushl $msg_main_print4
	call printf
	addl $4,%esp
	
	leal -4(%ebp),%ebx
	pushl %ebx
	pushl $msg_main_scan3
	call scanf
	addl $8,%esp

	#print obj2
	pushl $msg_main_print5
	call printf
	addl $4,%esp

	xorl %eax,%eax
	movl -12(%ebp),%eax  #char
	movl -8(%ebp),%edx   #int
	xorl %ecx,%ecx
	movl -4(%ebp),%ecx   #short
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_print6
	call printf
	addl $16,%esp
	
	#assgn obj1 = obj2
	xorl %eax,%eax
	movl $obj1,%ebx  #address of obj1
	movl -12(%ebp),%eax
	movl %eax,(%ebx)	
	movl -8(%ebp),%eax
	movl %eax,4(%ebx)
	xorl %eax,%eax
	movl -4(%ebp),%eax
	movl %eax,8(%ebx)

	#assgn obj3 = obj2
	xorl %eax,%eax
	leal -24(%ebp),%ebx  #address of obj2
	movl -12(%ebp),%eax
	movl %eax,(%ebx)	
	movl -8(%ebp),%eax  #int
	movl %eax,4(%ebx)
	xorl %eax,%eax	
	movl -4(%ebp),%eax   #short
	movl %eax,8(%ebx)

	#print obj1
	pushl $msg_main_print7
	call printf
	addl $4,%esp

	movl $obj1,%ebx  
	xorl %eax,%eax
	xorl %ecx,%ecx
	movl (%ebx),%eax   #char
	movl 4(%ebx),%edx	#int
	movl 8(%ebx),%ecx    #short
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_print6
	call printf
	addl $16,%esp

	#print obj3
	pushl $msg_main_print7
	call printf
	addl $4,%esp

	leal -24(%ebp),%ebx
	xorl %eax,%eax
	xorl %ecx,%ecx
	movl (%ebx),%eax   #char
	movl 4(%ebx),%edx   #int	
	movl 8(%ebx),%ecx   #short
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_print6
	call printf
	addl $16,%esp

	pushl $0
	call exit


