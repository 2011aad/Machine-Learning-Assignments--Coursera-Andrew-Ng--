clear all;
[train_labels,train_features] = libsvmread('ex8b.txt');

pos = find(train_labels==1);
neg = find(train_labels==-1);

%plot(train_features(pos,1), train_features(pos,2), 'ko', 'MarkerFaceColor', 'r'); 
%hold on;
%plot(train_features(neg,1), train_features(neg,2), 'ko', 'MarkerFaceColor', 'g');

model = svmtrain(train_labels,train_features,'-s 0 -t 2 -g 10');
[predicted_label, accuracy, decision_values] = svmpredict(train_labels,train_features,model);
plotboundary(train_labels, train_features, model,'t');