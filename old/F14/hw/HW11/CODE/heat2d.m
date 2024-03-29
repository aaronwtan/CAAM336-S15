 npts = 40;
 x = linspace(0,1,npts); y = linspace(0,1,npts);
 [X,Y] = meshgrid(x,y);
 tvec = [0 .005 .1 2];
 for m=1:length(tvec)
    t = tvec(m);
    figure(1), clf
    U = zeros(npts,npts);
    n=15;
    for j=1:n
       for k=1:n
          cjk = (1+(-1)^j)*(1+(-1)^k)*(j^2*pi^2-24)/(8*j^3*k*pi^4); %  (x-1/2)^3 (y-1/2)
          lamjk = pi^2*(j^2+k^2);
          psijk = 2*sin(j*pi*X).*sin(k*pi*Y);
          U = U + (exp(-t)-exp(-lamjk*t))/(lamjk-1)*cjk*psijk;
       end
    end
    surf(X,Y,U)
    set(gca,'fontsize',16)
    xlabel('$x$','fontsize',16,'interpreter','latex')
    ylabel('$y$','fontsize',16,'interpreter','latex')
    zlabel('$u(x,y,t)$','fontsize',16,'interpreter','latex')
    title(sprintf('$t = %g$',t),'fontsize',16,'interpreter','latex')
    zlim([-.00016 .00016])
    eval(sprintf('print -depsc2 heat2d%d',m))
    pause
 end
