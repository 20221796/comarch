#include <stdio.h>

extern void copyarray(long arr1[], long arr2[], long n);

void printarr(long arr[], long n){
	for(long i = 0; i < n ; i++)
		printf("%ld ",arr[i]);
	printf("\n");
}

int main(){
	long arrOri[5] = {2,12,-1,10,7};
	long arrCpy[5] = {0, };
	long  num = 5;
	printf("Array Original :");
	printarr(arrOri,num);

	printf("Array Copy :");
	printarr(arrCpy,num);

	copyarray(arrOri, arrCpy, num);

	printf("Array Original :");
	printarr(arrOri,num);

	printf("Array Copy :");
	printarr(arrCpy,num);

	return 0;
}
