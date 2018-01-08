function [xb,nb]=incsearch(func,a,b,ns)
% incremental search
% example : xb=incsearch(@(x) sin(10*x)+cos(3*x),3,6,100)
fplot(func,[3,6]), grid 
if nargin<3, error('at least 3 arguments required'), end
if nargin<4, ns=50; end
x=linspace(a,b,ns);
f=func(x);
nb=0; xb=[];
for k=1:ns-1
    if sign(f(k)) ~= sign(f(k+1))
        nb=nb+1;
        xb(nb,1)=x(k);
        xb(nb,2)=x(k+1);
    end
end
if nb==0
    disp('no brackets found')
    disp('check interval or increase ns')
else
    disp('number of brackets:')
    disp(nb)
end
