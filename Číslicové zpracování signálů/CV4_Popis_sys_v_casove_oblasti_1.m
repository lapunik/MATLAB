%------------------------------------------------------------
%-- Zadání 1 ------------------------------------------------
A = [1 zeros(1,10)];
B = [0.0051 0 -0.0149 0  0.2885 0.4968 0.2885 0 -0.0149 0 0.0051];%koeficieny filtru
obdelnik = [ones(1,30) zeros(1,30) ones(1,30) zeros(1,30)];

%-------------------------------------------------------------
%-- Zpùsob 1 -------------------------------------------------

figure(1);
impz(B,A) % (citael,jmenovatel) systémové funkce(prenosové)


%-------------------------------------------------------------
%-- Zpùsob 2 -------------------------------------------------
figure(2);
konvoluce = conv(A,B);%(jednotkový impuls, impulzní odezva), impulzní odezva = koeficienty protože máme filtr typu FIR (finite)
% FIR jsou vždy stabilní a impulzní odezva se rovný koeficienty filtru FIR
% FIR(nemají zpìtné vazby a jsou jen dopøedné)
stem(konvoluce);

%-------------------------------------------------------------
%-- Obdelnikovy signál 1.zpùsob ------------------------------

konvoluce = conv(obdelnik,B);
figure(3);
stem(konvoluce);

%-------------------------------------------------------------
%-- Obdelnikovy signál 2.zpùsob ------------------------------


figure(4);
graf = filter(B,A,obdelnik);
stem(graf);

%-------------------------------------------------------------
%-- Frekvenèí odezva -----------------------------------------
figure(5);
freqz(B,A); % pokud vysledek nikam neukladam, sam vykresli zvlast amplitudovou a fazovou 
            % [hodnoty prenosu pro dany frekvence, komplexni cisla, normovana kruhova frekvence od nuly na jedna] = (B,A,n(pocet kroku když je nezadám 512))
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