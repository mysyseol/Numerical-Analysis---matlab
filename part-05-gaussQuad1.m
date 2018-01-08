function S=gaussQuad1(func, x1,x2, ng)
% gauss-legendre quadrature
if nargin<4, ng=2; end
if ng<2 | ng>3, ng=2; end
if ng==2
    xg = [-0.577350269189626, 0.577350269189626];
    wg = [ 1.000000000000000, 1.000000000000000];
elseif ng==3
    xg = [-0.774596669241484, 0.000000000000000, 0.774596669241483];
    wg = [ 0.555555555555556, 0.888888888888889, 0.555555555555556];
end
S=0; x=[x1; x2];
for i=1:ng
    s=xg(i); ws=wg(i);
    N=[1-s, 1+s]/2; 
    f=func(N*x);    
    dN=[-1/2, 1/2]; detJ=dN*x;
    S=S+f*detJ*ws;
end
% x=(b+a)/2+(b-a)/2*xg; s=sum(wg.*func(x))*(b-a)/2;
