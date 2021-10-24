% % n = ? % øád filtru
% fs = 3000;
%  fp = 2000;
% Kp = 2;
% Ks = 30;
% 
% omega_p = 2*pi*fp;
% omega_s = 2*pi*fs;
% 
% citatel_odmocnina = (10^(0.1*Ks))-1;
% jmenovatel_odmocnina = (10^(0.1*Kp))-1; 
% odmocnina = citatel_odmocnina/jmenovatel_odmocnina;
% citatel = acosd(sqrt(odmocnina));
% jmenovatel = acosd(omega_s/omega_p);
% n = citatel/jmenovatel; % n = 4.5896 =>  volím øád 6
%  
% % n = 6;
% 
% 
% % P = p/fp
% % F(p) = fp/((fp^2) + fp * 1.4142*P + (P^2))

%  a1 = 3.588;   b1 = 10.464; 
%  a1 = 0.4925;   b1 = 1.9622;
%  a1 = 0.0995;   b1 = 1.0826; 
% a1 = 0.9090;   b1 = 2.6036; 
% 
% C1 = 1000 * (10^(-9)); % [nF]
% C2 = C1 * ((4*b1)/(a1^2)); % [nF]
% R = (((a1*C2)+(sqrt(((a1^2)*(C2^2))-(4*b1*C1*C2))))/(4*pi*fp*C1*C2)); % [kOhm]
% 
% C1 = C1 * 10^9;
% C2 = C2 * 10^9;

% Filter 1. 
% C1 = 16 [nF]
% C2 = 52,0203 [nF] / 51 [nF]
% R = 8922 [Ohm] / 9100 [Ohm]

% Filter 2. 
% C1 = 10 [nF]
% C2 = 323,5868 [nF] / 330 [nF]
% R = 1959,6 [Ohm] / 2000 [Ohm]

% Filter 3. 
% C1 = 0.91 [nF]
% C2 = 398,0368 [nF] / 390 [nF]
% R = 4350,5 [Ohm] / 4300 [Ohm]

% %---------------- LOAD ---------------------------------------------------------------------------
% 
% frekvencni_2_rad_E24 = xlsread('frekvencni_2_rad_E24.xlsx');
% frekvencni_2_rad_spoctene = xlsread('frekvencni_2_rad_spoctene.xlsx');
% frekvencni_E24 = xlsread('frekvencni_E24.xlsx');
% frekvencni_E24_db = xlsread('frekvencni_E24_db.xlsx');
% frekvencni_spoctene = xlsread('frekvencni_spoctene.xlsx');
% frekvencni_spoctene_db = xlsread('frekvencni_spoctene_db.xlsx');
% frekvencni_chebyshev = xlsread('frekvencni_chebyshev.xlsx');
% frekvencni_chebyshev_db = xlsread('frekvencni_chebyshev_db.xlsx');
% jednotkovy_skok_E24 = xlsread('jednotkovy_skok_E24.xlsx');
% jednotkovy_skok_spoctene = xlsread('jednotkovy_skok_spoctene.xlsx');
% jednotkovy_skok_chebyshev = xlsread('jednotkovy_skok_chebyshev.xlsx');
% worst_case = xlsread('worst_case.xlsx');
% jednotkovy_skok_elaplace = xlsread('jednotkovy_skok_elaplace.xlsx');
% frekvencni_elaplace = xlsread('frekvencni_elaplace.xlsx');
% frekvencni_elaplace_db = xlsread('frekvencni_elaplace_db.xlsx');
%  

% %% --------------- GRAFY -------------------------------------------------------------------------- 

% Jednotkový skok
a = jednotkovy_skok_spoctene;
b = jednotkovy_skok_E24;
c = jednotkovy_skok_chebyshev;
d = jednotkovy_skok_elaplace;
figure(1);
clf; % zavøe prvni obrazek a nahradi ho novym
set(gcf,'color','white'); % bíle pozadí (místo šedého)
plot(a(1,:).*1000,a(2,:));
hold on;
plot(b(1,:).*1000,b(2,:));
hold on;
plot(c(1,:).*1000,c(2,:));
hold on;
plot(d(1,:).*1000,d(2,:));
grid on;
set(gca,'box', 'off'); % ramecek vypnout, silnìjší èáry, velikost fontu
set(gca,'FontWeight','demi');
xlim([0,max([a(1,:).*1000,b(1,:).*1000])]);
ylim([0,max([a(2,:),c(2,:),b(2,:)])]);
% plot([0,max([a(1,:).*1000,b(1,:).*1000])],[1,1],'k');
title('Odezvy filtrù na jednotkový skok');
xlabel('èas (ms)'); % nìco málo pøíkazù to zná z Techu
ylabel('napìtí (V)'); % rotation a uhel aby to nevypadalo špatnì 
l{1} = 'souèástky vypoètené';
l{2} = 'souèástky vybrané z øady E24';
l{3} = 'E CHEBYSHEV';
l{4} = 'E LAPLACE';
legend(l,'Location','southeast');
saveas(gcf,'Jednotkovy skok.png');

