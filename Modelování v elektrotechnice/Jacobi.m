A = [5 2 0 3; 2 6 1 1; 1 0 3 2; 1 -2 2 5];
b = [14;1;9;16];
x0 = [0;0;0;0];
epsilon = 10e-9;


x = jacobi(A,b,x0,epsilon)



function x = jacobi(A, b, x0, epsilon)
% JACOBI Jacobiho metoda pro reseni soustav linearnich algebraickych rovnic 
%   x = JACOBI(A, b) Funkce vraci vektor reseni soustavy rovnic Ax = b
%   A - matice soustavy
%   b - vektor pravych stran
%   x0 - sloupcovy vektor pocatecniho reseni
%   epsilon - pozadovana relativni chyba reseni

n = length(b);
x = x0;

for k = 1:1e4
    % vypocet nove aproximace
    xk = x;
    for i = 1:n
        x(i) = 1/A(i,i) * (b(i) - (A(i,[1:i-1]) * xk([1:i-1])) - (A(i,[i+1:n]) * xk([i+1:n])));
    end

    % vypocet relativni chyby reseni
    err = max(abs(x-xk))/(max(x));

    % kontrola na pozadovanou chybu reseni
    if err <= epsilon
        return
    end
end
end