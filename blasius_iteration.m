% p. 75 laminar boundary layer
% solve blasius equation by iteration
% f''' + 1/2 f f'' = 0, f(0)=f'(0) = 0, f'(inf) = 1
clear, clc, clf
x=linspace(0,10,201)'; f=x;
c=1; iter=0;
while 1
    iter=iter+1;
    cold=c;
    ddf=exp(cumtrapz(x,-1/2*f));
    df=cumtrapz(x,ddf);
    f=cumtrapz(x,df);
    c=1/df(end);
    ddf=c*ddf;
    df=c*df;
    f=c*f;
    if abs((c-cold)/c)<1e-9, break, end    
end
plot(x,df)
y=[f,df,ddf];
xx=[0:0.2:5]'; yy=interp1(x,y,xx);
fprintf('%5.1f%10.5f%10.5f%10.5f\n', [xx,yy]')
% plot(xx,yy(:,2),'.-r')
