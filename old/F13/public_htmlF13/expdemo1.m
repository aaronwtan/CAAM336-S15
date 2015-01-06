
 v1 = [1;1]/sqrt(2);
 v2 = [1;-1]/sqrt(2);
 V = [v1 v2];
 Lam = diag([-.5 -2]);
 A = V*Lam*inv(V)

 t = [0:.1:5];
 x0 = randn(2,1);
 %x0 = [-1;1];
 
 x = zeros(2,length(t));
 for k=1:length(t)
    x(:,k) = expm(t(k)*A)*x0;
 end 

 lam = eig(A);
 fprintf('Eigenvalues:  %10.7f+%10.7fi\n', real(lam(1)), imag(lam(1)));
 fprintf('              %10.7f+%10.7fi\n', real(lam(2)), imag(lam(2)));

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
    xlabel('$x_1(t)$','interpreter','latex')
    ylabel('$x_2(t)$','interpreter','latex')
    title(sprintf('$t = %5.3f$', t(k)),'interpreter','latex')
    axis equal, axis(1.5*[-1 1 -1 1])
    pause(.1)
 end

