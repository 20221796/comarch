#include <stdio.h>

extern void max(long long int* lock, long long int* shvar, long long int array[], long long int size);
long long int lock, shvar;

int main() {
    long long int *lock_p = &lock;
    long long int *var_p = &shvar;

    long long int array[5] = {2, 23, 42, 51, 5};
    max(&lock, &shvar, array, 5);
    printf("MAX = %lld\n", shvar);
    
    printf("lock의 주소값 : %p \n",lock_p);
    printf("shvar의 주소값 : %p \n",var_p);
    printf("array의 주소값 : %p \n",array);
    
    return 0;
}