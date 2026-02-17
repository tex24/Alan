#include "shared_functions.h"

int main() {
  vector<vector<float>> A1 = {
      {3, 1, -1, 0}, {0, 7, -3, 0}, {0, -3, 9, -2}, {0, 0, 4, -10}};
  vector<vector<float>> A2 = {
      {2, 4, -2, 0}, {1, 3, 0, 1}, {3, -1, 1, 2}, {0, -1, 2, 1}};
  vector<vector<float>> pascal = creaPascal(10);
  vector<vector<float>> trid = creaTrid();

  cout << "Esercizio 1:" << endl;
  cout << "- Norma della matrice A1: \n  " << infNorma(A1) << endl;
  cout << "- Norma della matrice A2: \n  " << infNorma(A2) << endl;
  cout << "- Norma della matrice di Pascal: \n  " << infNorma(pascal) << endl;
  cout << "- Norma della matrice Tridiagonale: \n  " << infNorma(trid) << endl;

  return 0;
}