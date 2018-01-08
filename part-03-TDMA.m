function r=TDMA(tri)
%Tri-diagonal equation solver
%  x=TDMA(t), t=[e, f, g, r]
e=tri(:,1); f=tri(:,2); g=tri(:,3); r=tri(:,4); 
n=length(f);
for k=2:n
    factor=e(k)/f(k-1);
    f(k)=f(k)-factor*g(k-1);
    r(k)=r(k)-factor*r(k-1);
end
r(n)=r(n)/f(n);
for k=n-1:-1:1
    r(k)=(r(k)-g(k)*r(k+1))/f(k);
end
