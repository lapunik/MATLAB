function didt = RL(t,i_L,U_0,R,L)
% U_0 = 5;
% L = 1e-3;
% R = 100;
didt = (-R/L)*i_L  + U_0/L;
end