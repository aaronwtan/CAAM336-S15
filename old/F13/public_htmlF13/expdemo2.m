
 v1 = [1;1]/sqrt(2);
 v2 = [1;-1]/sqrt(2);
 V = [v1 v2];
 Lam = diag([-1 -3]);
 A = V*Lam*inv(V)

 t = linspace(0,10,1000);
 x0 = randn(2,1);
% x = zeros(2,length(t));
 for k=1:length(t)
    x(:,k) = expm(t(k)*A)*x0;
 end 

 figure(1), clf
 plot(t, x(1,:),'b-','linewidth',2)
 hold on
 plot(t, x(2,:),'r-','linewidth',2)
 set(gca,'fontsize',16)
 plot(t, exp(t*max(eig(A))),'k--','linewidth',2)
 xlabel('$t$','interpreter','latex')
 legend('$x_1(t)$','$x_2(t)$','$e^{\lambda_1 t}$',1)
 set(legend,'interpreter','latex')

 figure(2), clf
 semilogy(t, abs(x(1,:)),'b-','linewidth',2)
 hold on
 semilogy(t, abs(x(2,:)),'r-','linewidth',2)
 set(gca,'fontsize',16)
 semilogy(t, exp(t*max(eig(A))),'k--','linewidth',2)
 xlabel('$t$','interpreter','latex')
 legend('$|x_1(t)|$','$|x_2(t)|$','$e^{\lambda_1 t}$',1)
 set(legend,'interpreter','latex')

