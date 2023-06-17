#include <stdio.h>

void height(long int *arr, long int n);
// {
//     // bubble sort
//     for (long int i = 0; i <  n - 1; i++)
//     {
//         for (long int j = 0; j <  n - i - 1; j++)
//         {
//             if (arr[j] > arr[j + 1])
//             {
//                 temp = arr[j + 1];
//                 arr[j + 1] = arr[j];
//                 arr[j] = temp;
//             }
//         }
//     }

//     int ans = 1;
//     long i = 0;
//     while (i < n)
//     {
//         if (arr[n + i] - arr[i] < x)
//         {
//             ans = 0;
//             return ans;
//         }
//         i++;
//     }
//     return ans;
// }
int main()
{
    long int n, x;
    scanf("%ld", &n);
    long int arr[(n) + 1];
    for (long i = 0; i <  n; i++)
    {
        scanf("%ld", &arr[i]);
    }
    height(arr ,n) ;
    // if (height(arr ,n, x))
    // {
    //     printf("YES\n");
    // }
    // else
    // {
    //     printf("NO\n");
    // }
        for (long i = 0; i < n; i++)
    {
        printf("%ld ", arr[i]);
    }
}