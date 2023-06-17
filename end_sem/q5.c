#include <stdio.h>

void rearrange(long int n, long int *arr);
// {
//     int i = 0;
//     int count_0 = 0;
//     while (i < n)
//     {
//         if (arr[i] == 0)
//         {
//             count_0++;
//         }
//         i++;
//     }
//     i = 0;
//     while (i < count_0)
//     {
//         arr[i] = 0;
//         i++;
//     }
//     while (i < n)
//     {
//         arr[i] = 1;
//         i++;
//     }
// }

int main()
{
    long int n;
    scanf("%ld", &n);
    long int a[n + 1];
    for (long int i = 0; i < n; i++)
    {
        scanf("%ld", &a[i]);
    }
    rearrange(n, a);
    for (long int i = 0; i < n; i++)
    {
        printf("%ld ", a[i]);
    }
}