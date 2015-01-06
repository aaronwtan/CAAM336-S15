% Demo of Forward Euler for a symmetric matrix
% Stable provided abs(-1-dt*lam) < 1 for all eigenvalues lam of A

 v1 = [1;1]/sqrt(2);
 v2 = [1;-1]/sqrt(2);
 V = [v1 v2];
 Lam = diag([-.5 -25]);    % eigenvalues of A
 A = V*Lam*inv(V)

 dt = .01;
 t = [0:dt:3];

x0 = randn(2,1);
 %x0 = [1;0];
 
 x = zeros(2,length(t));
 x(:,1) = x0;
 for k=1:length(t)-1
    x(:,k+1) = x(:,k) + dt*A*x(:,k);
 end 

 lam = eig(A);
 Elam = 1+dt*lam;

 fprintf('\n')
 fprintf('    eigenvalues of A: %7.5f+%7.5fi\n', real(lam(1)), imag(lam(1)));
 fprintf('                      %7.5f+%7.5fi\n\n', real(lam(2)), imag(lam(2)));
 fprintf('eigenvalues of I+dtA: %7.5f+%7.5fi\n', real(Elam(1)), imag(Elam(1)));
 fprintf('                      %7.5f+%7.5fi\n\n', real(Elam(2)), imag(Elam(2)));

 figure(1), clf
 plot([0 V(1,1)],[0 V(2,1)],'b-','linewidth',2); hold on
 plot([0 V(1,2)],[0 V(2,2)],'r-','linewidth',2); 
 for k=1:length(t)
    if k>1, 
       delete(plt1), delete(plt2)
       plot(x(1,k-1:k),[x(2,k-1:k)],'-','linewidth',1,'color',0*[1,1,1])
    end 
    plt1 = plot([0 x(1,k)],[0 x(2,k)],'-','linewidth',2,'color',.7*[1 1 1]);
    hold on
    plt2 = plot([x(1,k)],[x(2,k)],'k.','markersize',20);
    xlabel('$x_1^{k}$','interpreter','latex')
    ylabel('$x_2^{k}$','interpreter','latex')
    title(sprintf('$t_k = %5.3f$ ($k=%3d$)', t(k),k),'interpreter','latex')
    axis equal, axis(1.5*[-1 1 -1 1])
    pause(.1)
 end

 figure(2), clf
 semilogy(t, sqrt(x(1,:).^2+x(2,:).^2),'b-','linewidth',2)
 hold on
 set(gca,'fontsize',16)
 semilogy(t, exp(t*max(eig(A))),'k--','linewidth',2)
 xlabel('$t_k$','interpreter','latex')
 legendstr{1}='$\|\mathbf{x}_k\|$';
 legendstr{2}='$e^{-t/2}$';
 legend(legendstr,'interpreter','latex')

