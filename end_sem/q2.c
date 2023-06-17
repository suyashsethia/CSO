#include <stdio.h>
void arrayfunc(int n, int *arr);
// {
//     int i = 0;
//     int *ptr = arr;

//     while (i < n)
//     {

//         if ((i + 1) % 15 == 0)
//         {
//             *ptr = -3;
//         }
//         else if ((i + 1) % 3 == 0)
//         {
//             *ptr = -1;
//         }
//         else if ((i + 1) % 5 == 0)
//         {
//             *ptr = -2;
//         }
//         else
//         {
//             *ptr = i + 1;
//         }
//         i++;
//         ptr++;
//     }
// }
int main()
{
    int n;
    scanf("%d", &n);
    int arr[n];
    // for (int i = 0; i < n; i++)
    // {
    //     scanf("%d", &arr[i]);
    // }
    arrayfunc(n, arr);

    for (int i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
    return 0;
}