% Frekvenèní charakteristika filtru 2. øádu
a = frekvencni_2_rad_spoctene;
b = frekvencni_2_rad_E24;
figure(2);
clf; % zavøe prvni obrazek a nahradi ho novym
set(gcf,'color','white'); % bíle pozadí (místo šedého)
semilogx(a(1,:),a(2,:));
hold on;
semilogx(b(1,:),b(2,:));
grid on;
set(gca,'box', 'off'); % ramecek vypnout, silnìjší èáry, velikost fontu
set(gca,'FontWeight','demi');
xlim([100,4000]);
% ylim([0,max([a(2,:),b(2,:)])]);
title('Amplitudová frekvenèní charakteristika filtru 2. øádu');
xlabel('frekvence (Hz)'); % nìco málo pøíkazù to zná z Techu
ylabel('útlum (dB)'); % rotation a uhel aby to nevypadalo špatnì 
l{1} = 'souèástky vypoètené';
l{2} = 'souèástky vybrané z øady E24';
legend(l,'Location','southeast');
saveas(gcf,'Filtr 2 rad.png');

% Frekvenèní charakteristika filtru v dB
a = frekvencni_spoctene_db;
b = frekvencni_E24_db;
c = frekvencni_chebyshev_db;
d = frekvencni_elaplace_db;
figure(3);
clf; % zavøe prvni obrazek a nahradi ho novym
set(gcf,'color','white'); % bíle pozadí (místo šedého)
semilogx(a(1,:),a(2,:));
hold on;
semilogx(b(1,:),b(2,:));
semilogx(c(1,:),c(2,:));
semilogx(d(1,:),d(2,:));
grid on;
set(gca,'box', 'off'); % ramecek vypnout, silnìjší èáry, velikost fontu
set(gca,'FontWeight','demi');
 xlim([100,4000]);
% ylim([0,max([a(2,:),b(2,:)])]);
title('Amplitudová frekvenèní charakteristika filtru');
xlabel('frekvence (Hz)'); % nìco málo pøíkazù to zná z Techu
ylabel('útlum (dB)'); % rotation a uhel aby to nevypadalo špatnì 
l{1} = 'souèástky vypoètené';
l{2} = 'souèástky vybrané z øady E24';
l{3} = 'E CHEBYSHEV';
l{4} = 'E LAPLACE';
legend(l,'Location','southeast');
saveas(gcf,'Frekvencni v db.png');


% Frekvenèní charakteristika filtru
a = frekvencni_spoctene;
b = frekvencni_E24;
c = frekvencni_chebyshev;
d = frekvencni_elaplace;
figure(4);
clf; % zavøe prvni obrazek a nahradi ho novym
set(gcf,'color','white'); % bíle pozadí (místo šedého)
semilogx(a(1,:),a(2,:));
hold on;
semilogx(b(1,:),b(2,:));
semilogx(c(1,:),c(2,:));
semilogx(d(1,:),d(2,:));
grid on;
set(gca,'box', 'off'); % ramecek vypnout, silnìjší èáry, velikost fontu
set(gca,'FontWeight','demi');
 xlim([100,4000]);
% ylim([0,max([a(2,:),b(2,:)])]);
title('Amplitudová frekvenèní charakteristika filtru');
xlabel('frekvence (Hz)'); % nìco málo pøíkazù to zná z Techu
ylabel('napìtí (V)'); % rotation a uhel aby to nevypadalo špatnì 
l{1} = 'souèástky vypoètené';
l{2} = 'souèástky vybrané z øady E24';
l{3} = 'E CHEBYSHEV';
l{4} = 'E LAPLACE';
legend(l,'Location','southeast');
saveas(gcf,'Frekvencni.png');


% worst case 
a = worst_case;
figure(5);
clf; % zavøe prvni obrazek a nahradi ho novym
set(gcf,'color','white'); % bíle pozadí (místo šedého)
semilogx(a(1,:),a(2,:));
hold on;
semilogx(a(1,:),a(3,:));
hold on;
semilogx(a(1,:),a(4,:));
grid on;
set(gca,'box', 'off'); % ramecek vypnout, silnìjší èáry, velikost fontu
set(gca,'FontWeight','demi');
xlim([100,4000]);
%  ylim([0,max([a(2,:),b(2,:)])]);
title('Worst Case analýza amplitudové frekvenèní charakteristiky filtru');
xlabel('frekvence (Hz)'); % nìco málo pøíkazù to zná z Techu
ylabel('útlum (dB)'); % rotation a uhel aby to nevypadalo špatnì 
l{1} = 'ideální';
l{2} = 'horní mez';
l{3} = 'spodní mez';
legend(l,'Location','southeast');
saveas(gcf,'Worst case.png');
