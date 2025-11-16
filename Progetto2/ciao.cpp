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
      cout << std::setw(9) << s << " ";
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

vector<vector<float>> gauss(vector<vector<float>> &A,
                            vector<vector<float>> &B) {
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

vector<vector<float>> sost(vector<vector<float>> &A, vector<vector<float>> &B) {
  vector<vector<float>> x;
  // inizializzo il vettore x
  for (unsigned int i = 0; i < A.size(); i++)
    x.push_back(vector<float>());
  int n = A.size() - 1; // variabile per l ultima pos
  for (int i = n; i >= 0; i--) {
    float sum = 0;
    for (int j = i + 1; j <= n; j++) {
      sum += A[i][j] * x[j][0];
    }
    x[i].push_back((B[i][0] - sum) / A[i][i]);
  }
  return x;
}

vector<vector<float>> deltaB(vector<vector<float>> B) {
  vector<vector<float>> ris;
  float valNeg = static_cast<float>(-0.01) * infNorma(B); // neg di negativo
  float valPos = static_cast<float>(0.01) * infNorma(B);
  for (unsigned int i = 0; i < B.size(); i++) {
    i % 2 == 0 ? ris.push_back({valNeg}) : ris.push_back({valPos});
  }
  return ris;
}

vector<vector<float>> sumVect(vector<vector<float>> X,
                              vector<vector<float>> Y) {
  if (X.size() != Y.size()) {
    // TODO
  }
  vector<vector<float>> ris;
  for (unsigned int i = 0; i < X.size(); i++) {
    ris.push_back({X[i][0] + Y[i][0]});
  }
  return ris;
}

int main(int argc, char *argv[]) {
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
  vector<vector<float>> B3 = mulMatrix(pascal, X2);
  printMatrix(B3);
  cout << "- Termine noto della matrice tridiagonale e X: \n";
  vector<vector<float>> B4 = mulMatrix(trid, X3);
  printMatrix(B4);

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

  cout << "\nEsercizio 3:\n";

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
  cout << "- x della matrice di Pascal con B1Tilde:\n";
  gauss(pascal, B3Tilde);
  printMatrix(sost(pascal, B3Tilde));
  cout << "- x della matrice tridiagonale con B4Tilde:\n";
  gauss(trid, B4Tilde);
  printMatrix(sost(trid, B4Tilde));

  return 0;
}
