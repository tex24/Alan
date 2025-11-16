#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <math.h>
#include <vector>

using namespace std;

void printMatrix(const vector<vector<float>> &x) {
  for (auto &row : x) {
    for (float v : row) {
      std::ostringstream oss;
      oss << std::fixed << std::setprecision(2) << v;
      std::string s = oss.str();
      if (v >= 0)
        s = " " + s;
      cout << std::setw(8) << s << " ";
    }
    cout << endl;
  }
}

float infNorma(vector<vector<float>> x) {
  float res = 0;

  for (unsigned int i = 0; i < x.size(); i++) {
    float tmp = 0;
    for (unsigned int j = 0; j < x[i].size(); j++) {
      tmp += abs(x[i][j]);
    }
    if (tmp > res)
      res = tmp;
  }

  return res;
}

float fact(float n) { return (n <= 1) ? 1 : n * fact(n - 1); }

vector<vector<float>> creaPascal(unsigned int x) {
  vector<vector<float>> res;
  for (unsigned int i = 1; i <= x; i++) {
    res.push_back(vector<float>());
    for (unsigned int j = 1; j <= x; j++) {
      res[i - 1].push_back(fact(i + j - 2) / (fact(i - 1) * fact(j - 1)));
    }
  }

  return res;
}

vector<vector<float>> creaTrid() {
  vector<vector<float>> res;

  unsigned int d0 = 7, d1 = 0;
  unsigned int n = 10 * (d1 + 1) + d0;

  for (unsigned int i = 1; i <= n; i++) {
    res.push_back(vector<float>());
    for (unsigned int j = 1; j <= n; j++) {
      if (i == j)
        res[i - 1].push_back(2);
      else if (abs(int(i) - int(j)) == 1)
        res[i - 1].push_back(-1);
      else
        res[i - 1].push_back(0);
    }
  }

  return res;
}

vector<vector<float>> mulMatrix(vector<vector<float>> A,
                                vector<vector<float>> B) {
  vector<vector<float>> res;
  unsigned int n = A[0].size(), m = A.size(), p = B[0].size();

  for (unsigned int i = 0; i < m; i++) {
    res.push_back(vector<float>());
    for (unsigned int k = 0; k < p; k++) {
      res[i].push_back(0);
      for (unsigned int j = 0; j < n; j++)
        res[i][k] += A[i][j] * B[j][k];
    }
  }

  return res;
}

vector<vector<float>> gauss(vector<vector<float>> A, vector<vector<float>> B) {
  float m;
  int offset = 0;
  for (unsigned int k = 0; k < A.size(); k++) {

    float aux = A[k][k];
    for (unsigned int i = (k + 1); i < A[0].size(); i++) {
      if (abs(A[i][k + offset]) > abs(aux)) {
        vector<float> tmp = A[i];
        A[i] = A[k];
        A[k] = tmp;
        aux = A[k][k];
      }
    }

    if (A[k][k] == 0) {
    	offset++;
	if(offset + k > A[0].size()){
		return A;
	}
	k--; //controllo sulla stessa riga (dato che k + 1 - 1 = k) su colonna k + offset
	continue;
    }

    for (unsigned int i = (k + 1); i < A[0].size(); i++) {
      m = (A[i][k + offset] / A[k][k + offset]);
      B[i][0] -= (m * B[k + offset][0]);
      for (unsigned int j = k + offset; j < A.size(); j++) {
        A[i][j] -= (m * A[k][j]);
      }
    }
  }

  return A;
}

vector<vector<float>> sost(vector<vector<float>> A, vector<vector<float>> B) {

  for (int i = A[0].size() - 1; i >= 0; i--) {
  }
}

int main(int argc, char *argv[]) {
  vector<vector<float>> A1 = {
      {3, 1, -1, 0}, {0, 7, -3, 0}, {0, -3, 9, -2}, {0, 0, 4, -10}};
  vector<vector<float>> A2 = {
      {2, 4, -2, 0}, {1, 3, 0, 1}, {3, -1, 1, 2}, {0, -1, 2, 1}};

  cout << "Esercizio 1:" << endl;
  cout << "- Norma della matrice A1: \n  " << infNorma(A1) << endl;
  cout << "- Norma della matrice A2: \n  " << infNorma(A2) << endl;
  cout << "- Norma della matrice di Pascal: \n  " << infNorma(creaPascal(10))
       << endl;
  cout << "- Norma della matrice Tridiagonale: \n  " << infNorma(creaTrid())
       << endl;

  vector<vector<float>> X1 = {{1}, {1}, {1}, {1}};
  vector<vector<float>> X2 = {{1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}};
  vector<vector<float>> X3 = {{1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1},
                              {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}};

  cout << endl << "Esercizio 2:" << endl;
  cout << "- La matrice A e' stata creata \n";
  cout << "- Termine noto di A1 e X: \n";
  vector<vector<float>> B1 = mulMatrix(A1, X1);
  printMatrix(B1);
  cout << "- Termine noto di A2 e X: \n";
  vector<vector<float>> B2 = mulMatrix(A2, X1);
  printMatrix(B2);
  cout << "- Termine noto della matrice di Pascal e X: \n";
  vector<vector<float>> B3 = mulMatrix(creaPascal(10), X2);
  printMatrix(B3);
  cout << "- Termine noto della matrice tridiagonale e X: \n";
  vector<vector<float>> B4 = mulMatrix(creaTrid(), X3);
  printMatrix(B4);

  cout << "- Gauss A1:\n";
  printMatrix(gauss(A1, X1));
  cout << "- Gauss A2:\n";
  printMatrix(gauss(A2, X1));
  cout << "- Gauss Pascal:\n";
  printMatrix(gauss(creaPascal(10), X2));
  cout << "- Gauss Tridiagonale:\n";
  printMatrix(gauss(creaTrid(), X3));
  cout << "- Gauss Matrice non invertibile: \n";
  printMatrix(gauss({
 	{1, 2, 3, 4},
 	{1, 2, 3, 4},
 	{0, 1, 0, 1},
 	{2, 0, 1, 0}}, X1));

  return 0;
}
