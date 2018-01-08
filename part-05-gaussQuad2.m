function S=gaussQuad2(func, x,y, ng)
% gauss-legendre quadrature of quadlilateral element
if nargin<4, ng=3; end
if ng<2 | ng>3, ng=3; end
x=x(:); y=y(:);
if ng==2
    xg = [-0.577350269189626, 0.577350269189626];
    wg = [ 1.000000000000000, 1.000000000000000];
elseif ng==3
    xg = [-0.774596669241484, 0.000000000000000, 0.774596669241483];
    wg = [ 0.555555555555555, 0.888888888888889, 0.555555555555556];
end
    
S=0;
for i=1:ng   
    s=xg(i); As=wg(i);
    for j=1:ng
        t=xg(j); At=wg(j);             
        N=[(1-s)*(1-t), (1+s)*(1-t), (1+s)*(1+t), (1-s)*(1+t)]/4;
        dN=[-1+t, 1-t, 1+t, -1-t; -1+s, -1-s, 1+s, 1-s ]/4;
        J=dN*[x,y]; detJ=J(1,1)*J(2,2)-J(1,2)*J(2,1);
        S = S + As*At*func(N*x,N*y)*detJ;
    end
end    
