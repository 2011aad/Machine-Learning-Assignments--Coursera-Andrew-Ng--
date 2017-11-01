x = load('ex4x.dat');
y = load('ex4y.dat');

m = length(y);
x = [ones(m,1),x];
max_itr = 10;
pos = find(y==1);
neg = find(y==0);

plot(x(pos,2),x(pos,3),'+');
hold on;
plot(x(neg,2),x(neg,3),'o');
xlabel('test 1 scores');
ylabel('test 2 scores');

g = inline('1.0 ./ (1+exp(-z))');
J = zeros(max_itr,1);
theta = [0,0,0]';

for i=1:max_itr
    h = g(x * theta);
    J(i) = ((-y)'* log(h)-(1-y)'*log(1-h))/m;
    grad = x'* (h-y)/m;
    H = (x' * diag(h) * diag(1-h) * x)/m;
    theta = theta - H^(-1) * grad;
end

theta

px = [min(x(:,2))-2,max(x(:,2))+2];
py = -(theta(1)+px*theta(2))/theta(3);
plot(px,py);   

figure;
plot(1:max_itr,J,'o--');

prob = 1-g([1,20,80]*theta)
