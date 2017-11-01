clear all;
[trainlabels, trainfeatures] = libsvmread('email_train-all.txt');
[testlabels, testfeatures] = libsvmread('email_test.txt');

model = svmtrain(trainlabels,trainfeatures,'-s 0 -t 0');

[predicted_label, accuracy, decision_values] = svmpredict(testlabels,testfeatures,model);
