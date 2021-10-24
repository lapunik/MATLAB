% nakreslit sinus, dvì periody, deset prvkù na periodu 

% n = [0:(4*pi)/20:4*pi]; % vojebávka
% stem(n,sin(n));
%{
fn = 0.1; % vzorkovací frekvence

n = [0:19]; 
stem(n,sin(n*2*pi*fn));
%}

%*************************************************************************

% jednotkovy skok
%y = ones(1,20); % ones = diskterne samy jednicky

% Dirakuv impulz
%y = zeros(1,20);
%y(1) = 1

% exponenciala
x = [0:50];

y = (0.8).^x;
subplot(2,3,1);
plot(x,y);

y = (0.8).^(-x);
subplot(2,3,2);
plot(x,y);

y = (-0.8).^x;
subplot(2,3,3);
plot(x,y);

y = (2).^x;
subplot(2,3,4);
plot(x,y);

y = (2).^(-x);
subplot(2,3,5);
plot(x,y);

y = (-2).^x;
subplot(2,3,6);
plot(x,y);
