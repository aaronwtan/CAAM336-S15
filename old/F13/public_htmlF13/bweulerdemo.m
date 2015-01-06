% Demo of Backward Euler for a symmetric matrix
% Stable for all A with negative eigenvalues

 v1 = [1;1]/sqrt(2);
 v2 = [1;-1]/sqrt(2);
 V = [v1 v2];
 Lam = diag([-.5 -25]);    % eigenvalues of A
 A = V*Lam*inv(V)

 dt = 0.1;
 t = [0:dt:3];

x0 = randn(2,1);
 %x0 = [1;0];
 
 x = zeros(2,length(t));
 x(:,1) = x0;
 I = eye(2);
 for k=1:length(t)-1
    x(:,k+1) = (I-dt*A)\x(:,k);
 end 

 lam = eig(A);
 Elam = 1./(1-dt*lam);

 fprintf('\n')
 fprintf('          eigenvalues of A: %7.5f+%7.5fi\n', real(lam(1)), imag(lam(1)));
 fprintf('                            %7.5f+%7.5fi\n\n', real(lam(2)), imag(lam(2)));
 fprintf('eigenvalues of inv(I-dt*A): %7.5f+%7.5fi\n', real(Elam(1)), imag(Elam(1)));
 fprintf('                            %7.5f+%7.5fi\n\n', real(Elam(2)), imag(Elam(2)));

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
 plot(t, x(1,:),'b-','linewidth',2)
 hold on
 plot(t, x(2,:),'r-','linewidth',2)
 set(gca,'fontsize',16)
 plot(t, exp(t*max(eig(A))),'k--','linewidth',2)
 xlabel('$t_k$','interpreter','latex')
 legend('$x_1^{(k)}$','$x_2^{(k)}$','$e^{\lambda_1 t}$',1)
 set(legend,'interpreter','latex')

 figure(3), clf
 semilogy(t, abs(x(1,:)),'b-','linewidth',2)
 hold on
 semilogy(t, abs(x(2,:)),'r-','linewidth',2)
 set(gca,'fontsize',16)
 semilogy(t, exp(t*max(eig(A))),'k--','linewidth',2)
 xlabel('$t_k$','interpreter','latex')
 legend('$x_1^{(k)}$','$x_2^{(k)}$','$e^{\lambda_1 t}$',1)
 set(legend,'interpreter','latex')

