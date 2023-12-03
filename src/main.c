// 다음의 피보나치 수열 C코드를 LEGv8 어셈블리로 구현하고, 테스트 main() 프로그램도
// 만들어 f(10)의 값을 프린트하라.
#include <stdio.h>

long long int fib(long long int n) {
    printf("%lld\n",n);
    if (n==0)
        return 0;
    else if (n==1)
        return 1;
    else
        return fib(n-1) + fib(n-2);
}

// extern long long int fib(long long int n);
int main() {
    // long long int result;
    // result = 
    printf("fib = %lld\n", fib(4));
}