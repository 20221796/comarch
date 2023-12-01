#include <stdio.h>
extern long long int fib(long long int n);

int main() {
    printf("fib = %lld\n", fib(10));
    return 0;
}