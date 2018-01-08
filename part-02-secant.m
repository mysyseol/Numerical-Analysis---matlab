function [x,f,iter]=secant(func,x1,x2,tol,maxiter)
if nargin<5, maxiter=100; end
if nargin<4, tol=1e-6; end
if nargin<3, x2=x1*1.1; end
f1=func(x1); f2=func(x2); 
iter=0;
while 1
    iter=iter+1;
    x3=x1-f1/((f2-f1)/(x2-x1)); f3=func(x3);
    x1=x2; f1=f2; 
    x2=x3; f2=f3;
    if abs(x1-x2)<tol | abs(f1)<tol, break, end
    if iter>maxiter, error('exceed maxiter'), end
end
x=x1; f=f1;
