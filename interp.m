clf;

x = [-1:0.01:1];

% T = cos(n * acos(x))
if n == 1
	T = [2 0 -1];
elseif n == 2
	T = [4 0 -3 0];
elseif n == 10
	T = [1024 0 -2816 0 2816 0 -1232 0 220 0 -11 0];
else
	disp('Unsupported value of n');
	return;
end

if cheby ~= 0
	xn = roots(T);
	coeffs = polyfit(xn, exp(xn), n);
else
	xn = [-1:2/n:1];
	coeffs = polyfit(xn, exp(xn), n);
end

f = exp(x);
p = polyval(coeffs, x);

% plot stuff
subplot (2, 1, 1);
axis([-1, 1, 0, 3]);
hold on;

plot(x, f);
plot(xn, exp(xn), 'o');
plot(x, p, '--');

subplot (2, 1, 2);
axis([-1, 1, -1, 1]);
hold on;

plot(x, zeros(length(x)));
plot(x, f - p);