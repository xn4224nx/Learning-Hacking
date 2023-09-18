#include <stdio.h>

void bad_usage(char *user) {
    printf(user);
}

void good_usage(char *user) {
    printf("\nUsername is: %s\n", user);
}


int main(int argc, char **argv)
{
	if(argc != 2)
	    return -1;
	    
	bad_usage(argv[1]);
	good_usage(argv[1]);

	return 0;
}
