N = 20;                         % počet vzorků
% x = 1:N-1;
% t = awgn(5.*x+2,0.5);
x = 0:((2*pi)/(N-1)):2*pi;      % vzorkovací čas
t = awgn(sin(x),15);            % naměřená data
M = 3;                          % řád polynomu

figure()
plot(x,t,'k--o');               % vykreslení naměřených dat
hold on;
plot(x,sin(x),'b')              % vykreslení původní funkce

% for M = 1:9
    t_w(i) = Polynomial_regression(x,t,M); % výpočet aproximace
% end

plot(x,t_w,'r');                % vykreselní aproximace