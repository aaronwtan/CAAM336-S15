 n = [1:1e6]';
 cn = (sqrt(2)/pi)*(1+(-1).^(n+1))./(n);
 lamn = pi^2*n.^2;
 normf2 = 1;
 normu2 = 1/120;
 figure(1), clf
 loglog([1:length(cn)], sqrt(normf2-cumsum(cn.^2)),'r.-')
 hold on
 loglog(n, sqrt(normu2-cumsum((cn./lamn).^2)),'b.-')

 set(gca,'fontsize',14)
 xlabel('$N$','fontsize',16,'interpreter','latex')
 legend('$\|f-f_N\|$','$\|u-u_N\|$',3)
 set(legend,'interpreter','latex','fontsize',16)
 print -depsc2 fourerr
