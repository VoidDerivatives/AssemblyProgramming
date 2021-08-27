
.section .rodata
	msg_main_print1:
	.string "Enter obj1 values,\n"
	
	msg_main_print2:
	.string "Enter chchar\t:"

	msg_main_scan1:
	.string "%c"
	
	msg_main_print3:
	.string "Enter ino1\t:"

	msg_main_scan2:
	.string "%d"
	
	msg_main_print4:
	.string "Enter shiNO\t:"
	
	msg_main_scan3:
	.string "%hd"

	msg_main_print5:
	.string "Enter the obj2 values,\n"

	msg_main_print6:
	.string "Enter chchar\t:"
	
	msg_main_scan4:
	.string "%c%c"

	msg_main_print7:
	.string "Enter ino1\t:"

	msg_main_scan5:
	.string "%c%d"
	
	msg_main_print8:
	.string "Enter shiNO\t:"
	
	msg_main_scan6:
	.string "%c%hd"

	msg_main_print9:
	.string "obj1 is \n"

	msg_main_print10:
	.string "chchar = %c ,ino = %d,shino = %hd \n"

	msg_main_print11:
	.string "obj2 is \n"

	msg_main_print12:
	.string "chchar = %c ,ino = %d,shino = %hd \n"

.section .bss
	.comm obj1,12,4

.section .text
.globl main
.type main,@function 
main:
	pushl %ebp
	movl %esp,%ebp

	subl $13,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp
	
	#obj1 values accpect from user
 
	pushl $msg_main_print2
	call printf
	addl $4,%esp

	movl $obj1,%ebx
	pushl %ebx
	pushl $msg_main_scan1
	call scanf
	addl $8,%esp

	pushl $msg_main_print3
	call printf
	addl $4,%esp

	movl $obj1,%ebx
	leal 4(%ebx),%edx    #address
	pushl %edx
	pushl $msg_main_scan2
	call scanf
	addl $8,%esp

	pushl $msg_main_print4
	call printf
	addl $4,%esp	

	movl $obj1,%ebx
	leal 8(%ebx),%edx
	pushl %edx
	pushl $msg_main_scan3
	call scanf
	addl $8,%esp		

	#obj2 values accpect from user

	pushl $msg_main_print5
	call printf
	addl $4,%esp

	pushl $msg_main_print6
	call printf
	addl $4,%esp
	
	leal -12(%ebp),%ebx  #base add of char
	leal -13(%ebp),%edx #instead of flushall ,using char variable
	pushl %ebx
	pushl %edx
	pushl $msg_main_scan4
	call scanf
	addl $12,%esp

	pushl $msg_main_print7
	call printf
	addl $4,%esp			
	
	leal -8(%ebp),%ebx
	leal -13(%ebp),%edx
	pushl %ebx
	pushl %edx
	pushl $msg_main_scan5
	call scanf
	addl $12,%esp

	pushl $msg_main_print8
	call printf
	addl $4,%esp
	
	leal -4(%ebp),%ebx
	leal -13(%ebp),%edx
	pushl %ebx
	pushl %edx
	pushl $msg_main_scan6	
	call scanf
	addl $12,%esp


	#printing obj1
	pushl $msg_main_print9
	call printf
	addl $4,%esp

	movl $obj1,%ebx
	xorl %eax,%eax
	movb (%ebx),%al
	movl 4(%ebx),%edx
	xorl %ecx,%ecx
	movw 8(%ebx),%cx
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_print10
	call printf
	addl $16,%esp

	#printing obj2

	pushl $msg_main_print11
	call printf
	addl $4,%esp

	xorl %ebx,%ebx
	leal -12(%ebp),%ebx
	xorl %eax,%eax
	movb (%ebx),%al
	movl 4(%ebx),%edx
	xorl %ecx,%ecx
	movw 8(%ebx),%cx
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $msg_main_print12
	call printf
	addl $16,%esp

	pushl $0
	call exit 

