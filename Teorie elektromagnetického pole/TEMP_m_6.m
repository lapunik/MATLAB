mir = 5000;
mi0 = 4*pi*(10^-7);
mi = mi0*mir;

N = 500;
rs = 0.04;
delta = 3 *(10^-3);
Bo = 0.9;
S = 2 *(10^-4);

I = (Bo/(mi0*N))*(delta+(((2*pi*rs)-delta)/mir));

L = ((Bo*N*S)/I) * (10^3);
