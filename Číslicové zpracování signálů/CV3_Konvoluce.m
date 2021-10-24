%-------------------------------------------------------------
%-- Konvoluce sign�l� x1,x2 ----------------------------------

% konvoluce = pustit sign�l syst�mem, v�stup syst�mu je konvulace sign�lu s jednotko�m impulzem
% u(n)|u(n-9)|u(n-5) jednotkov� skok v �ase 0, - 9 a -5

un = ones(1,20); % jednotkov� skok
un9 = [zeros(1,9),ones(1,11)]; % jednotkov� skok v �ase 9
un5 = [zeros(1,5),ones(1,15)]; % jednotkov� skok v �ase 5

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
%-- Konvoluce sign�l� II  ------------------------------------

h = [0 0.5 1 1 0.5 0];

imp = [1,zeros(1,19)]; % jednotkov� impulz
skok = [ones(1,20)]; % jednotkov� impulz

konvoluce = conv(h,imp);

figure(2);
subplot(4,1,1);
stem(konvoluce); % impz(h)

subplot(4,1,2);
konvoluce = conv(h,skok);
stem(konvoluce);

% Toolbox signal procesing
% impz(h,1,20); % impulzn� odezva  
% impz(h); % impulzn� odezva

n = 0:79;

harm1 = sin(0.1*n);
harm2 = sin(0.66*pi*n);

% prej n�co jako doln� propust 

subplot(4,1,3);
konvoluce = conv(h,harm1); % zesiluje
stem(konvoluce);

subplot(4,1,4);
konvoluce = conv(h,harm2); % tlum�
stem(konvoluce);
 
%-------------------------------------------------------------