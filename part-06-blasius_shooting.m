function blasius_shooting
% blasius equation, shooting method 
% f''' + 1/2 f f'' = 0
% f(0) = f'(0) = 0, f'(inf) = 1 
clear, clc, clf
xspan=[0,10]; 
u=fzero(@(u) residual(u,xspan), 0.3);
[x,y]=ode45(@odefun,xspan,initfun(u));

f=y(:,1); f1=y(:,2); f2=y(:,3);
figure(1), plot(x,f1), xlabel('\eta'), ylabel('u/U'), grid on
figure(2), plot(x,0.5*(x.*f1-f))
xlabel('\eta'), ylabel('v/U (Re_x)^{1/2}'), grid on
delta_1 = trapz(x,1-f1)
delta_2 = trapz(x,f1.*(1-f1))
delta_3 = trapz(x,f1.*(1-f1.^2))

function F=odefun(x,y)
F=[y(2); y(3); -1/2*y(1)*y(3)];
