function [x,iter]=gauss_seidel(A,b,lambda,tol)
if nargin<4, tol=1e-6; end
if nargin<3, lambda=1; end
n=size(A,1); x=zeros(n,1);
d=diag(A); C=(A-diag(d))./repmat(d,1,n); d=b./d;
iter=0;
while 1
    iter=iter+1; xnew=d-C*x;
    if norm(xnew-x)/norm(xnew)<tol, break, end
    x=lambda*xnew+(1-lambda)*x;
end
