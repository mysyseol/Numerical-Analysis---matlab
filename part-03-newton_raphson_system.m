function [x,f0,iter]=newton_raphson_system(func,x,tol,maxiter)
% func=@(x) [x(1)^2+x(1)*x(2)-10; x(2)+3*x(1)*x(2)^2-57];
% x=[2; 3];
if nargin<4, maxiter=100; end
if nargin<3, tol=1e-6; end
x=x(:); f0=func(x); 
n=length(x); iter=0; h=0.001;
while 1
    iter=iter+1; J=zeros(n); L=eye(n); 
    for i=1:n
        f1=func(x+h*L(:,i)); 
        J(:,i)=(f1-f0)/h;
    end
    dx=-J\f0;     
    x=x+dx; f0=func(x);     
    if norm(dx)/n < tol*max(norm(x),1), return, end    
    if norm(f0) < tol, return, end
    if iter>maxiter, error('newtonRaphson2 : not converge'), end
end
