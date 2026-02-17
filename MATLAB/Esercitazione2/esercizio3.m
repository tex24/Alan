%% ESERCITAZIONE 2 - ESERCIZIO 3
% Numero di matricola S5798663

% Setup iniziale (necessario per questo esercizio)
d0 = 3;
d1 = 6;
m = 10*(d0+1) + d1;
x = (1:m)'/m;
A = [ones(m,1), x, x.^2];

% Calcolo SVD di A (necessario per l'esercizio 3.1)
[U1, S1, V1] = svd(A);

%-------------------------------------------------------
% ESERCIZIO 3

fprintf("------------\n\nESERCIZIO 3\n\n")

y = sin(x);

% 3.1
fprintf("\n3.1\n\n")
L = S1 * V1';
R = U1' * y;

disp("(U' * U * S * V') \ (U' * y) = (S * V') \ (U' * y) = " + newline)
disp(L \ R)

% Avendo U ortonormale, sappiamo che la 
% la trasporta corrisponde all'inversa. 
% Quindi, moltiplicando per entrambi i lati
% per U' semplifichiamo il sistema, considerando
% solo le prime 3 righe.

% 3.2

fprintf("\n3.2\n\n")

[Q1, R1] = qr(A);

L = R1;
R = Q1' * y;

disp("(R) \ (Q' * y) = " + newline)
disp(L \ R)

% 3.3

fprintf("\n3.3\n\n")

L = A' * A;
R = A' * y;

disp("(A' * A) \ (A' * y) = " + newline)
disp(L \ R)

% 3.4

fprintf("\n3.4\n\n")

disp("A \ y = " + newline)
disp(A \ y)
