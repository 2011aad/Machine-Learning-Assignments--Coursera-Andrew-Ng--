x = load('ex3x.dat');
y = load('ex3y.dat');
alpha = 1;

m = length(y);
x = [ones(m,1),x];

sigma = std(x);
mu = mean(x);

x(:,2) = (x(:,2)-mu(2)) ./ sigma(2);
x(:,3) = (x(:,3)-mu(3)) ./ sigma(3);

J = zeros(50,1);
theta = [0,0,0]';
for i=1:50
    J(i) = (x*theta-y)'*(x*theta-y)/2/m;
    theta = theta - alpha*x'*(x*theta-y)/m;
end

figure;
plot(0:49,J,'g-');
xlabel('number of iterations');
ylabel('Cost Function');





