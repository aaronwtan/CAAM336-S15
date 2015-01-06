
 x = linspace(-10,10,1000);
 t = linspace(0,5,100);
 t = 0:.05:5;
% first plot
 figure(1), clf
 for k=1:length(t)
    plot(x, sin(x-t(k)).*exp(-(x-t(k)).^2)...
                +sin(x+t(k)).*exp(-(x+t(k)).^2), 'b-','linewidth',2)
    pause
 end

% second plot
 figure(2), clf
 for k=1:length(t)
    plot(x, .5*(1./(1+(x+t(k)).^2) - 1./(1+(x-t(k)).^2)), 'b-','linewidth',2);
    pause
 end
 
% third plot

 x = linspace(-10,10,1000);
 t = 0:.05:5;
 figure(1), clf
 for k=1:length(t)
    plot(x, sin(x-t(k)).*exp(-(x-t(k)).^2)...
                +sin(x+t(k)).*exp(-(x+t(k)).^2) ...
           +.5*(1./(1+(x+t(k)).^2) - 1./(1+(x-t(k)).^2)), 'b-','linewidth',2)
    axis([-10 10 -1 1])
    set(gca,'fontsize',14)
    xlabel('x'), ylabel('u(x,t)')
    title(sprintf('time t = %5.2f', t(k)))
    if min(abs(t(k)-[0:1:5])) < 1e-10
       eval(sprintf('print -depsc2 dalembert%d', round(t(k))))
    end
    pause
 end
