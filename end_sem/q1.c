#include <stdio.h>

int minimumBacteria(int x) ;
// {
//     int count = 0;

//     while (x > 0) {
//         if (x % 2 == 1) {
//             count++;
//         }
//         x /= 2;
//     }

//     return count;
// }

int main() {
    int x;
    printf("Enter the desired number of bacteria: ");
    scanf("%d", &x);

    int minimumCount = minimumBacteria(x);
    printf("Minimum number of bacteria to put in the box: %d\n", minimumCount);

    return 0;
}
