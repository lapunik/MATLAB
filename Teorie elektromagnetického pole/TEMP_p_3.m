a = 0.1;
b = 0.2;
h = 0.3;
v = 0.5;
mi = 4 * pi * (10^-7);
Im = 20;
I = 2000; 
omega = 2000;

M = ((mi*h)/(2*pi))*(log((a+b)/a))*(10^9) ;

uit = ((Im*mi*h)/(2*pi))*(log((a+b)/a))* sin(pi/2)*omega*(10^3) ;

t = 0;

uip = -((I*mi*h*v)/(2*pi))*((1/(a+b-v*t))-(1/(a-v*t)))*(10^3);