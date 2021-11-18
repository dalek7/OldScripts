function y = gaussian(x, m, sig)

y = zeros(length(x),1);

for i = 1 : length(x)

    p = -1* (x(i) - m)^2 / (2* sig^2);
    y(i) = exp(p);
end
