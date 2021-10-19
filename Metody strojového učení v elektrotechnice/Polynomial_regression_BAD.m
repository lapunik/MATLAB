function [t_w] = Polynomial_regression_BAD(x,t,M) 
%   x:      vzorkovací čas
%   t:      naměřenné vzorky
%   M:      řád polynomu
%   t_w:    aproximace  

N = length(x);

syms w [1,M+1];                                 % příprava koeficientů
y_x = sym(zeros(1,N));                          % příprava teoretických vzorků 

for i = 1:N                                     % pro všechny prvky x (v každém čase) 
    for j = 0:M                                 % vypočítej sumu přes daný řád polynomu
        y_x(i) = y_x(i) + ((w(j+1))*(x(i)^j));  % podle rovnice (x^j*w_j)
    end
end

E_w = ((sum((y_x - t).^2))./2);                 % uplatnění metody nejmenších čtverců  

for i = 1:(M+1)                  
    d_ch(i) = diff(E_w,w(i));                   % výpočet parciálních derivací podle všech koeficientů w
end                                             % pozn. nevím jestli tady nehledám nějaký inflexní body místo minim

w_sym = struct2cell(solve(d_ch,w));             % řešení M soustavy rovnic o M neznámých
                                                % (hledání koeficientů kde parciální derivace = 0)        
                                                % + převedení ze struktury na cell 
for i = 1:(M+1)
    w_arr(i) = w_sym{i};
    w_double(i) = double(w_arr(i));             % přesné hodnoty koeficientů
end    

t_w = zeros(1,N);                               % příprava výstupnách vypočítaných hodnot pro fittovanou křivku  

for i = 1:N                                     % výpočet všech výstupních hodnot podle rovnice při dosazení zjištěných koeficientů w
    for j = 0:M
        t_w(i) = t_w(i) + ((w_double(j+1))*(x(i)^j));
    end
end

end

