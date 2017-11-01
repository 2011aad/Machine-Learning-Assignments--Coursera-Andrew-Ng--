x = load('ex2x.dat');
y = load('ex2y.dat');
m = length(y);

x = [ones(m,1),x];

J = zeros(100,100);

theta0 = linspace(-3,3,100);
theta1 = linspace(-1,1,100);

for i = 1:100
    for j = 1:100
        s = theta0(i)*x(:,1)+theta1(j)*x(:,2)-y;
        J(i,j) = s'*s/100;
    end
end

figure(1);
surf(theta0,theta1,J);
figure(2);
contour(theta0,theta1,J,logspace(-2,2,15));
