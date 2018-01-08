function s=adapt_quad(func,a,b,tol,W)
c=(a+b)/2;
L=simp(func,a,c);
R=simp(func,c,b);
if abs(L+R-W)<=15*tol
    s = L+R+(L+R-W)/15;    
else
    s = adapt_quad(func,a,c,tol/2,L) + ...
        adapt_quad(func,c,b,tol/2,R);
end
end

function s=simp(func,a,b)
fprintf('.')
c=(a+b)/2;
s=abs(b-a)/6*(func(a)+4*func(c)+func(b));
end
