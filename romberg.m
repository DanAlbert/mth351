R = zeros(m, m);

for j = 0:m - 1
    for i = j:m - 1
        n = i + 1;
        if j == 0
            if i == 0
                R(i + 1, j + 1) = 1/2 * (b - a) * (f(a) + f(b));
            else
                hn = (b - a)/(2^i);
                sum = 0;
                for k = 1:2^(i - 1)
                    sum = sum + f(a + (2 * k - 1) * hn);
                end
                R(i + 1, j + 1) = 1/2 * R(i, 1) + hn * sum;
            end
        else
            R(i + 1, j + 1) = R(i + 1, j) + (1 / (4^j - 1)) * (R(i + 1, j) - R(i, j));
        end
    end
end