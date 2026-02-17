#include "shared_functions.h"

int main() {
  vector<vector<float>> A1 = {
      {3, 1, -1, 0}, {0, 7, -3, 0}, {0, -3, 9, -2}, {0, 0, 4, -10}};
  vector<vector<float>> A2 = {
      {2, 4, -2, 0}, {1, 3, 0, 1}, {3, -1, 1, 2}, {0, -1, 2, 1}};
  vector<vector<float>> pascal = creaPascal(10);
  vector<vector<float>> trid = creaTrid();

  vector<vector<float>> X1 = {{1}, {1}, {1}, {1}};
  vector<vector<float>> X2 = {{1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}};
  vector<vector<float>> X3 = {{1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1},
                              {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}};

  vector<vector<float>> B1 = mulMatrix(A1, X1);
  vector<vector<float>> B2 = mulMatrix(A2, X1);
  vector<vector<float>> B3 = mulMatrix(pascal, X2);
  vector<vector<float>> B4 = mulMatrix(trid, X3);

  cout << "Esercizio 3:\n";

  vector<vector<float>> B1Tilde = sumVect(B1, deltaB(B1));
  vector<vector<float>> B2Tilde = sumVect(B2, deltaB(B2));
  vector<vector<float>> B3Tilde = sumVect(B3, deltaB(B3));
  vector<vector<float>> B4Tilde = sumVect(B4, deltaB(B4));

  A1 = {{3, 1, -1, 0}, {0, 7, -3, 0}, {0, -3, 9, -2}, {0, 0, 4, -10}};
  A2 = {{2, 4, -2, 0}, {1, 3, 0, 1}, {3, -1, 1, 2}, {0, -1, 2, 1}};
  pascal = creaPascal(10);
  trid = creaTrid();

  cout << "- x di A1 con B1Tilde:\n";
  gauss(A1, B1Tilde);
  printMatrix(sost(A1, B1Tilde));
  cout << "- x di A2 con B2Tilde:\n";
  gauss(A2, B2Tilde);
  printMatrix(sost(A2, B2Tilde));
  cout << "- x della matrice di Pascal con B3Tilde:\n";
  gauss(pascal, B3Tilde);
  printMatrix(sost(pascal, B3Tilde));
  cout << "- x della matrice tridiagonale con B4Tilde:\n";
  gauss(trid, B4Tilde);
  printMatrix(sost(trid, B4Tilde));

  return 0;
}