#include<unistd.h>
#include<fcntl.h>
#include<stdlib.h>

#define MAX 256

int main(void)
{
	int fd;          // Fild descriptor
	char Buffer[MAX];  // Buffer
	int ReadCount ;

	// jeva keyboard var lihu teva teva file cha data truncate zala pahije mhun truncate 
	fd = open("keyboard_to_file.txt",O_CREAT | O_WRONLY | O_TRUNC); 

	if(fd == -1)
	{
		write(1,"\n Cant open File",sizeof("\n Cant open File"));
		exit(-1);
	}
	
	write(1,"\n To stop the process, please press the key (ctrl + D)",sizeof("\n To stop the process, please press the key (ctrl + D)"));
	write(1,"\nEnter strings:\n",sizeof("\nEnter strings:\n"));	
	
	while((ReadCount = read(1,Buffer,MAX)) > 0)
	{     
		write(fd,Buffer,ReadCount);
	}
	
	close(fd);				
	
	exit(0);
}
