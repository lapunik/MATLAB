casovy_krok = 0.1; %[ms]
doba_simulace = 10; %[ms]

pocatecni_hodnota = 0;

U0 = 10; 
R = 4; 
L = 0.25;

rovnice = @(x) ((-R/L)*x) + (U0/L);

DifferentialEquation_First_Order_Solver(rovnice,casovy_krok,doba_simulace,pocatecni_hodnota);
%{

%-- SCRIPT ----------------------------------------------------------------
function [] = DifferentialEquation_First_Order_Solver_Function(rovnice,casovy_krok,doba_simulace,pocatecni_hodnota)

pocet_vzorku = doba_simulace/casovy_krok;
y = []; % prazdny vektor vysledku
y = pocatecni_hodnota;
    
  for x = 1:1:pocet_vzorku
  y(x+1) = y(x)+ (casovy_krok*rovnice(y(x)));    
  end

%-- GRAF -----------------------------------------------------------------
figure(1);
clf;
plot(y);
grid on;
title('Differential equation');
ylabel('y_{(x)}');
xlabel('x');
ylim([0,max(y)+(max(y)/(50))])
xlim([0,pocet_vzorku])
set(get(gca,'ylabel'),'rotation',0)
set(gcf,'color','white');
set(gca,'box', 'off','FontWeight','demi'); % ramecek vypnout, velikost fontu
%-- GRAF -----------------------------------------------------------------

end

%}