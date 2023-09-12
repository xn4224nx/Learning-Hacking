#include <stdio.h>

int main(int argc, char **argv) {
    
    char buffer_2[4];
    char buffer_1[6] = "BBBBB";
    
    for(int i=0; i<10; ++i){
        
        buffer_1[i] = 'A';
    }
    
    printf("Buffer 1 = '%s'\nBuffer 2 = '%s'\n", buffer_1, buffer_2);
    
    return 0;
}
