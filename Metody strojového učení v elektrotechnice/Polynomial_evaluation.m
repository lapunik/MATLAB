function [t_w] = Polynomial_evaluation(x,w)

M = length(w)-1;
N = length(x);

t_w = zeros(1,N);

for i = 0:M
    t_w = t_w + w(i+1)*(x.^i);
end

end

