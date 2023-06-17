#include <stdio.h>
void waveSort(long int arr[], long int n) ;
// {
//     long int i = 0;

//     while (i < n)
//     {
//         if (i > 0 && arr[i] < arr[i - 1]) 
//         {
//             long int temp = arr[i];
//             arr[i] = arr[i - 1];
//             arr[i - 1] = temp;
//         }
//         if (i < n -1 && arr[i] < arr[i + 1])
//         {
//             long int temp = arr[i];
//             arr[i] = arr[i + 1];
//             arr[i + 1] = temp;
//         }
//         i += 2;
//     }
// }

int main()
{
    long int n;
    printf("Enter the size of the array: ");
    scanf("%ld", &n);

    long int arr[n];
    printf("Enter the elements of the array: ");
    for (long int i = 0; i < n; i++)
    {
        scanf("%ld", &arr[i]);
    }

    waveSort(arr, n);

    printf("Wave-like array: ");
    for (long int i = 0; i < n; i++)
    {
        printf("%ld ", arr[i]);
    }
    printf("\n");

    return 0;
}
