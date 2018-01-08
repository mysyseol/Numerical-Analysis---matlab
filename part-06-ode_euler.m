function [x,y]=ode_euler(odefun,xspan,y0,h)
a=xspan(1); b=xspan(2); 
x=(a:h:b)'; n=length(x); if x(n)<b, x(n+1)=b; n=n+1; end
y=y0*ones(n,1);
for i=1:n-1
    h=x(i+1)-x(i);
    y(i+1)=y(i)+odefun(x(i),y(i))*h;
end
