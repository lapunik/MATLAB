function didudt = RLC(t,iu)
% iu je vektor kde je hodnota jak i tak u, proto ji ve funkci euler volam
% y(1,:), abych nahrál "všechny"
U0= 10;
L = 1e-3;
R = 1;
C = 1e-6;

i = iu(1);
u = iu(2);

didt = (-R/L)*i - u/L + U0/L;
dudt = i/C;

didudt = [didt,dudt]; 
end