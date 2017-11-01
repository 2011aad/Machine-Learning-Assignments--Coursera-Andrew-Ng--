A = double(imread('bird_large.tiff'));
dim1 = size(A,1);
dim2 = size(A,2);
C = zeros(dim1,dim2);

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

for i=1:dim1
    for j=1:dim2
        A(i,j,1) = mu(C(i,j),1);
        A(i,j,2) = mu(C(i,j),2);
        A(i,j,3) = mu(C(i,j),3);
    end
end

imshow(uint8(A)); 
figure; 
hold on;

for i=1:k  
    col = (1/255).*mu(i,:); 
    rectangle('Position', [i, 0, 1, 1], 'FaceColor', col, 'EdgeColor', col); 
end 
axis off;
   