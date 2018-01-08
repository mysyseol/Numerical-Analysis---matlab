function U=cholesky(A)
n=size(A,1);
for i=1:n    
    temp=A(i,i)-A(1:i-1,i)'*A(1:i-1,i);
    if temp<0, error('not positive definite'), end
    A(i,i)=sqrt(temp);
    for j=i+1:n        
        A(i,j)=(A(i,j)-A(1:i-1,i)'*A(1:i-1,j))/A(i,i);        
    end
end
U=triu(A);
