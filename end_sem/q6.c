#include <stdio.h>

long int ans(long int m, long int n, long int *arr)

{
    long int answer = 0;
    long int i = 0;
    while (i < m * n)
    {

        if (arr[i] % 2 == 0)
        {
            if (arr[i] % 3 != 0)
            {
                answer += arr[i];
            }
        }
        i++;
    }

    return answer;
}

int main()
{
    long int m, n;
    scanf("%ld %ld", &m, &n);
    long int arr[m][n];
    for (long int i = 0; i < m; i++)
    {
        for (long int j = 0; j < n; j++)
        {
            scanf("%ld", &arr[i][j]);
        }
    }
    long int answer = ans(m, n, arr);
    printf("\n%ld", answer);
}