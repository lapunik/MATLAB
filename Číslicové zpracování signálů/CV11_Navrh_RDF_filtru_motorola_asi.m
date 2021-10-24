% 80 až 100 koeficientù



fs = 31250 *2 *pi; % 31.25 kHz jsme si vybrali (A = 16, B = 10)
N = 79;
frekvence_zlomu = 6250; % 6.250 kHz chci aby to zaèlo tlumit.. je to jedno
omega_c = frekvence_zlomu/(fs/2); 
h = fir1(N,omega_c); % impulyni odeyva
figure(1);
freqz(h,1,1024,fs);
figure(2);
zplane(h);
figure(3);
plot(h);

% h = <-0,05,0,24>

h_integer_bez_zaokrouhleni = h * 32768;
h_integer = round(h_integer_bez_zaokrouhleni);

figure(1);
freqz(h_integer,1,1024,fs);
figure(2);
zplane(h_integer);
figure(3);
plot(h_integer);