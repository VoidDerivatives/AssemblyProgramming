#include <stdio.h>
#include <stdlib.h>

int main(int argc,char *argv[], char *envp[])
{
	int iCounter;

	puts("Envp values are:");
	for(iCounter = 0; envp[iCounter] != NULL; iCounter++)
		puts(envp[iCounter]);

	exit(0);
}

