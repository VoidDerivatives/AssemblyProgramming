#include<iostream>
#include<cstdlib>
using namespace std;

int g_ino1;
int g_ino2;
int g_ans;

int main(void)
{
	cout<<"Enter two numbers:\t";
	cin>>g_ino1>>g_ino2;

	asm(
		"pusha\n\t"
		"movl g_ino1 ,%eax\n\t"
		"movl g_ino2 ,%edx\n\t"
		"addl %eax, %edx\n\t"
		"movl %edx, g_ans\n\t"
		"popa\n\t"
	);

	 cout<<"Answer is :\t"<<g_ans<<endl;
	
	return 0;
}
