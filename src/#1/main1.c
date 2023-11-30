extern void max(long long int* shvar, long long int array[], long long int size);
long long int shvar;

main() {
    long long int array[5] = {2, 23, 42, 51, 5};
    max(&shvar, array, 5);
    printf("MAX = %lld\n", shvar);
}