function [vysledek] = mocnina(x,n)
vysledek = x;    
for i = 2:n
    vysledek = vysledek*x; 
end
end

