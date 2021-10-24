function [x, y, tau] = aeuler(fce, xa, xb, y0, h, tolerance)
% AEULER adaptivni Eulerova metoda pro reseni soustav obycejnych diferencialnich rovnic
%   [x, y, tau] = AEULER(fce, xa, xb, y0, h, tolerance) Funkce vraci vektor nezavisle promenne x,
%                                                       vektor reseni y soustavy y' = f(x, y(x)) a
%                                                       vektor lokalni diskretizacni chyby tau
%   fce - odkaz na funkci navracejici reseni soustavy pro zadany vektor x
%   xa - pocatek reseni
%   xb - konec reseni
%   y0 - vektor pocatecnich podminek
%   h - maximalni delka kroku h
%   tolerance - tolerance lokalni diskretizacni chyby

  % vytvoreni vektoru zavisle a nezavisle promenne
  y = [y0]; x = [xa];
  
  % vytvoreni vektoru lokalni diskretizacni chyby
  tau = [];

  i = 1;
  while x(end) < xb
    hi = h;

    for j = 1:1e2 % omezeni poctu puleni kroku
      % vypocet noveho reseni
      y0 = y(i,:) + fce(x(i), y(i,:))*hi;

      % odhad chyby metodou polovicniho kroku
      hi = hi/2;
      y1 = y(i,:) + fce(x(i), y(i,:))*hi;
      y2 = y1 + fce(x(i)+hi, y1)*hi;
      taui = max(abs(y0 - y2));

      % kontrola nastavene tolerance
      if tolerance > taui
        x(i+1) = x(i) + 2*hi;
        y(i+1,:) = y0;
        tau(i) = taui;
        break
      end
    end

    i = i + 1;
  end
end