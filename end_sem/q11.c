#include <stdio.h>
void swapper(long int *arr, long int n);
// {
//     long int i = 0;
//     long int odd_count = 0;
//     while (i < n)
//     {
//         if (arr[i] % 2 == 1)
//         {
//             odd_count++;
//         }
//         i++;
//     }
//     if (odd_count == 0)
//     {
//         return;
//     }
//     if (odd_count == n)
//     {
//         return;
//     }
//     long int i = 0 ;
//     for (i = 0; i < n - 1; i++)
//     {
//         // Last i elements are already in place, so we can ignore them
//         for (long int j = 0; j < n - i - 1; j++)
//         {
//             // Swap adjacent elements if they are in the wrong order
//             if (arr[j] > arr[j + 1])
//             {
//                 long int temp = arr[j];
//                 arr[j] = arr[j + 1];
//                 arr[j + 1] = temp;
//             }
//         }
//     }
// }
int main()
{
    long int n;
    scanf("%ld", &n);
    long int arr[n + 1];
    for (long int i = 0; i < n; i++)
    {
        scanf("%ld", &arr[i]);
    }
    swapper(arr, n);
    for (long int i = 0; i < n; i++)
    {
        printf("%ld ", arr[i]);
    }
}