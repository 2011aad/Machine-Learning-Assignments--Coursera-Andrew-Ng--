x = load('ex3x.dat');
y = load('ex3y.dat');

m = length(y);
x= [ones(m,1),x];

theta = (x'*x)^(-1)*x'*y;
