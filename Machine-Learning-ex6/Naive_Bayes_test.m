M = dlmread('test-features.txt');
spmatrix = sparse(M(:,1),M(:,2),M(:,3));
test_matrix = full(spmatrix);

results = zeros(length(test_matrix(:,1)),1);

for i = 1:length(results)
    tmp = test_matrix(i,:);
    p0 = tmp * phi_k0'+phi_y;
    p1 = tmp * phi_k1'+phi_y;
    if p0>=p1
        results(i) = 0;
    else
        results(i) = 1;
    end
end

result = dlmread('test-labels.txt');

error_rate = sum(abs(result-results))/length(test_matrix(:,1));


