%% ESERCITAZIONE 2 - ESERCIZIO 2
% Numero di matricola S5798663

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
% studiata, con I = [1, 100].
% Non possiamo dire lo stesso per il condizionamento in norma 2, che non ci
% esce monotona.

% 2.3
fprintf("\n2.3\n")
i = 1;
while i <= 100
    fprintf("\nn = %d\n", i);
    Bn = triu(-ones(i, i), 1) + eye(i);
    fprintf("\nAutovalore minimo non perturbata: %.3e\n", min(abs(eig(Bn))));
    Bn(i, 1) = Bn(i, 1) - (2^(2-i));    
    fprintf("Autovalore minimo perturbata: %.3e\n", min(abs(eig(Bn))));
    i = (i >= 50) * (i + 10) + (i >= 5 && i < 50) * (i + 5) + (i < 5) * (i + 1);
end


% 2.4
% La perturbazione su B(n,1)​ rende B quasi singolare: un 
% autovalore è vicino a 0 e il valore singolare minimo risulta molto 
% piccolo con n maggiori e vicini a 2. In termini di rango numerico, 
% le colonne diventano quasi dipendenti.
 
