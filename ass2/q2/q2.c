#include <stdio.h>
 
#define int long long int

int binarySearch(int* arr, int l, int r, int x);
// {
//     if (r >= l) {
//         int mid = l + (r - l) / 2;
 
//         if (arr[mid] == x)
//             return mid;
 
//         if (arr[mid] > x)
//             return binarySearch(arr, l, mid - 1, x);
 
//         return binarySearch(arr, mid + 1, r, x);
//     }
 
//     return -1;
// }

signed main()
{
    int n;
    scanf("%lld",&n);
    int arr[n];
    for(int i=0;i<n;i++) scanf("%lld",&arr[i]);
    int x;
    scanf("%lld",&x);
    int result = binarySearch(arr, 0, n-1, x);
    printf("%lld\n",result);
    return 0;
}