
for N = [5 35]

 K = zeros(N); f = zeros(N,1);

 for j=1:N, for k=1:N
    K(j,k) = 2*sin(j*pi/2)*sin(k*pi/2);
 end, end

 K = K + diag([1:N].^2*pi^2);

 for k=1:N
    f(k) = (sqrt(2)/pi)*(1+(-1).^(k+1))./k;
 end 

 c = K\f;

 xx = linspace(0,1,1000);
 uN = zeros(size(xx));

 for k=1:N
    uN = uN + c(k)*sqrt(2)*sin(k*pi*xx);
 end

 figure(N), clf
 plot(xx,uN,'k-','linewidth',2)
 title(sprintf('Galerkin solution for $N=%d$',N),'interpreter','latex','fontsize',18)
 xlabel('$x$','interpreter','latex','fontsize',16)
 ylabel('$u_N(x)$','interpreter','latex','fontsize',16)
 set(gca,'fontsize',14)
 eval(sprintf('print -depsc2 delta_%d', N))

 if N==5, disp(K), end
end
