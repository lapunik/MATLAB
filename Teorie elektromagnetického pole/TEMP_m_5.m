l = 15 * (10^-2);
S1 = 5 * (10^-4);
S3 = S1;
S2 = 3 * (10^-4);
I = 15;
N = 100;

mir = 5000;
mi0 = 4*pi*(10^-7);
mi = mi0*mir;

Rm1 = l/(S1*mi);
Rm2 = l/(S2*mi);
Rm3 = l/(S3*mi);

Rm = (((1/Rm1)+(1/Rm3))^(-1)) + Rm2;

Fi = (N*I)/(Rm);

Fi1 = Fi*(Rm3/(Rm3+Rm1));

Fi3 = Fi - Fi1;

L = (N^2)/Rm*(10^3);