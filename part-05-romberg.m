function [I,k]=romberg(func,a,b,tol,kmax)
if nargin<5, kmax=20; end
if nargin<4, tol=1e-6; end 
r=zeros(kmax,1); 
r(1)=(func(a)+func(b))*(b-a)/2; 
rold=r(1);
cc=cumprod(4*ones(kmax-1,1));
for k=2:kmax   
    % traperzoidal rule
    n=2^(k-2); h=(b-a)/n; x=(a+h/2):h:b; 
    s=sum(func(x)); r(k)=(r(k-1)+h*s)/2;         
    % Richardson extrapolation    
    for i=k-1:-1:1
        % c=cc(k-i); 
        c=4^(k-i);
        r(i)=(c*r(i+1)-r(i))/(c-1); 
    end    
    if abs(rold-r(1))<tol, I=r(1); return, end
    rold=r(1);    
end
error('romberg_my : too many iteration ')
