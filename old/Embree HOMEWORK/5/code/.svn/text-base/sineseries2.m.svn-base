
% f(x) = x^2(1-x);

% compute the inner products (f, phi_k) for k=1,...,30
  k = [1:30]';
  ck = sqrt(2)*(4*(-1).^(k+1)-2)./(k.^3*pi^3);

% plot first 10 partial sums fk, all on one plot
 figure(2), clf
 x = linspace(0,1,500)';
 fk = zeros(size(x));
 for k=1:10
    plot(x,(x.^2).*(1-x),'k-','linewidth',2), hold on
    fk = fk + ck(k)*sqrt(2)*sin(k*pi*x);
    plot(x,fk,'r-','linewidth',2)
    xlabel('x'), ylabel('f_k(x)')
 end
 print -depsc2 sineseries2b

% plot first 10 partial sums fk, all on 10 different plot
 figure(3), clf
 x = linspace(0,1,500)';
 fk = zeros(size(x));
 for k=1:10
    subplot(5,2,k)
    plot(x,(x.^2).*(1-x),'k-','linewidth',2), hold on
    fk = fk + ck(k)*sqrt(2)*sin(k*pi*x);
    plot(x,fk,'r-','linewidth',2)
    axis([0 1 0 0.2])
    set(gca,'fontsize',8)
    text(0.05,0.16,sprintf('k = %d',k))
    ylabel('f_k(x)')
 end
 print -depsc2 sineseries2c


% plot first 10 partial sums uk, all on one plot
 figure(4), clf
 x = linspace(0,1,500)';
 uk = zeros(size(x));
 for k=1:10
    plot(x,(2*x-5*(x.^4)+3*(x.^5))/60,'k-','linewidth',2), hold on
    lamk = k^2*pi^2;
    uk = uk + ck(k)/lamk*sqrt(2)*sin(k*pi*x);
    plot(x,uk,'r-','linewidth',2)
    xlabel('x'), ylabel('u_k(x)')
 end
 print -depsc2 sineseries2d

% plot first 10 partial sums uk, all on 10 different plot
 figure(5), clf
 x = linspace(0,1,500)';
 uk = zeros(size(x));
 for k=1:10
    subplot(5,2,k)
    plot(x,(2*x-5*(x.^4)+3*(x.^5))/60,'k-','linewidth',2), hold on
    lamk = k^2*pi^2;
    uk = uk + ck(k)/lamk*sqrt(2)*sin(k*pi*x);
    plot(x,uk,'r-','linewidth',2)
    axis([0 1 0 .02])
    set(gca,'fontsize',8)
    text(0.05,0.015,sprintf('k = %d',k))
    ylabel('u_k(x)')
 end
 print -depsc2 sineseries2e

% plot error in first 10 partial sums uk, all on 10 different plot
 figure(6), clf
 x = linspace(0,1,500)';
 uk = zeros(size(x));
 for k=1:10
    subplot(5,2,k)
    lamk = k^2*pi^2;
    uk = uk + ck(k)/lamk*sqrt(2)*sin(k*pi*x);
    plot(x,(2*x-5*(x.^4)+3*(x.^5))/60 - uk,'k-','linewidth',2), hold on
    set(gca,'fontsize',8)
    text(0.05,max(ylim)-.175*diff(ylim),sprintf('error: k = %d',k))
    ylabel('u(x)-u_k(x)')
 end
 print -depsc2 sineseries2f

% inhomogeneous boundary condition:
% plot first 10 partial sums uk, all on 10 different plot
 figure(7), clf
 x = linspace(0,1,500)';
 w = -1/100 + (2/100)*x;
 uhatk = zeros(size(x));
 for k=1:10
    lamk = k^2*pi^2;
    uhatk = uhatk + ck(k)/lamk*sqrt(2)*sin(k*pi*x);
    plot(x,w+uhatk,'k-','linewidth',2)
    axis([0 1 -.02 .02])
    set(gca,'fontsize',14)
    ylabel('$u_{10}(x) = w(x) + \hat{u}_{10}(x)$','fontsize',16,'interpreter','latex')
    xlabel('$x$','fontsize',16,'interpreter','latex')
 end
 print -depsc2 sineseries2g
