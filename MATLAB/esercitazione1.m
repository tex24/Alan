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

%-------------------------------------------------------
% ESERCIZIO 2
% 2.1
A = [
%     1  2  3  4  5  6  7  8  9 10 11
     [0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0];
     [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
     [1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0];
     [1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0];
     [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0];
     [1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0];
     [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
     [0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0];
     [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
     [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1];
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0];
    ];

fprintf('\n=====================\n');
fprintf('ESERCIZIO 2\n');
fprintf('Matrice di adiacenza A (11x11)\n');
fprintf('=====================\n');

% 2.2
g = sum(A,1);
D = diag(g);
G = A / D;
[VG, LG] = eig(G);

fprintf('\n[2.2] Vettore g = somma colonne di A (gradi uscenti):\n');
disp(g);

fprintf('[2.2] Matrice diagonale D = diag(g):\n');
disp(D);

fprintf('[2.2] Matrice G = A*D^{-1} (stocastica per colonne):\n');
disp(G);

% 2.3
fprintf('\n[2.3] Autovalori di G sulla diagonale:\n');
disp(real(diag(LG))); % Stampando vediamo un autovalore che vale uno e gli altri 
          % tutti minori in modulo.

fprintf('[2.3] Matrice VG (colonne = autovettori di G):\n');
disp(real(VG)); % Usiamo real per evitare di stampare 0.0000i
% L'autovettore associato a lambda=1 (prima colonna, perché LG(1,1)=1)
% ha tutte le componenti dello stesso segno (qui negative); cambiando segno
% otteniamo un vettore con componenti non negative e poi lo si può 
% normalizzare per avere valori tra 0 e 1.

% Vediamo inoltre che è vero dire che ogni altro autovettore ha componenti
% sia positivi che negativi.

% L'autovettore x relativo a lambda=1 stima l'importanza dei nodi:
% la componente x_j è tanto maggiore quanto più spesso (nel lungo periodo)
% si arriva alla stazione j, soprattutto se è collegata a stazioni a loro
% volta importanti, non solo se ha molti collegamenti.


%-------------------------------------------------------
% ESERCIZIO 3
% 3.1
A = [
     [1, -1, 2];
     [-2, 0, 5]; 
     [6, -3, 6]
    ];

[VA, LA] = eig(A);

fprintf('\n=====================\n');
fprintf('ESERCIZIO 3.1\n');
fprintf('Autovalori/autovettori esatti con eig(A)\n');
fprintf('=====================\n');

fprintf('\n[3.1] LA = matrice diagonale degli autovalori di A:\n');
disp(LA);

fprintf('[3.1] VA = matrice degli autovettori (colonne):\n');
disp(VA);

X1 = [1, 1, 1]';
X1 = X1 / norm(X1);
X2 = [3, 10, 4]';
X2 = X2 / norm(X2);

for i = 1:10
    X1 = A * X1;
    X1 = X1 / norm(X1); 
end

lmd1 = X1'*A*X1 / (X1'*X1);

fprintf('\n[3.1] Metodo delle potenze con X1, vettore dopo 10 iterazioni:\n');
disp(X1);

fprintf('[3.1] Stima autovalore (lmd1):\n');
disp(lmd1);

for i = 1:10
    X1 = A * X1;
    X1 = X1 / norm(X1); 
end

lmd1 = X1'*A*X1 / (X1'*X1);

fprintf('\n[3.1] Metodo delle potenze con X1, vettore dopo 20 iterazioni:\n');
disp(X1);

fprintf('[3.1] Stima autovalore (lmd1):\n');
disp(lmd1);

for i = 1:45
    X2 = A * X2;
    X2 = X2 / norm(X2); 
end

lmd2 = X2'*A*X2 / (X2'*X2);

fprintf('\n[3.1] Metodo delle potenze con X2, vettore dopo 45 iterazioni:\n');
disp(X2);

fprintf('[3.1] Stima autovalore (lmd2):\n');
disp(lmd2);


for i = 1:45
    X2 = A * X2;
    X2 = X2 / norm(X2); 
end

lmd2 = X2'*A*X2 / (X2'*X2);

fprintf('\n[3.1] Metodo delle potenze con X2, vettore dopo 90 iterazioni:\n');
disp(X2);

fprintf('[3.1] Stima autovalore (lmd2):\n');
disp(lmd2);

% Il vettore X1 si avvicina più velocemente all'autovettore con autovalore
% dominante in modulo

% 3.2
p = 6;
B = A - p*eye(3); % A - pI

fprintf('\n=====================\n');
fprintf('ESERCIZIO 3.2\n');
fprintf('Metodo delle potenze inverse con shift p = lmd1\n');
fprintf('Ora uso (A - pI) nei sistemi lineari\n');
fprintf('=====================\n');

% Vettori iniziali
fprintf('\n[3.2] Potenze inverse con p = 6\n\n');
X1 = [1, 1, 1]';
X1 = X1 / norm(X1);
X2 = [3, 10, 4]';
X2 = X2 / norm(X2);

for k = 1:3
    W = B \ X1;      
    rho = (X1' * W) / (X1' * X1);
    X1 = W / norm(W);
end
lmd1 = p + 1/rho;

fprintf('\n[3.2] Potenze inverse con X1: autovettore stimato dopo 3 iterazioni:\n');
disp(X1);

fprintf('[3.2] Stima autovalore (lmd1 = p + 1/rho):\n');
disp(lmd1);

for k = 1:40
    W = B \ X2;
    rho = (X2' * W) / (X2' * X2);
    X2 = W / norm(W);
end
lmd2 = p + 1/rho;

fprintf('\n[3.2] Potenze inverse con X2: autovettore stimato dopo 40 iterazioni:\n');
disp(X2);

fprintf('[3.2] Stima autovalore (lmd2 = p + 1/rho):\n');
disp(lmd2);

fprintf('\n[3.2] Potenze inverse con p = 8\n\n');
p = 8;
B = A - p*eye(3); % A - pI
X1 = [1, 1, 1]';
X1 = X1 / norm(X1);
X2 = [3, 10, 4]';
X2 = X2 / norm(X2);

for k = 1:6
    W = B \ X1;      
    rho = (X1' * W) / (X1' * X1);
    X1 = W / norm(W);
end
lmd1 = p + 1/rho;

fprintf('\n[3.2] Potenze inverse con X1: autovettore stimato dopo 6 iterazioni:\n');
disp(X1);

fprintf('[3.2] Stima autovalore (lmd1 = p + 1/rho):\n');
disp(lmd1);

for k = 1:80
    W = B \ X2;
    rho = (X2' * W) / (X2' * X2);
    X2 = W / norm(W);
end
lmd2 = p + 1/rho;

fprintf('\n[3.2] Potenze inverse con X2: autovettore stimato dopo 80 iterazioni:\n');
disp(X2);

fprintf('[3.2] Stima autovalore (lmd2 = p + 1/rho):\n');
disp(lmd2);

% Usando il metodo delle potenze inverse il numero di iterazioni necessarie
% cala per trovare l'autovalore di massimo modulo di A
