clear all;

x = load('ex5Linx.dat');
y = load('ex5Liny.dat');
m = length(x);
lambda = 10;

plot(x, y, 'ko', 'MarkerFaceColor', 'r'); 
hold on;

x = [ones(m,1), x, x.^2, x.^3, x.^4, x.^5];
theta = (x' * x + lambda * diag([0,ones(1,length(x(1,:))-1)]))^(-1) * x' * y;
n = norm(theta);

xs = (-1:0.05:1)';
ys = [ones(length(xs),1), xs, xs.^2, xs.^3, xs.^4, xs.^5] * theta;
plot(xs,ys, '--', 'LineWidth', 2);
