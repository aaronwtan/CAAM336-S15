%The norm of the error
n = [1:1e2]';
cn = (2*sqrt(2)/pi.^3)*(1-(-1).^(n))./(n.^3);
normf2 = 1/30;
figure(1), clf
loglog([1:length(cn)], sqrt(normf2-cumsum(cn.^2)),'r.-')

set(gca,'fontsize',14)
xlabel('$N$','fontsize',16,'interpreter','latex')
legend('$\|f-f_N\|$',3)
set(legend,'interpreter','latex','fontsize',16)
print -depsc2 fourerr