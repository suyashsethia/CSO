#include <stdio.h>

int gcd(int N, int M);
//  {
//     if (M == 0) {
//         return N;
//     } else {
    
//         return gcd(M, N % M);
//     }
// }

int main() {
    int N, M;
    printf("Enter two integers: ");
    scanf("%d %d", &N, &M);

    int result = gcd(N, M);

    printf("GCD of %d and %d is %d\n", N, M, result);

    return 0;
}
