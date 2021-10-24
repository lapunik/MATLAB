% vy�leme z radaru sign�l a m���me za jak dlouho se vr�t�, zn�me rychlost 
% ���en� sign�lu, chceme vyd8lenost.

% po�leme vhodn� modulovanou elektromagnetickou vlnu sm�rem k objektu a odraz� se
% zp�t, pot� ud�l�me korelaci a budeme se sna�it zjistit jak je objekt
% daleko.

omegaN = 0.1*pi; % to n�m zaru�� 20 vzork� na periodu
n = 0:19; % dvacet vzork�
f1 = sin(omegaN * n); %jedna perioda sinusovky
f2 = -f1; %jedna perioda sinusovky

% pomoc� fazov� modulace ud�l�me barker13 k�d: (1 1 1 0 0 1 1 0 1 0 1 0)
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
Rx = [randn(1,200),Tx+randn(size(Tx)),randn(1,100)]% prijaty signal = �um + nas signal kter� se vr�til se �umem + zase �um

figure(2);
clf;

subplot(3,1,1);
plot(Tx);

subplot(3,1,2);
plot(Rx); % z p�ijat�ho sign�lu nevid�me nic ale z korelace vid�me p�esn� peek kdy se sign�ly shoduj� = tady m��eme zm��it vzd�lenost

subplot(3,1,3);
plot(xcorr(Tx,Rx));