function x=brent(func,x1,x3,tol)
if nargin<4, tol=1e-6; end

% tol=1e-6;
% func=@(x) exp(-x)-x;
% x1=0; x3=1; 

y1=func(x1); y3=func(x3);

while 1
    x2=(x1+x3)/2; y2=func(x2);    
    x4= (x1*y2*y3)/((y1 - y2)*(y1 - y3)) + ...
        (x2*y3*y1)/((y2 - y3)*(y2 - y1)) + ...
        (x3*y1*y2)/((y3 - y1)*(y3 - y2));
    y4=func(x4);    
    if y1*y4>0
        x1=x4; y1=y4;
    else
        x3=x4; y3=y4;
    end    
    if abs((x3-x1)/x1) < tol, break, end
end
x=0.5*(x1+x3);
