function simpson(h,y)
n=length(y);
s=h/3*(y(1)+y(n)+4*sum(y(2:2:n-1))+2*sum(y(3:2:n-2)));
