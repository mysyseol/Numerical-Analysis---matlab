% p_153
% fixed point iteration
clear, clc, clf
g=@(x) 2.97*x*(1-x);

% plot
fplot(g,[0,1]); hold on
fplot(@(x) x,[0,1]);

x=0.5;
iter=0;
while 1
    iter=iter+1;
    xnew=g(x);
    
    plot([x,x],[x,xnew],'r')
    plot([x,xnew],[xnew,xnew],'r')
    pause(0.1)
    
    if abs(x-xnew)/xnew < 1e-3
        break
    end
    x=xnew;
    [iter,x]
end
