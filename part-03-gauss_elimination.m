function [b,D]=gauss_elimination(A,b)
% gauss_naive : naive Gauss elimination without pivoting
%    x=gauss_naive(A,b)
%    A : coefficient matrix
%    b : right hand side vector
[m,n]=size(A); 
if m~=n, error('A must be square'), end
% forward elimination
for k=1:n-1    
    j=k+1:n;
    for i=k+1:n
        if A(i,k)==0, continue, end
        factor=A(i,k)/A(k,k);        
        A(i,j)=A(i,j)-factor*A(k,j);
        b(i)=b(i)-factor*b(k);
    end
end
% determinant
if nargout==2, D=prod(diag(A)); end
% back substitution
for k=n:-1:1
    j=k+1:n; 
    b(k)=(b(k)-A(k,j)*b(j))/A(k,k);
end
