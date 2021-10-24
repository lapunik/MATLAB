function[x, y, tau, total_iteration]=aeuler_PID(fce,xa,xb,y0,h,absolutni_tolerance,relativni_tolerance)

% zdrojové materiály:
% ZDROJ 1: (str. 7) http://www.maths.lth.se/na/staff/gustaf/numart.pdf
% ZDROJ 2: (str. 3) method https://core.ac.uk/download/pdf/82070889.pdf 

%---------------------------------------------
epsilon = 0.8;
order = 1;
EPS = order+1; % EPS = kritérium pro øízení místní chyby (EPUS by byl bez + 1)  
p_constant = 0.4/EPS;
i_constant = 0.3/EPS;
d_constant = -(i_constant/4)-(p_constant/2); % for order 1

% proè jsou konstany jaké jsou? ZDROJ 1 str. 10 až str. 18

%---------------------------------------------
y = [y0]; % nastavení poèáteèní hodnoty y
x = [xa]; % nastavení poèáteèní hodnoty x
firststep = true; % pøíznak prvního prùbìhu algoritmu v každé iteraci "i"
secondstep = false;
total_iteration = 0; % celkový poèet iterací
i = 1; % souèasná iterace
while(x(i) < xb)
    
    total_iteration = total_iteration + 1;
    
    if (h > xb - x(i)) % aby výpoèet nepøekroèil xb
        h = xb - x(i) ;
    end
    
    % Euler pro krok h
    y0 = y(i,:) + fce(x(i), y(i,:))*h;
    
    % Euler pro dva kroky h/2
    y1 = y(i,:) + fce(x(i), y(i,:))*(h/2);
    y2 = y1 + fce(x(i)+(h/2), y1)*(h/2);
    
    
    difference=y0-y2; % výpoèet odhadu odchylky
    r_n=max(1e-10,abs(difference)./(absolutni_tolerance+abs(y0)*relativni_tolerance)); % výpoèet normovaného odhadu odchylky
    
    % Testování normovaného odhadu odchylky
    if(r_n<=1)
        % Uložení vypoèítaných hodnot do vektorù
        x(i+1)=x(i)+(h);
        y(i+1,:)=y2;
        tau(i) = difference;
        
        
        if(firststep)
            % Nastavení nového kroku na základì normovaného odhadu odchylky
            h=h*((epsilon/r_n)^(1/EPS));
            firststep=false;
            secondstep = true;
        elseif(secondstep)
            % Nastavení nového kroku na základì normovaného odhadu odchylky, normovaného odhadu odchylky pøedešlého kroku a PID konstant
            % ještì nemám dva kroky zpìt, proto udìlám jen PI vylepšený
            h=h*((epsilon/r_n)^(i_constant+p_constant)*(epsilon/r_n_minus_1)^(-p_constant));
            secondstep = false;
        else
            % Tady uø predikuju pomocí PID 
            % PI: h=h*((epsilon/r_n_plus_1)^(i_constant)*(r_n/r_n_plus_1)^(p_constant));
            % PI vylepšený:
            % h=h*((epsilon/r_n_plus_1)^(i_constant+p_constant)*(epsilon/r_n)^(-p_constant));
            % PID:
              h=((h*h)/h_minus_jedna)*((epsilon/r_n)^(i_constant+p_constant+d_constant)*(epsilon/r_n_minus_1)^(-(p_constant+(2*d_constant)))*(epsilon/r_n_minus_2)^(d_constant));
            
        end
        
       if((~secondstep)&&(~firststep))
        r_n_minus_2 = r_n_minus_1;
        h_minus_jedna = h;
       end
        r_n_minus_1 = r_n;
        i=i+1;
    else
        % pokud odhad odchylky neprošel, zemnšíme krok na základì normovaného odhadu odchylky
        h=h*((epsilon/r_n)^(1/EPS));
    end
end
end