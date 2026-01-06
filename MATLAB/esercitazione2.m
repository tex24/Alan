% Numero di matricola S5798663
d0 = 3
d1 = 6
m = 10*(d0 + 1) + d1
A = zeros(m,3);

for r = 1:m
    for c = 1:3
        if c == 1
            A(r,c) = 1;
        elseif c == 2
            A(r,c) = r/m;
        else 
            A(r,c) = (r/m)^2;
        end
    end
end

%-------------------------------------------------------
% ESERCIZIO 1
% 1.1
[U1, S1, V1] = svd(A);
[U2, S2, V2] = svd(A');

% V1 = U2
isequal(U2, V1)

% S1 == S2
isequal(S1, S2')

% V2 = U1
isequal(U1, V2)

V1 - U2

S1 - S2'

U1 - V2

% Notiamo che i numeri differiscono di poco, e quindi probabilmente
% abbiamo avuto un errore algoritmico.

% 1.2
[U3, S3, V3] = svd(A*A');
[U4, S4, V4] = svd(A'*A);

% S3 = S4
isequal(diag(S3), diag(S4))

% L'errore è ancora minimo, quindi potremmo aver avuto ancora
% un errore algoritmico

% 1.3
disp("Immagine di A")
orth(A)
disp("Im(A) = U " + newline + "(U calcolato con A)")
isequal(U1, orth(A))

disp("Immagine di A'")
orth(A')
disp("Im(A') = U " + newline + "(U calcolato con A')")
isequal(U2, orth(A'))

% Otteniamo che le immagini sono uguali al vettore sinistro 
% su cui abbiamo calcolato SVD

% 1.4
disp("Nucleo di A")
null(A)
disp("V (calcolato su A)")
V1

disp("Nucleo di A'")
null(A')
disp("V (calcolato su A')")
V2

% DA RICONTROLLARE 
% Dal momento che non abbiamo vettori nulli in V2, questo implica
% che il kernel risulta banale, come possiamo notare


%-------------------------------------------------------
% ESERCIZIO 2

n = 3;
B = zeros(n,n);

for r = 1:n
    for c = 1:n
        if r < c
            B(r,c) = -1;
        elseif r == c
            B(r,c) = 1;
        else 
            B(r,c) = 0;
        end
    end
end

B

% 2.1
[U5, S5, V5] = svd(B);
disp("Valori singolari di B:");
disp(diag(S5));

% 2.2

i = 0;
while i < 100 % Per ora metto 100, ma poi bisogna mettere 300
    i = i + 1;
    Bn = zeros(i,i);
    for r = 1:i
        for c = 1:i
            if r < c
                Bn(r,c) = -1;
            elseif r == c
                Bn(r,c) = 1;
            else 
                Bn(r,c) = 0;
            end
        end
    end
    disp("Valore singolare massimo di Bn, con n = " + i + ":");
    [U6, S6, V6] = svd(Bn);
    disp(max(diag(S6)));
    disp("Condizionamento in norma 2, con n = " + i + ":");
    disp(max(diag(S6))/min(diag(S6)));
end

% Possiamo che la funzione che prende il valore singolare massimo di Bn
% risulta strettamente crescente nell'intervallo I nel quale la abbiamo
% studiata, con I = [1, 300].
% Non possiamo dire lo stesso per il condizionamento in norma 2, che non ci
% esce monotona.

% 2.3
B(n, 1) = B(n, 1) - (2^(2-n));
eig(B)

% 2.4
% Possiamo notare dall'esercizio 2.3 che un autovalore tende a 0. Questo e
% dovuto dal fatto che con un valore nella posizione (n, 1) non abbiamo piú
% una matrice triangolare superiore, e l'ultima colonna la possiamo
% ottenere dallo span delle rimanenti.


%-------------------------------------------------------
% ESERCIZIO 3


y = zeros(m, 1);

for j = 1:m
    y(j, 1) = sin(m\j);
end

y

% 3.1
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

[Q1, R1] = qr(A);

L = R1;
R = Q1' * y;

disp("(R) \ (Q' * y) = " + newline)
disp(L \ R)

% 3.3

L = A' * A;
R = A' * y;

disp("(A' * A) \ (A' * y) = " + newline)
disp(L \ R)

% 3.4
disp("A \ y = " + newline)
disp(A \ y)