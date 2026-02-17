#include <iostream>
#include <cmath>
using namespace std;

int main(int argc, char *argv[]){
	int d_d = 0, d_f = 0;

	while(1 + powf(2, -d_f) > 1) d_f++;
	while(1 + pow(2, -d_d)  > 1) d_d++;

	const double eps_d = pow(2, -(d_d - 1));
	const float  eps_f = powf(2, -(d_f - 1));

	printf("Max d for double: %d, eps: %.15e;\nMax d for float: %d, eps: %.7e;\n",
		   d_d - 1, eps_d, d_f - 1, eps_f);

	return 0;
}
