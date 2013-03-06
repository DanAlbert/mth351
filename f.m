function [ y ] = f(x)
    sigma = 1;
    mu = 0;
    y = 1 / (sigma * sqrt(2 * pi)) * exp((-1/2) * ((x - mu)/sigma)^2);
end
