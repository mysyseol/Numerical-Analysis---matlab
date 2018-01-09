function [y, tri] = bvpL2(n, h, p, q, r, c)
% bvp linear 2nd order 
%    y'' + p*y' + q*y = r
%    x=a, c11*y' + c12*y = c13
%    x=b, c21*y' + c22*y = c23
%
%    example : bvpL2_exam
%      y'' + 4*y = 4*x, y(0)=0, y'(pi/2)=0 
%      a=0; b=pi/2; n=21; x=linspace(a,b,n)'; h=(b-a)/(n-1);
%      p=zeros(n,1); q=4*ones(n,1); r=4*x; 
%      c=[0,1,0; 1,0,0];
%      [y,tri]=bvpL2(n,h,p,q,r,c)

if length(p) == 1, p = p*ones(n,1); end
if length(q) == 1, q = q*ones(n,1); end
if length(r) == 1, r = r*ones(n,1); end

d0 = [0,1,0]; 
d1 = [-1/2,0,1/2]/h; 
d2 = [1,-2,1]/h^2;

tri = zeros(n,4);
for i = 1:n
    tri(i,1:3) = d2 + p(i)*d1 + q(i)*d0; 
    tri(i,4) = r(i);
end

% bc at x=a
t = c(1,1)*d1 + c(1,2)*d0; 
t = [t, c(1,3)];
if t(1) == 0 
    tri(1,:) = t;
else 
    tri(1,:) = tri(1,:) - tri(1,1)/t(1)*t;
end

% bc at x=b
t = c(2,1)*d1 + c(2,2)*d0; 
t = [t,c(2,3)];
if t(3) == 0
    tri(n,:) = t;
else
    tri(n,:) = tri(n,:) - tri(n,3)/t(3)*t;
end

y = TDMA(tri);
