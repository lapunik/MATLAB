%-- VAR ------------------------------------------------------------------
casovy_krok = 0.1; %[ms]
doba_simulace = 10; %[ms]

pocatecni_hodnota = 0;

koeficient_0 = 10; 
koeficient_1 = 4; 
koeficient_2 = 0.25;
%-- VAR ------------------------------------------------------------------
pocet_vzorku = doba_simulace/casovy_krok;
y = []; % prazdny vektor vysledku
y = pocatecni_hodnota;
    
  for x = 1:1:pocet_vzorku
  dy = (casovy_krok*((-koeficient_1/koeficient_2)*y(x)+koeficient_0/koeficient_2));    
  y(x+1) = y(x)+dy;
  end

%-- GRAF -----------------------------------------------------------------
figure(1);
clf;
plot(y);
grid on;
title('Diferenciální rovnice prvního øádu');
ylabel('y_{(x)}');
xlabel('x');
ylim([0,max(y)+(max(y)/(50))])
xlim([0,pocet_vzorku])
set(get(gca,'ylabel'),'rotation',0)
set(gcf,'color','white');
set(gca,'box', 'off','FontWeight','demi'); % ramecek vypnout, velikost fontu
%-- GRAF -----------------------------------------------------------------