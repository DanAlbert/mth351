% This script draws intermediary tangent lines while evaluating Newton’s
% method. This can be used to determine why the program is not converging.
f = 'x + exp(1).^(-B*x.^2)';
fprime = '1 - 2*B*x*exp(1).^(-B*x^2)';

clf
hold on
xr = -2 : 0.05 : 2;
yr = -2 : 0.05 : 2;
plot(xr, zeros(size(xr)), zeros(size(yr)), yr);
axis([-2, 2, -2, 2]);
title('Plot of x + e\^(-Bx^2)');
xlabel('x');
ylabel('y');

B = 50; % vary this as necessary
x = xr;
y = eval(f);
plot(x, y);

maxiter = 20;

x = 0;

iters = [x];

for k = 1 : maxiter,
	xnew = x - eval(f) ./ eval(fprime);
	y = eval(fprime) * (xr - x) + eval(f);
	plot(xr, y);
	iters = [iters; xnew];
	test = abs(xnew - x) ./ (abs(xnew) + eps);
	if max(test) < 10 * eps,
		break;
	end;
	x = xnew;
end

format long
B
iters
format
