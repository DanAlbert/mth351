f = 'x + exp(1).^(-B.*x.^2)';
fprime = '1 - 2*B.*x.*exp(1).^(-B.*x.^2)';

clf
hold on
x = -2 : 0.05 : 2;
y = -2 : 0.05 : 2;
plot(x, zeros(size(x)), zeros(size(y)), y);
axis([-2, 2, -2, 2]);
title('Plot of x + e\^(-Bx^2)');
xlabel('x');
ylabel('y');

beta = [1, 5, 10, 25, 50];
for B = beta
    y = eval(f);
    plot(x, y);
end

maxiter = 20;

x = [-0.7, -0.5, -0.4, -0.3, -0.2];

iters = x;

B = beta;
for k = 1 : maxiter,
	xnew = x - eval(f) ./ eval(fprime);
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
