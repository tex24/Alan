%% ESERCITAZIONE 1
% Matricola = s5798607

%-------------------------------------------------------
% ESERCIZIO 1
% 1.1
d1 = 0;
d0 = 7;
n = 10*(1+d1) + d0;

A = diag(ones(1, n - 1), 1) + eye(n);
E = zeros(n, n);
E(n, 1) = 2^(-n);
B = A + E;

VA = eig(A);
VB = eig(B);

e1 = norm(B - A)/norm(A);
v1 = norm(VB - VA)/norm(VA);

fprintf('\n=====================\n');
fprintf('ESERCIZIO 1.1\n');
fprintf('n = %d\n', n);
fprintf('E(n,1) = 2^{-n} = %.8e\n', E(n,1));
fprintf('=====================\n');

fprintf('\n[1.1] Autovalori di A (VA = eig(A)):\n');
disp(VA);

fprintf('[1.1] Autovalori di B (VB = eig(B)):\n');
disp(VB);

fprintf('[1.1] Perturbazione relativa matrice ||B-A||/||A|| (e1):\n');
disp(e1);

fprintf('[1.1] Variazione relativa autovalori ||VB-VA||/||VA|| (v1):\n');
disp(v1);

% Nonostante la perturbazione relativa sulla matrice sia dell'ordine di 
% 10e-6, gli autovalori della matrice perturbata B subiscono variazioni 
% molto alte.

% 1.2
C = A * A';
D = B * B';

VC = eig(C);
VD = eig(D);

e2 = norm(D - C)/norm(C);
v2 = norm(VD - VC)/norm(VC);

fprintf('\n=====================\n');
fprintf('ESERCIZIO 1.2\n');
fprintf('C = A*A'' (simmetrica), D = B*B'' (simmetrica)\n');
fprintf('=====================\n');

fprintf('\n[1.2] Autovalori di C = A*A'' (VC = eig(C)):\n');
disp(VC);

fprintf('[1.2] Autovalori di D = B*B'' (VD = eig(D)):\n');
disp(VD);

fprintf('[1.2] Perturbazione relativa matrice ||D-C||/||C|| (e2):\n');
disp(e2);

fprintf('[1.2] Variazione relativa autovalori ||VD-VC||/||VC|| (v2):\n');
disp(v2);

% Nel caso delle matrici simmetriche A*A' e B*B', la 
% perturbazione induce variazioni sugli autovalori dello stesso ordine 
% della perturbazione sulla matrice.
