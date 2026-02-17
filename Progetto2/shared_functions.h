#ifndef SHARED_FUNCTIONS_H
#define SHARED_FUNCTIONS_H

#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <math.h>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

void printMatrix(const vector<vector<float>> &x);
float infNorma(vector<vector<float>> x);
float binom(int n, int k);
vector<vector<float>> creaPascal(unsigned int x);
vector<vector<float>> creaTrid();
vector<vector<float>> mulMatrix(vector<vector<float>> A, vector<vector<float>> B);
vector<vector<float>> gauss(vector<vector<float>> &A, vector<vector<float>> &B);
vector<vector<float>> sost(vector<vector<float>> &A, vector<vector<float>> &B);
vector<vector<float>> deltaB(vector<vector<float>> B);
vector<vector<float>> sumVect(vector<vector<float>> X, vector<vector<float>> Y);

#endif