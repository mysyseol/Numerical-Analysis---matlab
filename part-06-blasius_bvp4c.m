function blasius_bvp4c
% y'''+0.5*y*y''=0, y(0)=y'(0)=0, y'(inf)=1
a=0; b=10; 
solinit=bvpinit([0,5,10],[1,1,1]);
sol=bvp4c(@odefun, @bcfun, solinit);
x=linspace(a,b,101); y=deval(sol,x);
[x;y]'
plot(x,y(2,:))

function F=odefun(x,y)
F=[y(2); y(3); -0.5*y(1)*y(3)];

function r=bcfun(ya,yb)
r=[ya(1); ya(2); yb(2)-1];
