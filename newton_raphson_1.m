function x=newton_raphson_1(fun,x0,tol,maxiter)
if nargin<4, maxiter=100; end
if nargin<3, tol=1e-6; end
if nargin<2, x0=1; end
x=x0; dx=tol; 
iter=0;
while 1
    iter=iter+1;
    f=fun(x);
    df=(fun(x+dx)-f)/dx;
    xnew=x-f/df;
    if abs((x-xnew)/x)<tol
        break
    end
    if abs(f)<tol,break, end
    if iter>maxiter, break, end
    x=xnew;
end
