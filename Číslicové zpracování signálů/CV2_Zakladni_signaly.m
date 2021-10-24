%-- Jednotkový impulz -----------------------------------------
N = 30;
d = zeros(1,N);
d(1) = 1;
figure(1);
clf;
stem(d);
title('Jednotkovy impulz');
xlabel('n');
ylabel('\delta_(n)');

%-- Jednotkový skok -------------------------------------------
N = 30;
d = ones(1,N);
figure(2);
clf;
stem(d);
title('Jednotkovy skok');
xlabel('n');
ylabel('u_(n)');

%-- Reálná exponenciála ----------------------------------------
N = 30;
n = 0:N-1; % 30 krokù

s1 = -1.1; % chceme 4 ruzne sekvence
s2 = -0.8;
s3 = 0.6;
s4 = 1.2;

ss1 = num2str(s1);
ss2 = num2str(s2);
ss3 = num2str(s3);
ss4 = num2str(s4);

y1 = s1.^n;
y2 = s2.^n;
y3 = s3.^n;
y4 = s4.^n;

figure(3);
clf;

subplot(2,2,1);
stem(n,y1);
xlabel('n');
ylabel('y1');
title(['s = ',ss1]);
grid on;

subplot(2,2,2);
stem(n,y2);
xlabel('n');
ylabel('y2');
title(['s = ',ss2]);
grid on;

subplot(2,2,3);
stem(n,y3);
xlabel('n');
ylabel('y3');
title(['s = ',ss3]);
grid on;

subplot(2,2,4);
stem(n,y4);
xlabel('n');
ylabel('y4');
title(['s = ',ss4]);
grid on;

%-- Komplexní exponenciála ----------------------------------------
N = 100;
n = 0:N-1; % 100 krokù

w01 = 0.1; % normovaná kruhová frekvence w0 = (2*pi*f)/fs, fs = 1/Ts
w02 = 0.37;
w03 = 0.37*pi;

sw01 = num2str(w01);
sw02 = num2str(w02);
sw03 = num2str(w03);

y1 = 0.7*exp(-i*w01*n);
y2 = 0.7*exp(-i*w02*n);
y3 = 0.7*exp(-i*w03*n);

figure(4);

subplot(3,2,1);
stem(n,real(y1));
xlabel('n');
ylabel('y1');
title(['reálná: y = ',sw01]);
grid on;

subplot(3,2,2);
stem(n,imag(y1));
xlabel('n');
ylabel('y1');
title(['imaginární: y = ',sw01]);
grid on;

subplot(3,2,3);
stem(n,real(y2));
xlabel('n');
ylabel('y2');
title(['reálná: y = ',sw02]);
grid on;

subplot(3,2,4);
stem(n,imag(y2));
xlabel('n');
ylabel('y2');
title(['imaginární: y = ',sw02]);
grid on;

subplot(3,2,5);
stem(n,real(y3));
xlabel('n');
ylabel('y3');
title(['reálná: y = ',sw03]);
grid on;

subplot(3,2,6);
stem(n,imag(y3));
xlabel('n');
ylabel('y3');
title(['imaginární: y = ',sw03]);
grid on;


%-- Harmonická funkce ----------------------------------------
f1 = 50;
f2 = 137;
f3 = 470;

sf1 = num2str(f1);
sf2 = num2str(f2);
sf3 = num2str(f3);

fvz = 1000;

sfvz = num2str(fvz);

% urèete poèet vzorkù na periodu? --> k = fs/f

k1 = fvz/f1;
k2 = fvz/f2;
k3 = fvz/f3;


N1 = round (5*k1);
N2 = round (5*k2);
N3 = round (5*k3);

n1 = 0:(N1-1);
n2 = 0:(N2-1);
n3 = 0:(N3-1);

z1 = sin(2*pi*(f1./fvz)*n1);
z2 = sin(2*pi*(f2./fvz)*n2);
z3 = sin(2*pi*(f3./fvz)*n3);

figure(5);

subplot(1,3,1);
stem(n1,z1);
xlabel('n1');
ylabel('z1');
title(['Harmonická funkce: f = ',sf1]);
grid on;

subplot(1,3,2);
stem(n2,z2);
xlabel('n2');
ylabel('z2');
title(['Harmonická funkce: f = ',sf2]);
grid on;

subplot(1,3,3);
stem(n3,z3);
xlabel('n3');
ylabel('z3');
title(['Harmonická funkce: f = ',sf3]);
grid on;

%-- Rozmítaný signál ----------------------------------------
fm = 1000;
fs = 10000;
N = 100;
n = 0:N-1;

x1 = cos((pi.*fm.*(n.^2))./((N-1).*fs));

x2 = chirp([0:(fm/fs):(N*(fm/fs)-(fm/fs))],0,N,(fs/fm));

figure(6);

subplot(1,2,1);
stem(n,x1);
xlabel('n');
ylabel('x1');
title('Harmonická funkce "z definice"');
grid on;


subplot(1,2,2);
stem(n,x2);
xlabel('n');
ylabel('x2');
title('Rozmítaný signál "chirp fukce": ');
grid on;


%-- Šumový signál ----------------------------------------
N = 100;
noise = randn(1,N); % randn = gaus, rand = rovnomerne

figure(7);

stem(noise);
xlabel('n');
ylabel('noise');
title('Šum');
grid on;

figure(8);
hist(noise);







