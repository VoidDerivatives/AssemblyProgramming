#include<unistd.h>
#include<fcntl.h>
#include<stdlib.h>

#define MAX 256
int main(void)
{
	int fd1,fd2;          // 2 File descriptor
	char Buffer[MAX];  
	int ReadCount ;

	fd1 = open("file_copy_source.txt",O_RDONLY);

	if(fd1 == -1)
	{
		write(1,"\nCant Open Source File",sizeof("\nCant Open Source File"));
		exit(0);
	}

	fd2 = open("file_copy_destination.txt",O_CREAT | O_WRONLY | O_TRUNC);

	if(fd2 == -1)
	{
		write(1,"\nCant Open destination File\n",sizeof("\nCant Open destination File\n"));
		close(fd1);
		
		exit(-1);
	}
	
	while((ReadCount = read(fd1,Buffer,MAX)) > 0)     
		write(fd2,Buffer,ReadCount);

	close(fd1);
	close(fd2);					

	exit(0);
}
