function s=gauss_legendre_quadrature(func,a,b,ng)
% [xg,wg]=GaussLegendre_2(n);
if ng==2
    xg=[-0.577350269189626, 0.577350269189626];
    wg=[ 1.000000000000000, 1.000000000000000];
elseif ng==3
    xg=[-0.774596669241484, 0.000000000000000, 0.774596669241483];
    wg=[ 0.555555555555555, 0.888888888888889, 0.555555555555556];
else
    error('Gauss point must be 2 or 3')
end
x=(b+a)/2+(b-a)/2*xg; 
y=func(x); 
s=sum(wg.*y)*(b-a)/2;
