function [yy,d1y,d2y]=spline_eval(x,y,k,xx)
n=length(xx); xx=xx(:); yy=zeros(n,1);
for i=1:n
    j=find_segment(x,xx(i));
    h=x(j)-x(j+1); 
    xp=xx(i)-x(j+1); xm=xx(i)-x(j);
    d=(y(j)-y(j+1))/h;
    yy(i)=k(j)/6*(xp^3/h-xp*h) ...
        - k(j+1)/6*(xm^3/h-xm*h) ...
        + (y(j)*xp-y(j+1)*xm)/h;   
    d1y=k(j)/6*(3*xp^2/h-h)-k(j+1)/6*(3*xm^2/h-h)+d;
    d2y=(k(j)*xp-k(j+1)*xm)/h;
end

