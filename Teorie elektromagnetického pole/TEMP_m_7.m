N = 400;
mi = 4 * pi *(10^(-7)) * 2500;
l = 15;
I = 20;
R = 0.04;

L = ((N^2)*mi*pi*(R^2))/l;

Wm = L*(1/2)*(I^2);

Fl = -(((N*I*R)^2)*mi*pi)/(2*(l^2));

FR = (((N*I)^2)*mi*pi*R)/l;