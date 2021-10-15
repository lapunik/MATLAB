N = 20; 
x = 1:N-1;
t = awgn(5.*x+2,0.5);

N = length(x);          % počet naměřených dat
M = 2;                  % řád polynomu

figure()
plot(x,t,'ko');
hold on;

A = zeros(M+1);
B = zeros(M+1,1);

for i = 1:M+1
    for j = 1:M+1
    
        if i == 0 && j == 0
            A(i,j) = N;
            continue;
        end
        A(i,j) =  sum(x.^(i+j-2));
    end
    B(i) = sum(x.^(i-1).*t);
end

A
B
a = A\B
 
t = polyval(a,x);

plot(x,t,'b');