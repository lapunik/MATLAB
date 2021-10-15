% jak na řešení soustavy lineárních rovnic:
% soustavu rovnic si upravím do formátu, kde jsou proměnné na levé straně a konkrétní hodnoty na straně druhé

% např: (před:)     2*x1 = 24         (po:)       2*x1 = 24
%                   2*x1-2*x2 = x3                2*x1-2*x2-x3 = 0 
%                   2*x2 = x3                     2*x2-x3 =0

% následně převedu do maticového zápisu

% A*x = B, kde A jsou koeficienty, B jsou konstanty a x jsou neznámé

A = [2  0  0;...
     2 -2 -1;...
     0  2 -1];

B = [24;...
      0;...
      0];

% rovnici A*x=B lze přepsat do podoby x = A\B
% aplikací této rovnice získáme vektor koeficientů "x"

x = A\B 
