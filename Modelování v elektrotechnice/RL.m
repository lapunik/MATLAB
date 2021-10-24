function didt = RL(t,i)
U0= 10;
L = 1e-3;
R = 1;

didt = (-R/L)*i  + U0/L;
end