int main()
{
	int n = 100;

	int type = n%2;

	int flag = 0;

	for (int i = 2; i < n/2; ++i)
	{
		if(!(n%i))
		{
			flag = 1;
		}
	}

	if(flag)
		type = 2;

	switch(type)
	{
		case 0:
		{
			n++;
			break;
		}

		case 1:
		{
			int k = n+2;

			while(1)
			{
				int flag = 0;

				for (int i = 2; i < n/2; ++i)
				{
					if(!(k%i))
					{
						flag = 1;
					}
				}

				if(!flag)
				{
					n = k;
					break;
				}

				k += 2;	
			}
		}

		case 2:
		{
			n++;
			break;
		}
	}
}