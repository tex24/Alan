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

  cout << "Esercizio 2:" << endl;
  cout << "- La matrice A e' stata creata \n";
  cout << "- Termine noto di A1 e X: \n";
  vector<vector<float>> B1 = mulMatrix(A1, X1);
  printMatrix(B1);
  cout << "- Termine noto di A2 e X: \n";
  vector<vector<float>> B2 = mulMatrix(A2, X1);
  printMatrix(B2);
  cout << "- Termine noto della matrice di Pascal e X: \n";
  vector<vector<float>> B3 = mulMatrix(pascal, X2);
  printMatrix(B3);
  cout << "- Termine noto della matrice tridiagonale e X: \n";
  vector<vector<float>> B4 = mulMatrix(trid, X3);
  printMatrix(B4);

  cout << "Matrice A1 prima di gauss" << endl;
  printMatrix(A1);
  cout << "Matrice A2 prima di gauss" << endl;
  printMatrix(A2);
  cout << "- Gauss A1:\n";
  printMatrix(gauss(A1, B1));
  cout << "  Con x:\n";
  printMatrix(sost(A1, B1));
  cout << "- Gauss A2:\n";
  printMatrix(gauss(A2, B2));
  cout << "  Con x:\n";
  printMatrix(sost(A2, B2));
  cout << "- Gauss Pascal:\n";
  printMatrix(gauss(pascal, B3));
  cout << "  Con x:\n";
  printMatrix(sost(pascal, B3));
  cout << "- Gauss Tridiagonale:\n";
  printMatrix(gauss(trid, B4));
  cout << "  Con x:\n";
  printMatrix(sost(trid, B4));

  return 0;
}