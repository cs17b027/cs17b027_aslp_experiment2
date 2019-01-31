int main()
{
	int a[50];
	int i = 3;
	int k = 0;

	while(i < 100)
	{
		int flag = 0;
		for(int j = 2 ; j < i/2 ; ++j)
		{
			if (!(i%j))
			{
				flag = 1;
			}
		}

		if(flag)
			a[k++] = i;

		i++;
	}
}