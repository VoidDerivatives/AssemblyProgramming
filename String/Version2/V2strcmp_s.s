.section .rodata
	msg_main_print1:
	.string "1]enter string 1(limit<20):\t"

	msg_main_print2:
	.string "\n2]enter string 2(limit<20):\t"

	msg_main_print3:
	.string "\nresult:\n\n* both string are equal"

	msg_main_print4:
	.string "\nresult:\n\n* both string are diffrent"

	msg_main_print5:
	.string "difference : %d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $48,%esp

	#string1
	movl $msg_main_print1,(%esp)
	call printf

	leal -20(%ebp),%ebx
	movl %ebx,(%esp)
	call gets

	#string2
	movl $msg_main_print2,(%esp)
	call printf

	leal -40(%ebp),%ebx
	movl %ebx,(%esp)
	call gets

	leal -20(%ebp),%eax
	leal -40(%ebp),%ebx
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call Mystrcmp		

	cmpl $0,%eax
	jne label_cond_false
	
	movl $msg_main_print3,(%esp)
	call printf

	jmp label_main_end
	
label_cond_false:

	movl $msg_main_print4,(%esp)
	call printf

label_main_end:
		
	movl $0,(%esp)
	call exit

.globl Mystrcmp
.type Mystrcmp,@function
Mystrcmp:
	pushl %ebp
	movl %esp,%ebp
	
	subl $16,%esp

	movl 8(%ebp),%esi
	movl 12(%ebp),%edi

	movl %esi,(%esp)   #1st
	call Mystrlen
	movl %eax,-4(%ebp)  #backup
		
	movl %edi,(%esp)  #2nd 
	call Mystrlen

	movl -4(%ebp),%ebx
	cmpl %eax,%ebx
	jg label_if_greater

	movl %eax,%ecx
	jmp label_if_end

label_if_greater:
	movl %ebx,%ecx

label_if_end:
	repe cmpsb
	je lable_rep_equal

	dec %esi	
	movb (%esi),%al

	dec %edi
	movb (%edi),%bl

	subb %bl,%al
	
	movsx %al,%eax 

	movl $msg_main_print5,(%esp)
	movl %eax,4(%esp)
	call printf

	jmp label_exit		
			
lable_rep_equal:
	movl $0,%eax

label_exit:
	movl %ebp,%esp
	popl %ebp
	ret
