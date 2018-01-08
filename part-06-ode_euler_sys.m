function [x,y]=ode_euler_sys(odefun,xspan,y0)
x=xspan(:); n=length(xspan); 
if n==2, n=21; x=linspace(x(1),x(2),n)'; end
y=zeros(n,length(y0)); y(1,:)=y0(:)';
for i=1:n-1
    xi=x(i); yi=y(i,:)'; h=x(i+1)-x(i);
    yi1=yi+odefun(xi,yi)*h;
    y(i+1,:)=yi1';
end
