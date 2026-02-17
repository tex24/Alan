%% ESERCITAZIONE 2 - ESERCIZIO 1
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
