function b=LU_solve(A,b)
n=size(A,1);
for k=1:n
    j=1:k-1; b(k)=b(k)-A(k,j)*b(j);
end
for k=n:-1:1
    j=k+1:n; b(k)=(b(k)-A(k,j)*b(j))/A(k,k);
end
