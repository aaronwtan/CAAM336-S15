
 figure(1), clf
 xx = linspace(-1.25,1.25,1000)';
  
 plot(xx,cos(pi*xx), 'b-','linewidth',2), hold on
 plot(xx,15/(2*pi*pi)*(1-3*xx.^2), 'r--','linewidth',2)
 legend('cos(\pi x)', 'approximation',2)
 set(gca,'fontsize',15)
 axis([-1.25 1.25 -1.25 1.25])
 print -depsc2 legendre
