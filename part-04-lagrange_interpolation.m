function y=lagrange_interpolation(xdata,ydata,x)
n=length(xdata);
y=0;
for i=1:n
    p=ydata(i);
    for j=1:n
        if i==j, continue, end
        p=p*(x-xdata(j))/(xdata(i)-xdata(j));
    end
    y=y+p;
end
