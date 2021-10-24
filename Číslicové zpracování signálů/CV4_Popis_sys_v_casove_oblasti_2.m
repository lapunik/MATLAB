%------------------------------------------------------------
%-- Zadání 2 ------------------------------------------------
A = [1 0 0 0.81]; % muzeme vyzkouset 1 misto 0.81/1
B = [1 0 0];%koeficieny filtru
obdelnik = [ones(1,30) zeros(1,30) ones(1,30) zeros(1,30)];

%-------------------------------------------------------------
%--   --------------------------------------------------

figure(1);
impz(B,A) 

%-------------------------------------------------------------
%-- Obdelnikovy signál ---------------------------------------


figure(2);
graf = filter(B,A,obdelnik);
stem(graf);

%-------------------------------------------------------------
%-- Frekvenèí odezva -----------------------------------------
figure(3);
freqz(B,A); 
            
            
%-------------------------------------------------------------
%-- Harmonicky signal ----------------------------------------

figure(4);

n = 0:50;

w0 = 0.1*pi;
w1 = 0.5*pi;

harm0 = sin(w0*n);
harm1 = sin(w1*n);
 
graf = filter(B,A,harm0);
subplot(2,1,1);
stem(graf);
graf = filter(B,A,harm1);
subplot(2,1,2);
stem(graf);

%-------------------------------------------------------------
%-- Rozmítaný signál -----------------------------------------
figure(7);

fm = 1000;
fs = 2*fm;
N = 200;
n = 0:N-1;

x = sin((pi.*fm.*(n.^2))./((N-1).*fs));
stem(n,x);
%figure(8); druha verye jak udelat roymitanz signal
%x2 = chirp([0:(fm/fs):(N*(fm/fs)-(fm/fs))],0,N,(fs/fm));
%stem(n,x2);

graf = filter(B,A,x);
stem(graf);