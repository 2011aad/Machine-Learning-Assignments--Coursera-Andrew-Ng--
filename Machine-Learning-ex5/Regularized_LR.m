clear all;
x = load('ex5Logx.dat');
y = load('ex5Logy.dat');
max_itr = 15;
J = zeros(max_itr,1);
lambda = 0;

pos = find(y==1);
neg = find(y==0);

plot(x(pos,1),x(pos,2),'black+');
hold on;
plot(x(neg,1),x(neg,2),'yo','MarkerFaceColor','y');

u = x(:,1);
v = x(:,2);
x = map_feature(u,v);
m = length(x);
g = inline('1.0 ./ (1+exp(-z))');

theta = zeros(length(x(1,:)),1);
matrix = diag([0,ones(1,length(theta)-1)]);
for i=1:max_itr
    h = g(x * theta);
    J(i) = ((-y)'* log(h)-(1-y)'*log(1-h))/m+lambda*norm(matrix*theta)/2/m;
    grad = x'* (h-y)/m + lambda*matrix*theta/m;
    H = ((x' * diag(h) * diag(1-h) * x)+lambda*matrix)/m;
    theta = theta - H^(-1) * grad;
end
n = norm(theta);

u = linspace(-1, 1.5, 200);
v = linspace(-1, 1.5, 200);

z = zeros(length(u),length(v));
for i = 1:length(u)
    for j = 1:length(v)
        % Notice the order of j, i here!
        z(j,i) = map_feature(u(i), v(j))*theta;
    end
end

contour(u,v,z, [0, 0], 'LineWidth', 2);

%figure;
%plot(1:max_itr,J,'o--');