function[x, y, tau, total_iteration]=aeuler_PID(fce,xa,xb,y0,h,absolutni_tolerance,relativni_tolerance)

% zdrojov� materi�ly:
% ZDROJ 1: (str. 7) http://www.maths.lth.se/na/staff/gustaf/numart.pdf
% ZDROJ 2: (str. 3) method https://core.ac.uk/download/pdf/82070889.pdf 

%---------------------------------------------
epsilon = 0.8;
order = 1;
EPS = order+1; % EPS = krit�rium pro ��zen� m�stn� chyby (EPUS by byl bez + 1)  
p_constant = 0.4/EPS;
i_constant = 0.3/EPS;
d_constant = -(i_constant/4)-(p_constant/2); % for order 1

% pro� jsou konstany jak� jsou? ZDROJ 1 str. 10 a� str. 18

%---------------------------------------------
y = [y0]; % nastaven� po��te�n� hodnoty y
x = [xa]; % nastaven� po��te�n� hodnoty x
firststep = true; % p��znak prvn�ho pr�b�hu algoritmu v ka�d� iteraci "i"
secondstep = false;
total_iteration = 0; % celkov� po�et iterac�
i = 1; % sou�asn� iterace
while(x(i) < xb)
    
    total_iteration = total_iteration + 1;
    
    if (h > xb - x(i)) % aby v�po�et nep�ekro�il xb
        h = xb - x(i) ;
    end
    
    % Euler pro krok h
    y0 = y(i,:) + fce(x(i), y(i,:))*h;
    
    % Euler pro dva kroky h/2
    y1 = y(i,:) + fce(x(i), y(i,:))*(h/2);
    y2 = y1 + fce(x(i)+(h/2), y1)*(h/2);
    
    
    difference=y0-y2; % v�po�et odhadu odchylky
    r_n=max(1e-10,abs(difference)./(absolutni_tolerance+abs(y0)*relativni_tolerance)); % v�po�et normovan�ho odhadu odchylky
    
    % Testov�n� normovan�ho odhadu odchylky
    if(r_n<=1)
        % Ulo�en� vypo��tan�ch hodnot do vektor�
        x(i+1)=x(i)+(h);
        y(i+1,:)=y2;
        tau(i) = difference;
        
        
        if(firststep)
            % Nastaven� nov�ho kroku na z�klad� normovan�ho odhadu odchylky
            h=h*((epsilon/r_n)^(1/EPS));
            firststep=false;
            secondstep = true;
        elseif(secondstep)
            % Nastaven� nov�ho kroku na z�klad� normovan�ho odhadu odchylky, normovan�ho odhadu odchylky p�ede�l�ho kroku a PID konstant
            % je�t� nem�m dva kroky zp�t, proto ud�l�m jen PI vylep�en�
            h=h*((epsilon/r_n)^(i_constant+p_constant)*(epsilon/r_n_minus_1)^(-p_constant));
            secondstep = false;
        else
            % Tady u� predikuju pomoc� PID 
            % PI: h=h*((epsilon/r_n_plus_1)^(i_constant)*(r_n/r_n_plus_1)^(p_constant));
            % PI vylep�en�:
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
        % pokud odhad odchylky nepro�el, zemn��me krok na z�klad� normovan�ho odhadu odchylky
        h=h*((epsilon/r_n)^(1/EPS));
    end
end
end