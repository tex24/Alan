%% ESERCITAZIONE 1
% Matricola = s5798607

% Parte 1
d1 = 0;
d0 = 7;
n = 10*(1+d1) + d0;
A = diag(ones(1, n - 1), 1) + eye(n);
E = zeros(n, n);
E(n, 1) = 2^(-n);
B = A + E;
VA = eig(A);
VB = eig(B);
v1 = norm(VB - VA)/norm(VA);
disp(VA);
disp(VB);
disp(v1);

% Parte 2
C = A * A';
D = E * E';
VC = eig(C);
VD = eig(D);
v2 = norm(VD - VC)/norm(VC);
disp(VC);
disp(VD);
disp(v2);