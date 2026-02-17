%% ESERCITAZIONE 1 - ESERCIZIO 3
% Matricola = s5798607

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
