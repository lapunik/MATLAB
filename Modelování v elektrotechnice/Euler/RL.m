function didt = RL(t,i)
U0= 10;
L = 3e-3;
R = 10;

didt = (-R/L)*i  + U0/L;
end