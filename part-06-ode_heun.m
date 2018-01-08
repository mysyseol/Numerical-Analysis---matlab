function [x,y]=ode_heun(odefun,xspan,y0,h)
a=xspan(1); b=xspan(2); x=(a:h:b)'; n=length(x); 
if x(n)<b, x(n+1)=b; n=n+1; end
y=y0*ones(n,1);
for i=1:n-1    
    h=x(i+1)-x(i);    
    % predictor
    F1=odefun(x(i),y(i));
    yp=y(i)+F1*h; 
    % collector    
    while 1
        F2=odefun(x(i+1),yp);
        yc=y(i)+0.5*(F1+F2)*h;        
        if abs((yp-yc)/yc)<1e-3, break, end
        yp=yc;
    end
    y(i+1)=yc;
end
