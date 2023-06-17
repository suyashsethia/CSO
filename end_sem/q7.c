#include <stdio.h>

int maxsum(int N, int B, int array[]);
// {
//     long int i = 0;
//     long int j = N - B + 1;
//     long int ans = 0;
//     if (B == 1)
//     {
//         ans = array[0];
//         if (array[N - 1] > ans)
//         {
//             ans = array[N - 1];
//         }
//         return ans;
//     }
//     while (j <= N)
//     {
//         long int k = i;
//         long int f = j;
//         long int temp = 0;
//         while (k >= 0)
//         {
//             temp += array[k];
//             k--;
//         }
//         while (f < N)
//         {
//             temp += array[f];
//             f++;
//         }
//         if (temp > ans)
//         {
//             ans = temp;
//         }
//         i++;
//         j++;
//     }
//     return ans;
// }

int main()
{
    int N, B;
    scanf("%d %d", &N, &B);
    int array[N];
    for (int i = 0; i < N; i++)
    {
        scanf("%d", &array[i]);
    }

    int ans = maxsum(N, B, array);

    printf("%d\n", ans);

    return 0;
}