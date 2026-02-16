% Numero di matricola S5798663
d0 = 3;
d1 = 6;
m = 10*(d0+1) + d1;
x = (1:m)'/m;
A = [ones(m,1), x, x.^2];

%-------------------------------------------------------
% ESERCIZIO 1
fprintf("ESERCIZIO 1\n\n")

fprintf("A = U1 * S1 * V1'\nA' = U2 * S2 * V2'\n\n")

% 1.1
fprintf("1.1\n\n")
[U1, S1, V1] = svd(A);
[U2, S2, V2] = svd(A');

% V1 = U2
fprintf("||V1 - U2|| = %.3e => V1 = V2\n\n", norm(V1 - U2))

% S1 == S2
fprintf("||S1 - S2'|| = %.3e => S1 = S2'\n\n", norm(S1 - S2'))

% V2 = U1
fprintf("||U1 - V2|| = %.3e => U1 = V2\n\n", norm(U1 - V2))

% Notiamo che gli autovettori e gli autovalori sono uguali

% 1.2
fprintf("1.2\n\n")
% Prendo gli autovalori non nulli e li ordino per modulo
S3 = eig(A*A');
S3v = S3(end-2:end);
tmp = S3v(1,:);
S3v(1,:) = S3v(3,:);
S3v(3,:) = tmp;
S4v = eig(A'*A);
tmp = S4v(1,:);
S4v(1,:) = S4v(3,:);
S4v(3,:) = tmp;

% S1 == S3
fprintf("||S1 - S3|| = %.3e => S1 != S3\n\n", norm(diag(S1) - S3v))

% S2 == S4
fprintf("||S1 - S4|| = %.3e => S1 != S4\n\n", norm(diag(S1) - S4v))

% S1.^2 == S3
fprintf("||S1.^2 - S3|| = %.3e => S1.^2 ≈ S3\n\n", norm(diag(S1.^2) - S3v))

% S2.^2 == S4
fprintf("||S1.^2 - S4|| = %.3e => S1.^2 ≈ S4\n\n", norm(diag(S1.^2) - S4v))


% La differenza è minima, quindi potremmo aver avuto un errore algoritmico,
% però sappiamo che i valori sulla diagonale di S1 al quadrato equivalgono
% ai lambda sulla diagonale di S3 (autovalori di A*A') e S4 (autovalori di 
% A'*A).

% 1.3
fprintf("1.3\n\n")
rA = rank(A);
fprintf("||U(:,1:rank(A)) - Im(A)|| = %.3e => Im(A) = U(:,1:rank(A)) \n(U calcolato con A)\n\n", norm(U1(:,1:rA) - orth(A)))
% Le prime rA colonne di U sono i vettori singolari associati ai valori 
% singolari non nulli, e generano Im(A).


fprintf("||U(:,1:rank(A')) - Im(A')|| = %.3e => Im(A') = U(:,1:rank(A')) \n(U calcolato con A')\n\n", norm(U2 - orth(A')))

% Otteniamo che l'immagine è presente nella matrice sinistra, considerando
% solo gli autovettori con autovalore non nullo (e quindi non appartenenti
% al Kernel).

% 1.4
fprintf("1.4\n\n")
N = null(A);
rN = rank(A);
fprintf("||Ker(A) - V(:,rank(Ker(A)) + 1:end)|| = %.3e => Ker(A) = V(:,rank(Ker(A)) + 1:end) \n(V calcolato su A)\n\n", norm(N - V1(:,rN + 1:end)))
% Le colonne di V associate ai valori singolari nulli formano una base del 
% kernel della matrice.

Nt = null(A');
rNt = rank(A');
fprintf("||Ker(A') - V(:,:,rank(Ker(A')) + 1:end)|| = %.3e => Ker(A') = V(:,rank(Ker(A')) + 1:end) \n(V calcolato su A')\n\n", norm(Nt - V2(:,rNt + 1:end)))
% Prendo solo gli autovettori che appartengono al Kernel

% Possiamo notare che i valori di V1 (e V2 per A') corrispondono al kernel
% della matrice sulla quale sono stati calcolati.


%-------------------------------------------------------
% ESERCIZIO 2

fprintf("------------\n\nESERCIZIO 2\n\n")

% 2.1
fprintf("\n2.1\n\n")
n = 3;
B = triu(-ones(n, n), 1) + eye(n);
[U5, S5, V5] = svd(B);
fprintf("Valori singolari di B:\n");
disp(diag(S5));

% 2.2
fprintf("\n2.2\n")
i = 1;
while i <= 100
    Bn = triu(-ones(i, i), 1) + eye(i);
    [U6, S6, V6] = svd(Bn);
    sMax = S6(1);
    sMin = S6(end);

    fprintf("\nn = %d\n", i);
    fprintf("Valore singolare massimo di Bn: %.3e\n", sMax);
    fprintf("Valore singolare minimo di Bn: %.3e\n", sMin);
    fprintf("Condizionamento in norma 2: %.3e\n", max(diag(S6))/min(diag(S6)));
    i = (i >= 50) * (i + 10) + (i >= 5 && i < 50) * (i + 5) + (i < 5) * (i + 1);
end

% Possiamo che la funzione che prende il valore singolare massimo di Bn
% risulta strettamente crescente nell'intervallo I nel quale la abbiamo
% studiata, con I = [1, 300].
% Non possiamo dire lo stesso per il condizionamento in norma 2, che non ci
% esce monotona.

% 2.3
fprintf("\n2.3\n")
i = 1;
while i <= 100
    Bn = triu(-ones(i, i), 1) + eye(i);
    Bn(i, 1) = Bn(i, 1) - (2^(2-i));
    fprintf("\nn = %d", i);
    fprintf("\nValore singolare minimo: %.3e\n", min(abs(eig(Bn))));
    i = (i >= 50) * (i + 10) + (i >= 5 && i < 50) * (i + 5) + (i < 5) * (i + 1);
end


% 2.4
% La perturbazione su B(n,1)​ rende B quasi singolare: un 
% autovalore è vicino a 0 e il valore singolare minimo risulta molto 
% piccolo. In termini di rango numerico, le colonne diventano quasi 
% dipendenti, e il condizionamento in norma 2 cresce sensibilmente.


%-------------------------------------------------------
% ESERCIZIO 3

fprintf("------------\n\nESERCIZIO 3\n\n")

x = (1:m)'/m;
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