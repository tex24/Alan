#include "shared_functions.h"

void printMatrix(const vector<vector<float>> &x) {
  for (auto &row : x) {
    for (float v : row) {
      ostringstream oss;
      oss << fixed << setprecision(2) << v;
      string s = oss.str();
      if (v >= 0)
        s = " " + s;
      cout << setw(9) << s << " ";
    }
    cout << endl;
  }
}

float infNorma(vector<vector<float>> x) {
  float res = 0;

  for (unsigned int i = 0; i < x.size(); i++) {
    float tmp = 0;
    for (unsigned int j = 0; j < x[i].size(); j++) {
      tmp += fabs(x[i][j]);
    }
    if (tmp > res)
      res = tmp;
  }

  return res;
}

float binom(int n, int k) {
  if (k > n - k) k = n - k;
  float res = 1;
  for (int i = 1; i <= k; i++) {
    res *= (n - (k - i));
    res /= i;
  }
  return res;
}

vector<vector<float>> creaPascal(unsigned int x) {
  vector<vector<float>> res;
  for (unsigned int i = 0; i < x; i++) {
    res.push_back(vector<float>());
    for (unsigned int j = 0; j < x; j++) {
      res[i].push_back(binom(i + j, i));
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
  vector<float> tmp;
  for (unsigned int k = 0; k < A.size(); k++) {

    float aux = fabs(A[k][k]);
    for (unsigned int i = (k + 1); i < A.size(); i++) {
      if (fabs(A[i][k]) > aux) {
        tmp = A[i];
        A[i] = A[k];
        A[k] = tmp;
        tmp = B[i];
        B[i] = B[k];
        B[k] = tmp;
        aux = fabs(A[k][k]);
      }
    }

    if (A[k][k] == 0) {
      cout << "MATRICE NON INVERTIBILE!" << endl;
      return A;
    }

    for (unsigned int i = (k + 1); i < A[0].size(); i++) {
      m = (A[i][k] / A[k][k]);
      B[i][0] -= (m * B[k][0]);
      A[i][k] = 0;
      for (unsigned int j = (k + 1); j < A.size(); j++) {
        A[i][j] -= (m * A[k][j]);
      }
    }
  }

  return A;
}

vector<vector<float>> sost(vector<vector<float>> &A, vector<vector<float>> &B) {
  vector<vector<float>> x;
  for (unsigned int i = 0; i < A.size(); i++)
    x.push_back(vector<float>());
  int n = A.size() - 1;
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
  float valNeg = static_cast<float>(-0.01) * infNorma(B);
  float valPos = static_cast<float>(0.01) * infNorma(B);
  for (unsigned int i = 0; i < B.size(); i++) {
    i % 2 == 0 ? ris.push_back({valNeg}) : ris.push_back({valPos});
  }
  return ris;
}

vector<vector<float>> sumVect(vector<vector<float>> X,
                              vector<vector<float>> Y) {
  if (X.size() != Y.size()) {
    throw "Dimensioni diverse!\n";
  }
  vector<vector<float>> ris;
  for (unsigned int i = 0; i < X.size(); i++) {
    ris.push_back({X[i][0] + Y[i][0]});
  }
  return ris;
}