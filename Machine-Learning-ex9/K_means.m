clear all;
A = double(imread('bird_small.tiff'));
dim1 = size(A,1);
dim2 = size(A,2);
C = zeros(dim1,dim2);
num_iterate = 0;

%map to k colors
k = 16;
mu = zeros(k,3);
rand_x = ceil(dim1*rand(k,1));
rand_y = ceil(dim2*rand(k,1));

for i=1:k
    mu(i,1) = A(rand_x(i),rand_y(i),1);
    mu(i,2) = A(rand_x(i),rand_y(i),2);
    mu(i,3) = A(rand_x(i),rand_y(i),3);
end

while(1)
    num_iterate = num_iterate + 1;
    disp(num_iterate);
    for i=1:dim1
        for j=1:dim2
            sum = 3*256*256;
            r = A(i,j,1);
            g = A(i,j,2);
            b = A(i,j,3);
            for s=1:k 
                diff = norm(mu(s,:)-[r,g,b]);
                if diff<sum
                    sum = diff;
                    C(i,j) = s;
                end
            end
        end
    end

    tmp = zeros(k,3);
    num_assigned = zeros(k,1);
    for i=1:dim1
        for j=1:dim2
            num_assigned(C(i,j)) = num_assigned(C(i,j)) + 1;
            tmp(C(i,j),1) = tmp(C(i,j),1) + A(i,j,1);
            tmp(C(i,j),2) = tmp(C(i,j),2) + A(i,j,2);
            tmp(C(i,j),3) = tmp(C(i,j),3) + A(i,j,3);
        end
    end

    for i=1:k
        if num_assigned(i)>0
            tmp(i,:) = tmp(i,:)./num_assigned(i);
        end
    end
    
    disp(norm(tmp-mu));
    if norm(tmp-mu)<1
        break;
    end
    
    mu = tmp;
end

mu = round(tmp);