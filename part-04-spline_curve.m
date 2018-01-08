function k=spline_curve(x,y)
x=x(:); y=y(:); n=length(x); tri=zeros(n,4);
h=diff(x); dy=diff(y)./h;
tri(1,:)=[0 1 0 0]; tri(n,:)=[0 1 0 0];
for i=2:n-1
    tri(i,:)=[h(i-1),2*(h(i)+h(i-1)),h(i),6*(dy(i)-dy(i-1))];
end
k=TDMA(tri);
