%   Dopredna sit se zpetnym sirenim chyby pri uceni - Back propagation
%   Klasifikace dat do 4 trid prislusnosti

%   Matice souradnic [x,y] trenovacich dat 
P = [-5	-5	-5	-4	-4	-3	-4.5 -4.5  -3.5  -3.5  -3.5  -4.5  -2.5  -2.5  -2.5	 2.5   2.5	3	2	3	3	3.5	 3.5  4	 1.5  2.5	2.5	 3.5  3.5  2.5	 1	 4	 1.5    0   0   0   1   -1  -1  -5  -4  -3  -4  -3  5  4   3   4    3;
      3	 4	 5	 4	 5	 5	-3	 -4	   -2	 -3	   -4    -2    -2	 -3	   -4	 2.5   3.5	2	3	3	4	2.5	 3.5  3	-4	 -4.5	-3	-4	 -2	  -1.5	-3	-3	-2      0   1   -1  0   0   1   0  1   2   0    1   0  1   0   0    1];

%   Urceni tridy prislusnoti   
T = [ 1	 1	1	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0;
   	  0  0  0	0	0	0	1	1	1	1	1	1	1	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0   0   0   0   0   0   0   0   0   0   0   0   1   1   1   1   1;
      0	 0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	1	1	1	1	1	1	0	0	0	0	0	0	0	0	0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0;
      0	 0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	1	1	1	1	1	1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0;
      0  0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   1   1   1   1   1   0   0   0   0   0   0   0   0   0   0;
      0  0  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   1   1   1   1   0   0   0   0   0];

%   Vykresleni trenovacich dat
figure(1)
plot(P(1,1:6),P(2,1:6),'ob')
grid on
axis([-6 6 -6 6])
hold on
plot(P(1,7:15),P(2,7:15),'xr')
plot(P(1,16:24),P(2,16:24),'*g')
plot(P(1,25:33),P(2,25:33),'dk')
plot(P(1,34:39),P(2,34:39),'^c')
plot(P(1,40:44),P(2,40:44),'hm')
plot(P(1,45:49),P(2,45:49),'xr')
xlabel('x')
ylabel('y')
legend('Trida A','Trida B','Trida C','Trida D','Trida E','Trida F')
title('Vstupni treninkova data','fontsize',12)
   

%   Parametry neuronove site   
skryte1=12;                %   pocet neuronu ve skryte1 vrstve
skryte2=15;               %   pocet neuronu ve skryte2 vrstve
vystup=6;               %   pocet neuronu ve vystupni vrstve
pocet_epoch=200;        %   pocet epoch   
pf_skryte1='logsig';      %   prenosova funkce skryte1 vrstvy (sigmoida)
pf_skryte2='logsig';     %   prenosova funkce skryte2 vrstvy (sigmoida)
pf_vystup='purelin';    %   prenosova funkce vystupni vrstvy (line�rn�... vystup odpovida vstupu s oriznutim 0 a� jedna)
 
    
%   Vytvoreni neuronove site
net = newff([-6,6;-6,6],[skryte1,skryte2,vystup],{pf_skryte1 pf_skryte2 pf_vystup});    % funkce newff je pro klasick� v�cevrstv� perceptron
                                                                                        % prvn� agrument je vstup (vid�me dva vstupy od -6 a� 6.. to znamen� plocha)
                                                                                        % druh� argumnt jsou informace o po�et neuron� v prvn� skryt�, druh� skryt� a v�stupn� vrstv�
                                                                                        % t�et� argument jsou p�enosov� funkce ve v�stupn�, resp. skryt�ch vrstv�ch                                                                                        
net.trainParam.epochs = pocet_epoch; % nastavuji po�et epoch

net = train(net,P,T);   % a zpust�m funkci tr�nuj!.. ta veme tr�ninkovou mno�inu a zkou�� tr�novat dokud neklesne chyba pod nastavenou hodnotu, nebo nedud�l� po�adovan� po�et epoch
                        % funguje to klasicky, p�edlo�� pozici z tr�ninkov� mno�iny a �ekne j� jestli to m� b�t mno�ina A, B, C nebo D a pomoc� backpropagation se p�enastavuj� v�hy

