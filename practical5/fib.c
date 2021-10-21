#include <stdio.h>
#include <stdlib.h>


void fibo(int *a, int *b);


int main() {

    int n;
    printf("Enter a positive integer for n: \n");
    scanf("%d", &n);


    if (n < 1) {
       printf("Number less than 1\n");
       exit(1);
    }

    int n1 = 0;
    int n2 = 1;

    printf("The Fibonacci sequence is: \n");
    printf("%d, ", n1);

    int i;
    for (i = 1; i < n-1; i++) {
       fibo(&n1, &n2);
       printf("%d, ", n1);
    }

    fibo(&n1, &n2);
    printf("%d\n", n1);

    return 0;
} 


void fibo(int *a, int *b) {

   int next;
   next = *a + *b;
   *a = *b;
   *b = next;
}
