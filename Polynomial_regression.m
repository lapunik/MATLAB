function [t_w,w,e,E_w] = Polynomial_regression(x,t,M,lambda) 
%   x:          vzorkovací čas
%   t:          naměřenné vzorky
%   M:          řád polynomu
%   lambda:     regularizační člen
%   t_w:        body aproximace pro vstupní hodnoty x
%   w:          koeficienty aproximačního polynomu
%   e:          rozdíl bodů aproximační funkce a naměřených výstupů
%   E_w:        velikost druhých mocnin rozdílů e (metoda nejmenších čtverců)

N = length(x);          % počet pozorování

Phi_T_x_Phi = zeros(M+1,M+1);     % matice (Phi'*Phi), kde Phi je matice bázových funkcí 
Phi_T_x_t = zeros(1,M+1);       % matice (Phi'*t), kde t je vektor výstupů

for j = 0:M
    for i = 0:M
        if(i == 0 && j == 0)
            Phi_T_x_Phi(i+1,j+1) = N; % + lambda; co jsem tak pochopil, tak sem není vhodný dávat + lambda
            continue;
        else    
            Phi_T_x_Phi(i+1,j+1) = sum(x.^(i+j)); % sestavení matice (Phi'*Phi), kde phi_m = w_m*x^m  
            if(i == j)
                Phi_T_x_Phi(i+1,j+1) = Phi_T_x_Phi(i+1,j+1) + lambda;
            end
        end
    end
    Phi_T_x_t(j+1,1) = sum((x.^(j)).*t); 
end

w = Phi_T_x_Phi\Phi_T_x_t;      % koeficienty vypočeteného polynomu

t_w = Polynomial_evaluation(x,w);

e = (t - t_w);              % odchylky od naměřených dat
E_w = (1/2)*(sum(e.^2));    % suma z odchylek na druhou

end
