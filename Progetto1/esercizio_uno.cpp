#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    double d0 = 3;
    double d1 = 6;
    double a, b, c;
    for (int i = 0; i < 7; i++)
    {
        a = (d0 + 1) * pow(10, i);
        b = (d1 + 1) * pow(10, 20);
        c = -b;
        cout << "i = " << i << endl;
        cout << "(a + b) + c = " << (a + b) + c << endl;
        cout << "a + (b + c) = " << a + (b + c) << endl << endl;
    }
}
