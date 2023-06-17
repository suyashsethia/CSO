void selection_sort(int *arr, int n)
{
    int min_index ; int i ;int j;
    for (i = 0; i < n - 1; i++)
    {
        min_index = i;
        for ( j = i + 1; j < n; j++)
        {
            if(arr[j]<arr[min_index])
            {
                min_index = j;
            }
            
        }
        swap(min_index , i );
    }
}