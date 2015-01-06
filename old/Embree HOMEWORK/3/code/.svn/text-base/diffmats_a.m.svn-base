
 Nvec = [4 8 16 32 64 128];
 err = zeros(size(Nvec)); 
 figure(1), clf
 for j=1:length(Nvec)
    N = Nvec(j);
    h = 1/(N+1);
    x = h*[1:N]'; 
    A = (-2*eye(N)+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1))/(h^2);
    f = 25*pi^2*cos(5*pi*x);
    u = A\f;
% plot the function, adding in the homogeneous values at the boundary;
% this tacks on extra entries for the x and u vectors:
    figure(1), subplot(3,2,j)
    plot([0;x;1],[0;u;0],'k-','linewidth',2), hold on
    axis([0 1 -2.5 2.5])
    xlabel('x')
    ylabel('u(x)')
    text(.05,-2.05,sprintf('N = %d',N))
% compute error
    true_u = 1-2*x-cos(5*pi*x);
    err(j) = max(abs(true_u - u));
 end
 print -depsc2 diffmats_a1.eps

% error plot
 figure(2), clf
 loglog(Nvec, err, 'k.-','linewidth',1.5), hold on
 loglog(Nvec, Nvec.^(-2), 'k--', 'linewidth',1.5)
 legend('Error', 'perfect h^2 convergence',1)
 loglog(Nvec, err, 'k.','markersize',20)
 set(gca,'fontsize',14)
 xlabel('N')
 ylabel('maximum error')
 title('Error in Approximate Solutions of the Homogeneous Dirichlet Problem')
 print -depsc2 diffmats_a2.eps
