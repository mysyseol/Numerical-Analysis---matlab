function [x,iter]=false_position(func,a,b)
% false position method
x1=a; x2=b; f1=func(x1); f2=func(x2);
iter=0; tol=1e-6; maxiter=100;
while 1
    iter=iter+1;
    x3=x1-f1/(f2-f1)*(x2-x1);
    f3=func(x3);
    if f1*f3<0
        x2=x3;
    else
        x1=x3;
    end
    if abs((x2-x1)/x1)<tol, x=(x1+x2)/2; break, end
    if iter > maxiter, x=(x1+x2)/2; break, end
end
