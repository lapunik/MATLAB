% vyšleme z radaru signál a mìøíme za jak dlouho se vrátí, známe rychlost 
% šíøení signálu, chceme vyd8lenost.

% pošleme vhodnì modulovanou elektromagnetickou vlnu smìrem k objektu a odrazí se
% zpìt, poté udìláme korelaci a budeme se snažit zjistit jak je objekt
% daleko.

omegaN = 0.1*pi; % to nám zaruèí 20 vzorkù na periodu
n = 0:19; % dvacet vzorkù
f1 = sin(omegaN * n); %jedna perioda sinusovky
f2 = -f1; %jedna perioda sinusovky

% pomocí fazové modulace udìláme barker13 kód: (1 1 1 0 0 1 1 0 1 0 1 0)
%                                      log. 1: sin (jedna perioda)
%                                      log. 0: -sin (jedna perioda)


barker13 = [f1 f1 f1 f1 f2 f2 f1 f1 f2 f1 f2 f1 f2];

figure(1);
clf;

subplot(2,1,1);
plot(barker13);

subplot(2,1,2);
plot(xcorr(barker13));

Tx = [barker13,zeros(1,100)] % vyslana sekvence = nas kod + retezec nul
Rx = [randn(1,200),Tx+randn(size(Tx)),randn(1,100)]% prijaty signal = šum + nas signal který se vrátil se šumem + zase šum

figure(2);
clf;

subplot(3,1,1);
plot(Tx);

subplot(3,1,2);
plot(Rx); % z pøijatého signálu nevidíme nic ale z korelace vidíme pøesný peek kdy se signály shodují = tady mùžeme zmìøit vzdálenost

subplot(3,1,3);
plot(xcorr(Tx,Rx));