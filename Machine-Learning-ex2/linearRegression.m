x = load('ex2x.dat');
y = load('ex2y.dat');
alpha = 0.07;

m = length(y);
x = [ones(m,1),x];

theta0 = 0;
theta1 = 0;

theta = [theta0,theta1];

for i = 1:1500
    theta0 = theta0-alpha*(theta0*x(:,1)+theta1*x(:,2)-y)'*x(:,1)/m;
    theta1 = theta1-alpha*(theta0*x(:,1)+theta1*x(:,2)-y)'*x(:,2)/m;
    
    if(abs(theta0-theta(1))<0.00001 && abs(theta1-theta(2))<0.00001)
        counter = i;
        break;
    end
    theta(1) = theta0;
    theta(2) = theta1;
end

theta0,theta1,counter
