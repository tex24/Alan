#include <iostream>
#include <cmath>
using namespace std;

int main(int argc, char *argv[]){
	int d_d = 0, d_f = 0;

	while(powf(2, -d_f) + 1 > 1) d_f++;
	while(1 + pow(2, -d_d) > 1) d_d++;
	
	printf("Max d for double: %d;\nMax d for float: %d;\n", d_d, d_f);

	return 0;
}
