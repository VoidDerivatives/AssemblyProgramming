#include<unistd.h>
#include<fcntl.h>
#include<stdlib.h>

#define MAX 256

int main(void)
{
	int fd;          // Fild descriptor
	char Buffer[MAX];  // Buffer
	int ReadCount ;

	fd = open("print_characters.txt",O_RDONLY);

	if(fd == -1)
	{
		write(1,"\n Cant open File",sizeof("\n Cant open File"));
		exit(-1);
	}
	
	// data can be exceed 256 that is loop important
	while((ReadCount = read(fd,Buffer,MAX)) > 0)     
		write(1,Buffer,ReadCount);

	close(fd);				

	exit(0);
}
