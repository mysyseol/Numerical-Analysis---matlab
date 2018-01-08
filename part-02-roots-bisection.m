function [x,iter]=bisection(func,x1,x2,tol)
% bisection method
if nargin<4, tol=1e-6; end
iter=0; x3old=1;  
f1=func(x1); if f1==0, x=x1; return, end
f2=func(x2); if f2==0, x=x2; return, end
if f1*f2>0, error('[x1,x2] must bracket the root'), end
while 1
    iter=iter+1; 
    x3=(x1+x2)/2; 
    f3=func(x3);
      [x1,x3,x2, f1, f3, f2]
    if f3==0, x=x3; return, end
    if f2*f3>0
        x2=x3; f2=f3; 
    else
        x1=x3; f1=f3;
    end  
    ea=abs((x3-x3old)/x3); 
    if ea<tol, x=x3; return, end
    x3old=x3;
end
