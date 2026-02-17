%% ESERCITAZIONE 1 - ESERCIZIO 2
% Matricola = s5798607

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
