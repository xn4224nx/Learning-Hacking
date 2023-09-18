#include <stdio.h>
#include <string.h>

int main(int argc, char **argv)
{   
    char fs[1024];
    
    if(argc != 2)
        return -1;

	strcpy(fs, argv[1]);
	
    printf("Your input is: ");
    printf(fs);
    printf("\n");	
	
	return 0;
}
