#include <stdio.h>

long int find_first_positive(long int *array, long int N);
// {
//     long int i = 0;
//     while (i < N)
//     {
//         long int j = 0;
//         while (j < N)
//         {
//             if (array[j] > array[i])
//             {
//                 long int temp = array[i];
//                 array[i] = array[j];
//                 array[j] = temp;
//             }
//             j++;
//         }
//         i++;
//     }
//     long int j = 1;
//     i = 0;
//     while (i < N)
//     {
//         if (array[i] < j)
//         {
//             i++;
//             continue;
//         }
//         if (array[i] == j)
//         {
//             j++;
//             i++;
//         }
//         if (array[i] != j)
//         {
//             return j;
//         }
//     }
//     return j;
// }

int main()
{
    long int N;
    scanf("%ld", &N);
    long int array[N];
    for (long int i = 0; i < N; i++)
    {
        scanf("%ld", &array[i]);
    }
    int ans = find_first_positive(array, N);
    printf("%d\n", ans);
    for (int i = 0; i < N; i++)
    {
        printf("%ld", array[i]);
    }

    return 0;
}