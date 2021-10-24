function [t, y] = aeuler_moje_puvodni(fce, ta, tb, y0, step, tau)
% EULER Eulerova metoda pro reseni soustav obycejnych diferencialnich rovnic
%   [t, y] = EULER(fce, ta, tb, y0, n) Funkce vraci vektor nezavisle promenne t a vektor reseni y soustavy y' = f(t, y(t))
%   fce - odkaz na funkci navracejici reseni soustavy
%   ta - pocatek reseni
%   tb - konec reseni
%   y0 - vektor pocatecnich podminek

  y = [y0]; t = [ta];  
  iter = 1;
  odhad1 = [y0];
  odhad2 = [y0];
  cas1 = [ta];
  cas2 = [ta];
  
  while t(iter) < tb 
  
  chyba = tau+1;
  delitel = 1;
  
  while chyba > tau      
    delitel = delitel*2;    
 
    odhad1(2,:) = odhad1(1,:) + (fce(cas1(1), odhad1(1,:))*((step*2)/delitel));
    cas1(2) = cas1(1) + ((step*2)/delitel);
    
    odhad2(2,:) = odhad2(1,:) + (fce(cas2(1), odhad2(1,:))*(step/delitel));
    cas2(2) = cas2(1) + step/delitel;
    
    odhad2(3,:) = odhad2(2,:) + (fce(cas2(2), odhad2(2,:))*(step/delitel));
    cas2(3) = cas2(2) + step/delitel;
    
    chyba = max(abs(odhad1(2,:) - odhad2(3,:)));
   
        if delitel == 2^100 % maximálnì 100 iteací
        break;
        end    
    
  end
  y(iter+1,:) = odhad1(2,:); 
  t(iter+1) = cas1(2);
  
  odhad1 = [y(iter+1,:)];
  odhad2 = [y(iter+1,:)];
  cas1 = [t(iter+1)];
  cas2 = [t(iter+1)];
  
  iter = iter + 1;
  end
  
end

