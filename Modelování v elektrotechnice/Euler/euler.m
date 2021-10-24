function [t, y] = euler(fce, ta, tb, y0, n)
% EULER Eulerova metoda pro reseni soustav obycejnych diferencialnich rovnic
%   [t, y] = EULER(fce, ta, tb, y0, n) Funkce vraci vektor nezavisle promenne t a vektor reseni y soustavy y' = f(t, y(t))
%   fce - odkaz na funkci navracejici reseni soustavy
%   ta - pocatek reseni
%   tb - konec reseni
%   y0 - vektor pocatecnich podminek
%   n - pocet kroku deleni intervalu (ta, tb)

  % vypocet kroku deleni
  h = (tb-ta)/n;

  % vytvoreni vektoru zavisle a nezavisle promenne
  y = [y0]; t = [ta];  

  for i = 1:n
    % vypocet reseni v novem kroku 
    y(i+1,:) = y(i,:) + (fce(t(i), y(i,:))*h);
    t(i+1) = t(i) + h;
  end
end