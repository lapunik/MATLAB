function [] = DifferentialEquation_First_Order_Solver_Vector(rovnice,casovy_krok,doba_simulace,pocatecni_hodnota)
%transponuju jen pro lepší práci s nima (cykly jsou jednotlivé øádky, sloupce jsou namìøené hodnoty(i v y))
casovy_krok = casovy_krok';
doba_simulace = doba_simulace';
pocatecni_hodnota = pocatecni_hodnota';

pocet_vzorku = doba_simulace./casovy_krok;
y = []; % prazdny vektor vysledku
pocet_cyklu = size(pocatecni_hodnota);

for cyklus = 1:pocet_cyklu(1)

  y(cyklus,1) = pocatecni_hodnota(cyklus);  
  
  for n = 1:1:pocet_vzorku(cyklus,1) % n = posloupnost vzorku
  r = rovnice(cyklus);
  y(cyklus,n+1) = y(cyklus,n)+ (casovy_krok(cyklus)*(r{1}(y(cyklus,n))));
  end

end
%-------------------------------------------------------------------------

%-- GRAPH ----------------------------------------------------------------
figure(1);
clf;
time = [];
for cyklus = 1:pocet_cyklu(1)
time = 0:casovy_krok(cyklus,1):(doba_simulace(cyklus,1));
a = y(cyklus,(1:((pocet_vzorku(cyklus,1))+1)));
plot(time,a);
hold on;
grid on;
end
title('Differential equation','Interpreter','latex');
ylabel('y_{(t)}');
xlabel('t');
set(get(gca,'ylabel'),'rotation',0)
set(gcf,'color','white');
set(gca,'box', 'off','FontWeight','demi'); % ramecek vypnout, velikost fontu
 Legend=cell(pocet_cyklu(1),1);
 for cyklus=1:pocet_cyklu(1)

s = func2str(rovnice{cyklus});
s = s(6:end);
 Legend{cyklus} = strcat("Equation ", num2str(cyklus) ,": ","dx/dt = ", s);
 end
 legend(Legend,'Location','southeast','Interpreter','latex')
end
%-------------------------------------------------------------------------