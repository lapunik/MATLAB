% Metoda nejvetsiho spadu pro kvadraticke funkce, dim = 5

x=zeros(5,1); H=zeros(5); d=ones(5,1); krok=0;

for i=1:5
   for j=1:5
      H(i,j)=1/(i+j-1);
   end
end

g=-d;

while norm(g)>0.0001

krok=krok+1;
alfa=(g'*g)/(g'*H*g);
x=x-alfa*g;
g=g-alfa*H*g;

end
