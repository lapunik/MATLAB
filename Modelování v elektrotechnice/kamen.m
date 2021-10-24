function [] = kamen()
figure()
for iter = 0:0 % mám víc lidí

g = 9.8;
m = 0.5; % kg
uhel = 40; % stupnì
F = 5; % N
vyska_postavy = 1.85;

budova = (vyska_postavy+0.1)*iter; % mám víc lidí, každý hází z budov o 10m vyšší

% pocatecni podminky reseni
a = F/m;

uhel = (uhel/180)*pi; % pøevedení úhlu ve stupních na radiány

ax0 = a*cos(uhel);
ay0 = a*sin(uhel);

vx0 = 0;
vy0 = 0;

sy0 = vyska_postavy + budova;
sx0 = 0;


% vx0 = 0;
% vy0 = 0;
% numericke reseni soustavy
%[t, sv] = runge_kutta(@rce, 0, 1, [sx0,sy0, vx0,vy0], 1e3);
[t, sva] = runge_kutta(@rce, 0,100, [sx0, sy0,vx0,vy0, ax0,ay0], 1e3);

% nacteni velicin z vektoru reseni
sx = sva(:,1);
sy = sva(:,2);
vx = sva(:,3);
vy = sva(:,4);
ax = sva(:,5);
ay = sva(:,6);


% vykresleni vysledku reseni
%figure()
hold on
plot(sx, sy, '--k')

%plot([x1,x2], [y1,y2], 'k'); % primka vzor
%plot([0, (11/10)*max(sv(:,1))], [0, 0], 'g') % nakresli zem

plot([0,  (11*max(sx))/10], [0, 0], 'g') % nakresli zem

plot([-0.85, 0], [vyska_postavy/3, vyska_postavy] + budova, 'k') % nakresli ruce
plot([-0.5, -0.5], [vyska_postavy/3, (2*vyska_postavy/3)]+ budova, 'k') % nakresli telo
plot([-0.75, -0.5], [0, vyska_postavy/3]+ budova, 'k') % nakresli nohu1
plot([-0.5, -0.25], [vyska_postavy/3, 0]+ budova, 'k') % nakresli nohu2

plot([-1,-1], [0,budova], 'k'); % nakresli budovu
plot([-1,0], [budova,budova], 'k'); % nakresli budovu
plot([0,0], [0,budova], 'k'); % nakresli budovu

plot((0.25*cos(linspace(0, 2*pi, 100)))-0.5, 0.25*sin(linspace(0, 2*pi, 100))+((((2*vyska_postavy)/3)+0.24)+ budova), 'k')

xlim([-1, (11*max(sx))/10])
% ylim([0,(11*max(sy)/10)])
xlabel('x (m)')
ylabel('y (m)')
end
end


    % definice resene soustavy rovnic
    function dsvadt = rce(t, sva) 
      
    g = 9.8;
        
         dsvadt(1) = sva(3);
         dsvadt(2) = sva(4);
         dsvadt(3) = sva(5);
         dsvadt(4) = sva(6);
         dsvadt(5) = 0;
         dsvadt(6) = -g;
         
         if(sva(2)<0) % pokud jsi na zemi stuj
          dsvadt(1) = 0;
          dsvadt(2) = 0;


         
         end
        

    end