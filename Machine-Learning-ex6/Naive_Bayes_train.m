numTrainDocs = 50;
numTokens = 2500;

M = dlmread('train-features-50.txt',' ');
spmatrix = sparse(M(:,1),M(:,2),M(:,3),numTrainDocs,numTokens);
train_matrix = full(spmatrix);

train_labels = dlmread('train-labels-50.txt');

nonspam = find(train_labels==0);
spam = find(train_labels==1);
phi_y = log(length(nonspam)/numTrainDocs);
phi_k0 = log((1+sum(train_matrix(nonspam,:)))/(numTokens+sum(sum(train_matrix(nonspam,:)))));
phi_k1 = log((1+sum(train_matrix(spam,:)))/(numTokens+sum(sum(train_matrix(spam,:)))));

