 f   = @(x) (exp(x));

 p1  = @(x) (ones(size(x)));
 p2  = @(x) (x);
 p3  = @(x) (3*x.^2-1);
 p12 = @(x) (ones(size(x)).^2);
 p22 = @(x) (x).^2;
 p32 = @(x) (3*x.^2-1).^2;
 p1f = @(x) ((ones(size(x))).*f(x));
 p2f = @(x) ((x).*f(x));
 p3f = @(x) ((3*x.^2-1).*f(x));

 figure(1), clf
 xx = linspace(-1,1,1000);
 c1 = quad(p1f,-1,1)/quad(p12,-1,1);
 c2 = quad(p2f,-1,1)/quad(p22,-1,1);
 c3 = quad(p3f,-1,1)/quad(p32,-1,1);

 plot(xx,f(xx),'k-','linewidth',2)
 hold on
 plot(xx,c1*p1(xx),'r-','linewidth',2)
 plot(xx,c1*p1(xx)+c2*p2(xx),'b-','linewidth',2)
 plot(xx,c1*p1(xx)+c2*p2(xx)+c3*p3(xx),'g-','linewidth',2)
 legend('f', 'f_1','f_2','f_3',2)
 ylim([0 3])
 xlabel('$x$','fontsize',16,'interpreter','latex')
 print -depsc2 legendre_exp
