
% f(x) = x^2;

% compute the inner products (f, phi_k) for k=1,...,30
  k = [1:30]';
  ck = sqrt(2)*(-2+(2-k.^2*pi^2).*(-1).^(k))./(k.^3*pi^3);

% plot the coefficients
  figure(1), clf
  semilogy(k, abs(ck), 'k.-','markersize',15,'linewidth',1)
  set(gca,'fontsize',14)
  xlabel('k')
  ylabel('|(f,\phi_k)|')
  title('f(x) = x^2');
  print -depsc2 sineseries1a

% plot the coefficients (loglog)
  k = [1:100]';
  ck = sqrt(2)*(-2+(2-k.^2*pi^2).*(-1).^(k))./(k.^3*pi^3);
  figure(1), clf
  loglog(k, abs(ck), 'k.-','markersize',15,'linewidth',1)
  set(gca,'fontsize',14)
  xlabel('k')
  ylabel('|(f,\phi_k)|')
  title('f(x) = x^2');
  print -depsc2 sineseries1a2

% plot first 10 partial sums fk, all on one plot

 figure(2), clf
 x = linspace(0,1,500)';
 fk = zeros(size(x));
 for k=1:10
    plot(x,x.^2,'k-','linewidth',2), hold on
    fk = fk + ck(k)*sqrt(2)*sin(k*pi*x);
    plot(x,fk,'r-','linewidth',2)
    xlabel('x'), ylabel('f_k(x)')
 end
 print -depsc2 sineseries1b

% plot first 10 partial sums fk, all on 10 different plot

 figure(3), clf
 x = linspace(0,1,500)';
 fk = zeros(size(x));
 for k=1:10
    subplot(5,2,k)
    plot(x,x.^2,'k-','linewidth',2), hold on
    fk = fk + ck(k)*sqrt(2)*sin(k*pi*x);
    plot(x,fk,'r-','linewidth',2)
    axis([0 1 -0.25 1.25])
    set(gca,'fontsize',8)
    text(0.05,0.75,sprintf('k = %d',k))
    ylabel('f_k(x)')
 end
 print -depsc2 sineseries1c


% plot first 10 partial sums uk, all on one plot
 figure(4), clf
 x = linspace(0,1,500)';
 uk = zeros(size(x));
 for k=1:10
    plot(x,x.*(1-x.^3)/12,'k-','linewidth',2), hold on
    lamk = k^2*pi^2;
    uk = uk + ck(k)/lamk*sqrt(2)*sin(k*pi*x);
    plot(x,uk,'r-','linewidth',2)
    xlabel('x'), ylabel('u_k(x)')
 end
 print -depsc2 sineseries1d

% plot first 10 partial sums uk, all on 10 different plot
 figure(5), clf
 x = linspace(0,1,500)';
 uk = zeros(size(x));
 for k=1:10
    subplot(5,2,k)
    plot(x,x.*(1-x.^3)/12,'k-','linewidth',2), hold on
    lamk = k^2*pi^2;
    uk = uk + ck(k)/lamk*sqrt(2)*sin(k*pi*x);
    plot(x,uk,'r-','linewidth',2)
    axis([0 1 0 .1])
    set(gca,'fontsize',8)
    text(0.05,0.075,sprintf('k = %d',k))
    ylabel('u_k(x)')
 end
 print -depsc2 sineseries1e

% plot first 10 partial sums uk, all on 10 different plot
 figure(6), clf
 x = linspace(0,1,500)';
 uk = zeros(size(x));
 for k=1:10
    subplot(5,2,k)
    lamk = k^2*pi^2;
    uk = uk + ck(k)/lamk*sqrt(2)*sin(k*pi*x);
    plot(x,x.*(1-x.^3)/12-uk,'k-','linewidth',2), hold on
    set(gca,'fontsize',8)
    text(0.05,min(ylim)+.15*diff(ylim),sprintf('error: k = %d',k))
    ylabel('u(x)-u_k(x)')
 end
 print -depsc2 sineseries1f



