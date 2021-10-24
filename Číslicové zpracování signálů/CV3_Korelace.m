%-------------------------------------------------------------
%-- �umov� sign�l --------------------------------------------
N = 20; % 20,250,2000

noise = randn(1,N); % randn = gaus, rand = rovnomerne

figure(1);

subplot(2,1,1);
stem(noise);

%-- Autokorelace �umu ----------------------------------------

korelace = xcorr(noise,noise);

subplot(2,1,2);
stem(korelace);

%-------------------------------------------------------------
%-- Harmonick� sign�l ----------------------------------------

figure(2);
p = 20; % kolem 20 vyork� na periodu

fs = 1000;
n = 0:(N-1); % vektor vyorku (�asu)
f = 1000/p;

y = sin(2*pi*(f./fs)*n);

subplot(2,1,1);
stem(n,y);

%-- Autokorelace harmonick�ho sign�lu --------------------------

korelace = xcorr(y,y);

subplot(2,1,2);
stem(korelace);
%---------------------------------------------------------------
%-- Harmonick� sign�l + �um ------------------------------------
figure(3);

smichane = y+noise;

subplot(2,1,1);
stem(n,smichane);

korelace = xcorr(smichane,smichane);

subplot(2,1,2);
stem(korelace);

%-- Autokorelace harmonick�ho sign�lu + �um --------------------
%---------------------------------------------------------------
