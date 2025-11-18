#include <iostream>
#include <cmath>
using namespace std;

double erroreAssoluto(double y, double tildeY){
    return tildeY - y;
}

double erroreRelativo(double y, double tildeY){
    return erroreAssoluto(y, tildeY) / y;
}

double fattoriale(int x)
{
    double ris = 1;
    for (int i = 2; i <= x; i++)
    {
        ris *= i;
    }
    return ris;
}

double fN(double x, int N)
{
    double ris = 0;
    for (int n = 0; n < N; n++)
    {
        ris += pow(x, n) / fattoriale(n);
    }
    return ris;
}

void printExpAndTaylorAlgOne(double exponent, int *n, size_t len){
    double y, tildeY;
    for (size_t i = 0; i < len; i++)
    {
        y = exp(exponent);
        tildeY = fN(exponent, n[i]);
        cout << tildeY << " " << y << endl;
        cout << "Errore assoluto: " << erroreAssoluto(y, tildeY) << endl;
        cout << "Errore relativo: " << erroreRelativo(y, tildeY) << endl;
    }
    cout << endl;
}

void printExpAndTaylorAlgTwo(double exponent, int *n, size_t len){
    double y, tildeY;
    if(exponent >= 0)
        for (size_t i = 0; i < len; i++)
        {
            y = exp(exponent);
            tildeY = fN(exponent, n[i]);
            cout << tildeY << " " << y << endl;
            cout << "Errore assoluto: " << erroreAssoluto(y, tildeY) << endl;
            cout << "Errore relativo: " << erroreRelativo(y, tildeY) << endl;
        }
    else 
        for (size_t i = 0; i < len; i++)
        {
            y = exp(-exponent);
            tildeY = fN(-exponent, n[i]);
            cout << tildeY << " " << y << endl;
            cout << "Errore assoluto: " << erroreAssoluto(y, tildeY) << endl;
            cout << "Errore relativo: " << erroreRelativo(y, tildeY) << endl;
        }
    cout << endl;
}

int main()
{
    int N_values[] = {3, 10, 50, 100, 150};
    size_t length_N = 5;

    double tests[] = {0.5, 30, -0.5, -30};
    size_t length_tests = 4;

    cout << "ALGORITMO N. 1" << endl << endl;

    for(size_t i = 0; i < length_tests; i ++){
        cout << "Exponent = " << tests[i] << endl;
        printExpAndTaylorAlgOne(tests[i], N_values, length_N);
    }

    cout << "ALGORITMO N. 2" << endl << endl;

    for(size_t i = 0; i < length_tests; i ++){
        cout << "Exponent = " << tests[i] << endl;
        printExpAndTaylorAlgTwo(tests[i], N_values, length_N);
    }

    return 0;
}