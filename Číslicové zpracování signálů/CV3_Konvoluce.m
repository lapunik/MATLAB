%-------------------------------------------------------------
%-- Konvoluce signálù x1,x2 ----------------------------------

% konvoluce = pustit signál systémem, výstup systému je konvulace signálu s jednotkoým impulzem
% u(n)|u(n-9)|u(n-5) jednotkový skok v èase 0, - 9 a -5

un = ones(1,20); % jednotkový skok
un9 = [zeros(1,9),ones(1,11)]; % jednotkový skok v èase 9
un5 = [zeros(1,5),ones(1,15)]; % jednotkový skok v èase 5

x1 = un - un9;
x2 = un - un5;

konvoluce = conv(x1,x2);

figure(1);
subplot(2,1,1);
stem(konvoluce);

konvoluce = conv(x1,x1); % konvulace sama sebe

subplot(2,1,2);
stem(konvoluce);
%-------------------------------------------------------------
%-- Konvoluce signálù II  ------------------------------------

h = [0 0.5 1 1 0.5 0];

imp = [1,zeros(1,19)]; % jednotkový impulz
skok = [ones(1,20)]; % jednotkový impulz

konvoluce = conv(h,imp);

figure(2);
subplot(4,1,1);
stem(konvoluce); % impz(h)

subplot(4,1,2);
konvoluce = conv(h,skok);
stem(konvoluce);

% Toolbox signal procesing
% impz(h,1,20); % impulzní odezva  
% impz(h); % impulzní odezva

n = 0:79;

harm1 = sin(0.1*n);
harm2 = sin(0.66*pi*n);

% prej nìco jako dolní propust 

subplot(4,1,3);
konvoluce = conv(h,harm1); % zesiluje
stem(konvoluce);

subplot(4,1,4);
konvoluce = conv(h,harm2); % tlumí
stem(konvoluce);
 
%-------------------------------------------------------------