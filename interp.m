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

subplot (2, 1, 1);
hold on;

% plot e^x
plot(x, exp(x));
axis([-1, 1, 0, 3]);

% plot polynomial interpolation of e^x
xn = [-1:2/n:1];
coeffs = polyfit(xn, exp(xn), n);
plot(x, polyval(coeffs, x));

subplot (2, 1, 2);
hold on;

% plot e^x
plot(x, exp(x));
axis([-1, 1, 0, 3]);

% plot Chebyshev interpolation of e^x
xn = roots(T);
coeffs = polyfit(xn, exp(xn), n);
plot(x, polyval(coeffs, x));