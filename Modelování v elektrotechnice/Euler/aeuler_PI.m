function[x, y, tau]=aeuler_PI(fce,xa,xb,y0,h,absolutni_tolerance,relativni_tolerance)

% zdrojové materiály:
% ZDROJ 1: (str. 7) http://www.maths.lth.se/na/staff/gustaf/numart.pdf
% ZDROJ 2: (str. 3) method https://core.ac.uk/download/pdf/82070889.pdf 

epsilon = 0.8;
order = 1;
EPS = order+1; % EPS = kritérium pro øízení místní chyby (EPUS by byl bez + 1)  
p_constant = 0.4/EPS;
i_constant = 0.3/EPS;

% proè jsou konstany jaké jsou? ZDROJ 1 str. 10 až str. 18

y = [y0]; % nastavení poèáteèní hodnoty y
x = [xa]; % nastavení poèáteèní hodnoty x
firststep = true; % pøíznak prvního prùbìhu algoritmu v každé iteraci "i"
i = 1; % souèasná iterace
while(x(i) < xb)
        
    if (h > xb - x(i)) % aby výpoèet nepøekroèil xb
        h = xb - x(i) ;
    end
    
    % Euler pro krok h
    y0 = y(i,:) + fce(x(i), y(i,:))*h;
    
    % Euler pro dva kroky h/2
    y1 = y(i,:) + fce(x(i), y(i,:))*(h/2);
    y2 = y1 + fce(x(i)+(h/2), y1)*(h/2);
    
    
    difference=y0-y2; % výpoèet odhadu odchylky
    r_n=max(1e-10,difference/(absolutni_tolerance+y0*relativni_tolerance)); % výpoèet normovaného odhadu odchylky, pokud je menší než 1^-10, tak použij právì tuto hodnotu
    
    % Testování normovaného odhadu odchylky
    if(r_n<=1)
        % Uložení vypoèítaných hodnot do vektorù
        x(i+1)=x(i)+(h);
        y(i+1,:)=y2;
        tau(i,:) = difference;
        
        
          if(firststep)
            % Nastavení nového kroku na základì normovaného odhadu odchylky
            h=h*((epsilon/r_n)^(1/EPS));
            firststep=false;
          else
            % Nastavení nového kroku na základì normovaného odhadu odchylky, normovaného odhadu odchylky pøedešlého kroku a PI konstant
            h=h*(((epsilon/r_n)^(i_constant))*((r_n_minus_1/r_n)^p_constant));
        end
        r_n_minus_1=r_n;
        i=i+1;
    else
        % pokud odhad odchylky neprošel, zemnšíme krok na základì normovaného odhadu odchylky
        h=h*((epsilon/r_n)^(1/EPS));
    end
end
end