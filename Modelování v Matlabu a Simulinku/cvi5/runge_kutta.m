function [x, y] = runge_kutta(fce, xa, xb, y0, n)
h = (xb-xa)/n; % vypocet kroku deleni

y = [y0]; x = [xa]; % vytvoreni vektoru zavisle a nezavisle promenne

for i = 1:n % odhady derivaci resene soustavy
    
    % Luxusní video s vysvětlením: https://www.youtube.com/watch?v=N1OLcUykYPc&list=PLQL6z4JeTTQkwtPu1NsE14Y30SZv7hlQW&index=8
    k_1 = fce(x(i), y(i,:));
    k_2 = fce(x(i) + 1/2*h, y(i,:) + 1/2*h*k_1);
    k_3 = fce(x(i) + 1/2*h, y(i,:) + 1/2*h*k_2);
    k_4 = fce(x(i) + h, y(i, :) + k_3*h);

    % vypocet reseni v novem kroku
    y(i+1,:) = y(i,:) + h*(k_1 + 2*k_2 + 2*k_3 + k_4)/6;
    x(i+1) = x(i) + h;
end
end


