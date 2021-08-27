#include<stdio.h>
#include<stdlib.h>

int g_ino1;
int g_ino2;
int g_ans;

int main(void)
{
	printf("Enter two numbers:\t");
	scanf("%d %d",&g_ino1,&g_ino2);

	asm(
		"pusha\n\t"
		"movl g_ino1 ,%eax\n\t"
		"movl g_ino2 ,%edx\n\t"
		"addl %eax, %edx\n\t"
		"movl %edx, g_ans\n\t"
		"popa\n\t"
	);

	printf("Answer is : %d",g_ans);

	exit(0);
}
