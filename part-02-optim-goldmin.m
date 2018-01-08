function [x,fx,ea,iter]=goldmin(f,xl,xu,es,maxiter,varargin)
% goldmin : minimization golden section search
%  [x,fx,ea,iter]=goldmin(f,xl,xu,es,maxiter,p1,p2, ... )
if nargin<3, error('at least 3 input arguments required'), end
if nargin<4 || isempty(es), es=1e-6; end
if nargin<5 || isempty(maxiter), maxiter=50; end
x1=xl; x2=xu;
phi=1-(sqrt(5)-1)/2;
d=phi*(x2-x1);
x3=x1+d; x4=x2-d; f3=f(x3,varargin{:}); f4=f(x4,varargin{:});
iter=0;
while 1            
    if f3<f4
        x2=x4;
        x4=x3; f4=f3;
        d=phi*(x2-x1);
        x3=x1+d; f3=f(x3,varargin{:});
    else
        x1=x3;
        x3=x4; f3=f4;
        d=phi*(x2-x1);
        x4=x2-d; f4=f(x4,varargin{:});
    end
    iter=iter+1;
    if x3~=0, ea=abs((x2-x1)/x3); end
    if ea<=es || iter>maxiter, break, end    
end
x=(x1+x2)/2; fx=f(x,varargin{:});
