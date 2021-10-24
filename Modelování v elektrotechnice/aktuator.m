function [] = aktuator()

Q = 10^(-9);
m = 10^(-3);
U = 45000;
d = 0.1;
l = 1;
g = 9.8;

    % definice resene soustavy rovnic
    function dsvdt = rce(t, sv)       
        dsvdt(1) = sv(3);
        dsvdt(2) = sv(4);
        dsvdt(3) = (U*Q)/(d*m);
        dsvdt(4) = g;
    end

% pocatecni podminky reseni
sy0 = 0;
sx0 = 0;
vx0 = 0;
vy0 = 0;
% numericke reseni soustavy
[t, sv] = runge_kutta(@rce, 0, 1, [sx0,sy0, vx0,vy0], 1e3);

% nacteni velicin z vektoru reseni
sx = sv(:,1);
sy = sv(:,2);
vx = sv(:,3);
vy = sv(:,4);

% vykresleni vysledku reseni
figure()
subplot(1, 2, 1);
plot(t, s);
xlabel('t (s)');
ylabel('s (m)');

subplot(1, 2, 2);
plot(t, v);
xlabel('t (s)');
ylabel('v (m/s)');
end
