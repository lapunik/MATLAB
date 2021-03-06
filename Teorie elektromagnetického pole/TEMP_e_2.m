Q = 0.1 * 10^(-6);
S1 = 6 * 10^(-4);
S2 = 6 * 10^(-4);
d = 0.8 * 10^(-2);
er1 = 3;
er2 = 2.7;
e0 = 8.85 * 10^(-12);

e1 = er1*e0;
e2 = er2*e0;

E = Q/((e1*S1)+(e2*S2));

%U = 400;

%E = U/d; 

EMV_m =E * (10^(-6));
EkV_m =E * (10^(-3));

Q1 = E*S1*e1;
Q2 = E*S2*e2;
Q1nC = Q1 * (10^(9));
Q2nC = Q2 * (10^(9));

C = ((S1*e1)+(S2*e2))/d; 
CpF = C * (10^(12));

W = (1/2)*C*(E*d)^2;
WuJ = W* 10^(6);
WmJ = W* 10^(3);