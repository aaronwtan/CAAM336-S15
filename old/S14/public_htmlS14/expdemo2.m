
 v1 = [1;1]/sqrt(2);
 v2 = [1;-1]/sqrt(2);
 V = [v1 v2];
 Lam = diag([-1 -3]);
 A = V*Lam*inv(V)

 t = linspace(0,10,1000);
 x0 = randn(2,1);
 %x0 = [-1;1];
 
 for k=1:length(t)
    x(:,k) = expm(t(k)*A)*x0;
 end 

 figure(1), clf
 semilogy(t, sqrt(x(1,:).^2+x(2,:).^2),'b-','linewidth',2)
 hold on
 set(gca,'fontsize',16)
 semilogy(t, exp(t*max(eig(A))),'k--','linewidth',2)
 xlabel('$t$','interpreter','latex')
 legendstr{1}='$\|\mathbf{x}(t)\|$';
 legendstr{2}='$e^{-t}$';
 legend(legendstr,'interpreter','latex')

