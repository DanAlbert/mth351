v = poly(1:n);
vpert = v; vpert(2) = vpert(2) + epsilon;
r = roots(v);
rpert = roots(vpert);

format long
[sort(r(:)) sort(rpert(:))]
format

dx = 0.05; x = 0 : dx : n+1;
y = polyval(v, x);
ypert = polyval(vpert, x);
perturbation = epsilon * x.^(n-1);

n1 = 1+(1/dx); n2 = 1+(n/dx);
maxy = max(abs(y(n1:n2)));
maxypert = max(abs(ypert(n1:n2)));
maxperturb = max(abs(perturbation(n1:n2)));
maxy = 1.1 * max([maxy, maxypert, maxperturb]);

plot(x, y, x, ypert, '--', x, perturbation, ':', x, zeros(size(x)), '-', 1:n, zeros(1,n), 'o')
axis([0 n+1 -maxy maxy])
s = ['n = ', num2str(n), ', \epsilon = ', num2str(epsilon)];
title(s)
