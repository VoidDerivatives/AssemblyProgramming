#include<stdio.h>
int Comparism(float,float);
int main(void)
{
	float fNo1,fNo2;
	int check;	
	
	printf("Enter two number:");
	scanf("%f%f",&fNo1,&fNo2);

	check = Comparism(fNo1,fNo2);
	
	if(check == 1)
		printf("Number1 is less than Number2");
	else if(check == -1)
		printf("Number1 is greater than Number2");
	else
		printf("Number1 and Number2 is Equal");

	return 0;
}$16
int Comparism(float fNo1,float fNo2)
{
	if(fNo1 < fNo2)
		return 1;
	else if(fNo1 > fNo2)
		return -1;
	else
		return 0; 

}
