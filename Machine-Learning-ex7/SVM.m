clear all;
[trainlabels, trainfeatures] = libsvmread('twofeature.txt');
pos = find(trainlabels==1);
neg = find(trainlabels==-1);

%In trainfeature(pos,i), i means the ith dimension of the features.
plot(trainfeatures(pos,1), trainfeatures(pos,2), 'ko', 'MarkerFaceColor', 'b'); 
hold on;
plot(trainfeatures(neg,1), trainfeatures(neg,2), 'ko', 'MarkerFaceColor', 'g');

model = svmtrain(trainlabels,trainfeatures,'-s 0 -t 0 -c 100');

w = model.SVs' * model.sv_coef;
b = -model.rho;
if(model.Label(1)==-1)
    w = -w;
    b = -b;
end

%draw line
x1 = 0.1:0.1:4;
x2 = -(w(1)*x1+b)/w(2);
plot(x1,x2,'black-');
