function [] = separator()

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
        dsvdt(4) = -g;
        
        if(sv(2)<-1) % pokud jsem mimo elektrody, uz mi nepusobi
        dsvdt(3) = 0;
        end
        

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
plot(sx, sy)
hold on
plot([-d/2, -d/2], [0, -l], '-b')
plot([d/2, d/2], [0, -l], '-r')
xlim([-0.2, 0.2])
ylim([-1.5, 0])
xlabel('x (m)')
ylabel('y (m)')
end