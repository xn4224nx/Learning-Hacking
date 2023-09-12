#include <stdio.h>

int convert(char *number) {

    int converted_num = atoi(number);
    return converted_num;
}

int main(int argc, char **argv) {
	
	int i, sum = 0;
	
	for(i=0; i< argc; ++i) {
	    sum += convert(argv[i]);
	}
	
	printf("sum = %d\n", sum);
	
	return 0;
}

