%-- VARIABLE -------------------------------------------------------------
casovy_krok = [0.1 0.1 (10/3) 0.1 0.1]; 
doba_simulace = [10 10 10 10 11];
pocatecni_hodnota = [0 0 2 0 0];
rovnice = [];
%-------------------------------------------------------------------------

%-- EQUATION AND COEFFICIENT ---------------------------------------------
U0 = 10; 
R = 4; 
L = 8;
rovnice{1} = @(x)((-R/L)*x) + (U0/L);

U0 = 15; 
R = 4; 
L = 8;
rovnice{2} = @(x)((-R/L)*x) + (U0/L);

U0 = 10; 
R = 2; 
L = 8;
rovnice{3} = @(x)((-R/L)*x) + (U0/L);

U0 = 10; 
R = 4; 
L = 0.27;
rovnice{4} = @(x)((-R/L)*x) + (U0/L);

I0 = 5; 
R1 = 4;
R2 = 5;
L = 8;
rovnice{5} = @(x) (R2*R1*(I0-x))/((R1+R2)*L);

%-------------------------------------------------------------------------
DifferentialEquation_First_Order_Solver_Vector(rovnice,casovy_krok,doba_simulace,pocatecni_hodnota);
%{
function dxdt = rce(t,i)
if(t<0.5)
U0 =10;
else
U0 =0; 
end   

return dxdt = ((-R/L)*x) + (U0/L);

end
%}