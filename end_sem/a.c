#include <stdio.h>

long int ans(long int x)
{
    long int ans = 0;
    while (x > 0)
    {
        if (x % 2 == 1)
        {
            ans++;
        }
        x /= 2;
    }
    return ans ;
}

int main()
{
    long int x;
    scanf("%ld", &x);
    long answ = ans(x);
    printf("%ld", answ);
}