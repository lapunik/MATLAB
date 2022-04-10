function [t, y] = euler(funkce, ta, tb, y0, n)
% EULER Eulerova metoda pro reseni soustav obycejnych diferencialnich rovnic:

% Derivace krok po kroku, kde každý další výpočet zakládám na vypočteném
% bodu předchozím. Čím menší krok, tím složitější výpočet, ale tím také
% přesnější aproximace.

%   [t, y] = EULER(fce, ta, tb, y0, n) Funkce vraci vektor nezavisle promenne t a vektor reseni y soustavy y' = f(t, y(t))
%   fce - odkaz na funkci navracejici reseni soustavy
%   ta - pocatek reseni
%   tb - konec reseni
%   y0 - vektor pocatecnich podminek
%   n - pocet kroku deleni intervalu (ta, tb)

h = (tb-ta)/n;   % vypocet kroku deleni

y = [y0]; 
t = [ta];
    
for i = 1:n
    y(i+1,:) = y(i,:) + (funkce(t(i), y(i,:))*h); % vypocet reseni v novem kroku 
    t(i+1) = t(i) + h;
end

end