%   Vytvoreni souradnic 2D prosotru [x,y]
[A,B] = meshgrid(-6:0.3:6); % 2D matice -6 a� 6 s krokem 0.3 (to znamen� 41x41 bod�)  

%   Vytvoreni matice pro simulaci (testovani) site
test = [(A(:))';(B(:))']; % vytvo��m z toho t� 2D matice pouze dva ��dky, aby rozm�rov� odpov�dala t� tr�ninkov� mno�in� P (ten vstup)

%   Simulace site
Y = sim(net,test); % sim je funkce kter� veme tu na�� s� "net" a ty na�e vytvo�en� testovac� data "test" a vr�t� n�m prakticky ten v�stup (ur�en� t��dy T)

%   Uprava vystupnich hodnot site pro vykresleni (vemu si v�dycky jenom ty v�sledky jako�e z jedn� mno�iny (jidni�ka zanemn� ano, tady je ta mno�ina a nula znamen� �e tam ta mno�ina nen�) a tyhle data si pak nech�m vykreslit 3D)
a = reshape(Y(1,:), 41,41); %   trida A
b = reshape(Y(2,:), 41,41); %   trida B
c = reshape(Y(3,:), 41,41); %   trida C
d = reshape(Y(4,:), 41,41); %   trida D
e = reshape(Y(5,:), 41,41); %   trida E
f = reshape(Y(6,:), 41,41); %   trida F

z = [-2 ; -2; -2; -2; -2; -2; -2; -2; -2; -2];

bottom = min(min(Y))
top = max(max(Y))


%   Vykresleni vystupnich hodnot pro jednotlive tridy
figure(2)
subplot(2,3,1)
surf(A,B,a)
hold on;
plot3(P(1,1:6),P(2,1:6),z(1:6),'ob')
xlabel('x')
ylabel('y')
zlabel('z')
title('Vystup - trida A','fontsize',12)
axis([-6 6, -6 6, -2 2])
caxis manual
caxis([bottom top]);

subplot(2,3,2)
surf(A,B,b)
hold on;
plot3(P(1,7:15),P(2,7:15),z(1:9),'xr')
plot3(P(1,45:49),P(2,45:49),z(1:5),'xr')
xlabel('x')
ylabel('y')
zlabel('z')
title('Vystup - trida B','fontsize',12)
axis([-6 6, -6 6, -2 2])
caxis manual
caxis([bottom top]);

subplot(2,3,3)
surf(A,B,c)
hold on;
plot3(P(1,16:24),P(2,16:24),z(1:9),'*g')
xlabel('x')
ylabel('y')
zlabel('z')
title('Vystup - trida C','fontsize',12)
axis([-6 6, -6 6, -2 2])
caxis manual
caxis([bottom top]);

subplot(2,3,4)
surf(A,B,d)
hold on;
plot3(P(1,25:33),P(2,25:33),z(1:9),'dk')
xlabel('x')
ylabel('y')
zlabel('z')
title('Vystup - trida D','fontsize',12)
axis([-6 6, -6 6, -2 2])
caxis manual
caxis([bottom top]);

subplot(2,3,5)
surf(A,B,e)
hold on;
plot3(P(1,34:39),P(2,34:39),z(1:6),'^c')
xlabel('x')
ylabel('y')
zlabel('z')
title('Vystup - trida E','fontsize',12)
axis([-6 6, -6 6, -2 2])
caxis manual
caxis([bottom top]);

subplot(2,3,6)
surf(A,B,f)
hold on;
plot3(P(1,40:44),P(2,40:44),z(1:5),'hm')
xlabel('x')
ylabel('y')
zlabel('z')
title('Vystup - trida F','fontsize',12)
axis([-6 6, -6 6, -2 2])
caxis manual
caxis([bottom top]);




