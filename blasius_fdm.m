% function blasius
% blasius equation, fdm
% F'' + 1/2 f F' = 0, f = int(F,0,x)
% f(0) = F(0) = 0, F(inf) = 1 
clear, clc, clf
a=0; b=10; n=101; x=linspace(a,b,n)'; h=(b-a)/(n-1);
tri=zeros(n,4); F=x/b; iter=0;
tri(1,:)=[0,1,0,0]; tri(n,:)=[0,1,0,1];
while 1
    iter=iter+1; Fold=F; f=cumtrapz(x,F);    
    for i=2:n-1
        tri(i,:)=[1/h^2-f(i)/(4*h),-2/h^2,1/h^2+f(i)/(4*h),0];
    end
    F=TDMA(tri); if norm(F-Fold)<1e-5, break, end
end
dF=fun_dydx(h,F); 
plot(x,[F,dF]), grid on
xx=linspace(a,b,21)'; yy=interp1(x,[f,F,dF],xx); [xx,yy]
