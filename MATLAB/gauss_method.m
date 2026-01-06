% implementare una funzione per triangolarizzare una matrice con il metodo 
% di eliminazione di Gauss
% Parametri:
% input:  A, la matrice da triangolarizzare
% output: T, la matrice triangolarizzata

function T = gauss_method(A)
    
    % ottenere le dimensioni di A tramite il comando size
    [row, col] = size(A);
    
    % inizializzazione della matrice di output con una matrice di zeri
    T = A;
    
    % gli indici in Matlab partono da 1...
    for j = 1:col-1
        % elemento della diagonale di T
        perno = T(j,j);
        
        for i = j+1:row
                % calcola il moltiplicatore 
                mult = T(i,j) /perno;
                T(i,:) = T(i,:) - mult*T(j, :);
        end
    end
end

