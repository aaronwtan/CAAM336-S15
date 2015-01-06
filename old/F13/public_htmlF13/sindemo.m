 x = linspace(0,1,500);

  slam = [1:50]*pi;     % show only the eigenfunctions, sqrt(lam) = integer*pi

 
 for k=1:length(slam)
    figure(1), clf
    plot([0 1],[0 0],'-','linewidth',1,'color',.5*[1 1 1]);
    hold on
    plot(x,sin(slam(k)*x),'b-','linewidth',2)
    set(gca,'fontsize',14)
    xlabel('$x$','fontsize',16,'interpreter','latex')
    ylabel('$\sin(\sqrt{\lambda} x)$','fontsize',16,'interpreter','latex')
    title(sprintf('$\\sqrt{\\lambda} = %10.7f$', slam(k)),...
          'fontsize',16,'interpreter','latex')
    axis([0 1 -1.25 1.25])
    pause(0.1) 
 end
