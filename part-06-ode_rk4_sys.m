function [x,y]=ode_rk4_sys(odefun,xspan,y0)
if length(xspan)==2
    n=21; x=linspace(xspan(1),xspan(2),n)';
else
    n=length(xspan); x=xspan(:);
end
y=zeros(n,length(y0)); y(1,:)=y0(:)';
for i=1:n-1
    xi=x(i); yi=y(i,:)'; h=x(i+1)-x(i);
    k1=odefun(xi,     yi);
    k2=odefun(xi+h/2, yi+k1*h/2);
    k3=odefun(xi+h/2, yi+k2*h/2);
    k4=odefun(xi+h,   yi+k3*h);
    yi1=yi+h/6*(k1+2*k2+2*k3+k4);
    y(i+1,:)=yi1';
end
