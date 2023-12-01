#include <stdio.h>
extern long long int isEven(long long int num);

int main()
{
    long long int num, result;

    num = 10;
    printf("Input a number: %lld\n", num);
    result = isEven(num);
    printf("Number of 1s in %lld is %s\n", num, result ? "Even" : "Odd");
    num = 100;
    printf("Input a number: %lld\n", num);
    result = isEven(num);
    printf("Number of 1s in %lld is %s\n", num, result ? "Even" : "Odd");

    return 0;
}