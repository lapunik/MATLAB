%------------------------------------------------------------
%-- Zad�n� 1 ------------------------------------------------
A = [1 zeros(1,10)];
B = [0.0051 0 -0.0149 0  0.2885 0.4968 0.2885 0 -0.0149 0 0.0051];%koeficieny filtru
obdelnik = [ones(1,30) zeros(1,30) ones(1,30) zeros(1,30)];

%-------------------------------------------------------------
%-- Zp�sob 1 -------------------------------------------------

figure(1);
impz(B,A) % (citael,jmenovatel) syst�mov� funkce(prenosov�)


%-------------------------------------------------------------
%-- Zp�sob 2 -------------------------------------------------
figure(2);
konvoluce = conv(A,B);%(jednotkov� impuls, impulzn� odezva), impulzn� odezva = koeficienty proto�e m�me filtr typu FIR (finite)
% FIR jsou v�dy stabiln� a impulzn� odezva se rovn� koeficienty filtru FIR
% FIR(nemaj� zp�tn� vazby a jsou jen dop�edn�)
stem(konvoluce);

%-------------------------------------------------------------
%-- Obdelnikovy sign�l 1.zp�sob ------------------------------

konvoluce = conv(obdelnik,B);
figure(3);
stem(konvoluce);

%-------------------------------------------------------------
%-- Obdelnikovy sign�l 2.zp�sob ------------------------------


figure(4);
graf = filter(B,A,obdelnik);
stem(graf);

%-------------------------------------------------------------
%-- Frekven�� odezva -----------------------------------------
figure(5);
freqz(B,A); % pokud vysledek nikam neukladam, sam vykresli zvlast amplitudovou a fazovou 
            % [hodnoty prenosu pro dany frekvence, komplexni cisla, normovana kruhova frekvence od nuly na jedna] = (B,A,n(pocet kroku kdy� je nezad�m 512))
            % H je komplexni!! musime to brat v potaz, plot(kruhove frekvence, 20*log10(abs(H)))
            
            
%-------------------------------------------------------------
%-- Harmonicky signal ----------------------------------------

figure(6);

n = 0:50;

w0 = 0.1*pi;
w1 = 0.873*pi;

harm0 = sin(w0*n);
harm1 = sin(w1*n);
 
graf = filter(B,A,harm0);
subplot(2,1,1);
stem(graf);
graf = filter(B,A,harm1);
subplot(2,1,2);
stem(graf);

%-------------------------------------------------------------
%-- Rozm�tan� sign�l -----------------------------------------
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