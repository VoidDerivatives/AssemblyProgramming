//Addition	
#include<stdio.h>
#include<stdlib.h>
int addition(int,int);
int main(void)
{
	int i;
	int j;
	int ans;
		
	printf("Enter two number:\t");
	scanf("%d %d",&i,&j);

	ans = addition(i,j);	
	printf("Addition is : %d",ans);
	
	exit(0);
}
int addition(int i,int j)
{
	return i+j;
}
