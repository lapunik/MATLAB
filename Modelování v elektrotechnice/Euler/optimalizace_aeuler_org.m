clear;
clc;
celkove_iterace =[];
tau =[];
figure(1);

fce = @RL;
xa = 0;
xb = 0.002;
y0 = 0;
h = 0.05;
absolutni_tolerance = 0.001;
relativni_tolerance = 0.01;


%------ PRESNY VYPOCET ----------------------------------------
x = 0:(0.018/100):0.018;
U0= 10;
L = 3e-3;
R = 10;
plot(x,((U0/R)*(1-exp((-R/L)*x))),'c--');
Legend{1} = "Pøesný prùbìh";
hold on;

%------ PUVODNI AEULER ---------------------------------------
tic
[t,i,tau1, celkove_iterace(1)] = aeuler_original(fce,xa,xb,y0,h,absolutni_tolerance);
toc
plot(t,i,'ko-');
Legend{2} = "Bez regulátoru krokù";
hold on;

%------ NOVY AEULER ------------------------------------------
tic
[t,i,tau2,celkove_iterace(2)] = aeuler_upgrade_II(fce,xa,xb,y0,h,absolutni_tolerance);
toc
plot(t,i,'g*-');
Legend{3} = "Testovani";
hold on;

%------ PID STEP CONTROLER AEULER ---------------------------
tic
[t,i,tau3,celkove_iterace(3)] = aeuler_PI(fce,xa,xb,y0,h,absolutni_tolerance,relativni_tolerance);
toc
plot(t,i(1:length(t)),'rx-');
Legend{4} = "S PI regulatorem kroku";
hold on;

% % ------ ODLADENI IDEALNIHO KROKU ----------------------------------------
% for k = 1:300
% tic
% krok(k) = 1.1 +(k*0.01);
% %[t,i,~,celkove_iterace(k)] = aeuler_upgrade_II(fce,xa,xb,y0,h,absolutni_tolerance,1.1 +(k*0.01));
% [t,i,tau3,celkove_iterace(k)] = aeuler_upgrade_II(fce,xa,xb,y0,h,absolutni_tolerance,1.1 +(k*0.01));
% toc
% plot(t,i,'mx-');
% hold on;
% end
% figure(2);
% plot(krok,celkove_iterace);

% %------ MERENI NA STO ITERACI ------------------------------------------
% t_toc = [];
% for j = 1:100
% tic
% [t,i,tau3,celkove_iterace(3)] = aeuler_upgrade_II(fce,xa,xb,y0,h,absolutni_tolerance);
% t_toc(j) = toc;
% plot(t,i,'g*-');
% Legend{4} = "Testovani";
% hold on;
% end
% t_toc_sum = sum(t_toc)/100

% tau = [tau1;[tau2 zeros(1,length(tau1)-length(tau2))];[tau3 zeros(1,length(tau1)-length(tau3))]]
celkove_iterace
legend(Legend,'Location','southeast');
xlim([0,xb]);