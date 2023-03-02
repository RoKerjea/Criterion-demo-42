#include <criterion.h>

int	ft_machin(int i)
{
	if (i)
		return (i);
	return (3);
}

Test(machin, machin0)
{
	cr_expect(ft_machin(0) == 3);
}

Test(machin, machin1)
{
	cr_expect(ft_machin(3) == 3);
}

Test(machin, machin2)
{
	cr_expect(ft_machin(5) == 5);
}