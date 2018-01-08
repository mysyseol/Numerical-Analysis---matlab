
function [x,f]=parabolic_interpolation(func,x1,x3)
% parabolic interpolation
tol=1e-6;
f1=func(x1); f3=func(x3); 
x2=(x1+x3)/2; f2=func(x2);
iter=0;
while 1
    iter=iter+1;
    x4=x2-0.5*((x2-x1)^2*(f2-f3)-(x2-x3)^2*(f2-f1)) ...
        /((x2-x1)*(f2-f3)-(x2-x3)*(f2-f1));
    f4=func(x4);
    fprintf('%5d%10.4f%10.4f%10.4f%10.4f\n',iter,x1,x2,x4,x3)     
    if f4<f2
        x1=x2; f1=f2; x2=x4; f2=f4;
    else
        x3=x2; f3=f2; x2=x4; f2=f4;
    end
    if abs((x1-x3)) < tol*max(abs(x3),1)
        x=(x1+x3)/2; f=func(x); break
    end
end
