clf
f = [1, 0, 0, -300, -126, 5005];
fpert = [1, 0, 0, -300, -126, 5005.001];
r = roots(f);
rpert = roots(fpert);

format long
[sort(r(:)) sort(rpert(:))]
format

dx = 0.0001; x = -5 : dx : 6;
y = polyval(f, x);
ypert = polyval(fpert, x);

n1 = 1+(-5/dx); n2 = 1+(6/dx);
maxy = max(abs(y));
maxypert = max(abs(ypert));
maxy = 1.1 * max([maxy, maxypert]);

hold on
plot(x, y)
plot(x, ypert, '--')
plot(x, zeros(size(x)), '-')

%axis([-5 6 -maxy maxy]) % f
%axis([-3.90915 -3.9091 -.1 .1]) % least sensitive
axis([4.999 5.002 -.005 .005]) % most sensitive

title('most sensitive')
