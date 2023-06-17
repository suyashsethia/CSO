#include <stdio.h>
#include <stdlib.h>

void array(int *array, int *output, int n)
{
    int sum = 0;
    for (int i = 0; i < n; i++)
    {
        if (array[i] == 0)
        {
            sum += i;
        }
        else
        {
            sum += n - i - 1;
        }
    }
    for (int i = 0; i < n; i++)
    {
        int max = 0;
        int max_i = -1;
        for (int j = 0; j < n; j++)
        {
            int ans = 0;
            if (array[j] == 0)
            {
                ans = n - 2 * j - 1;
            }
            else if (array[j] == 1)
            {
                ans = 2 * j - n + 1;
            }
            if (ans > max)
            {
                max = ans;
                max_i = j;
            }
        }
        if (max > 0 && array[max_i]==1 )
        {
            array[max_i] = 0;
            sum = sum + max;
        }
        else if (max>0&array[max_i]==0)
        {
            array[max_i] = 1;
            sum = sum + max;
        }
        output[i] = sum;
    }
}

int main()
{
    int n;
    scanf("%d", &n);

    int arr[n];
    int output_array[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &arr[i]);
    }

    array(arr, output_array, n);

    for (int i = 0; i < n; i++)
    {
        printf("%d ", output_array[i]);
    }

    return 0;
}