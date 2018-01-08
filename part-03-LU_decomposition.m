function A=LU_decomposition(A)
n=size(A,1);
for k=1:n-1        
    for i=k+1:n
        factor=A(i,k)/A(k,k);
        j=k+1:n; A(i,j)=A(i,j)-factor*A(k,j);
        A(i,k)=factor;
    end
end
