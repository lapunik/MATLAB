r1=input('Zadej hodnotu rezistoru R1 v kOhm:');
r2=input('Zadej hodnotu rezistoru R2 v kOhm:');
c1=input('Zadej hodnotu kondenzatoru C1 v nF:');
c2=input('Zadej hodnotu kondenzatoru C2 v nF:');
name = input('Zadej název a hodnotu kondenzátoru C2: ', 's');
str = {'R_1=10 k\Omega';'R_2=10 k\Omega';'C_1=10 nF';[name ,'=',num2str(c2),' nF']};
annotation('textbox',[0.85 0.75 0.3 0.15],'String',str,'FitBoxToText','on','BackgroundColor',[0.9  0.9 0.9],'Color',[0.84 0.16 0]);
f=[40 63 100 150 250 400 630 1000 1500 2500 4000 6300 10000 15000 25000 40000 63000 100000];
w=2.*pi.*f;
Fjw=1./(1+1i.*w.*(r1.*c2.*10e-6+c2.*r2*10e-6)+w.*w.*r1.*r2.*c1.*c2.*10e-12);
Fjwabs=1./sqrt((1-(w.^2.*(r1.*10.^3).*(r2.*10.^3).*(c1.*10.^(-9)).*(c2.*10.^(-9)))).^2+(w.*(c2.*10.^(-9)).*((r1.*10.^3)+(r2.*10.^3))).^2);
A1=20.*log10(Fjwabs);
semilogx(f,A1,'r')
axis([0,150000,-80,10])
xlabel('f [Hz]')
ylabel('A [dB]')
title(['Amplitudová frekvencni charakteristika pro kondenzátor ',name,'=',num2str(c2),' nF'])
grid on