#include <stdio.h>

int main() {
    int num = 50;
    
    if(num == 10) {
        printf("The value of num is 10.\n");
    
     } else if(num == 20) {
        printf("The value of num is 20.\n");
    
    } else if(num == 30) {
        printf("The value of num is 30.\n");    
    
    } else {
        printf("No value is correct.\n");
    }
    
    printf("The exact value of num is: %d\n", num);
    
    return 0;
}
