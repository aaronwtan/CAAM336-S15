% approximation to f(x) = 1 using eigenfunctions of -d^2/dx^2 on C^2_D[0,1],
% i.e., with homogeneous Dirichlet boundary conditions.

 N = [1:2:15];

 xx = linspace(0,1,1000)';
 fN = zeros(size(xx));

 showerror = 1;

 for N=1:2:25
    fN = fN + 4/(N*pi)*sin(N*pi*xx);
    figure(1), clf
    plot(xx,ones(size(xx)),'b-','linewidth',2)
    hold on
    plot(xx,fN,'r-','linewidth',2)
    set(gca,'fontsize',16)
    xlabel('$x$','interpreter','latex','fontsize',16)
    axis([0 1 0 1.6])
    legend('$f$',sprintf('$f_{%d}$',N),2,'orientation','horizontal')
    set(legend,'interpreter','latex')
    title('best approximation from ${\rm span}\{u_1, \ldots, u_N\}$','fontsize',16,'interpreter','latex')

    if showerror == 1
       figure(2), clf
       plot(xx,abs(ones(size(xx))-fN),'r-','linewidth',2)
       xlabel('$x$','interpreter','latex','fontsize',16)
       ylabel(sprintf('$|f(x) - f_{%d}|$',N),'fontsize',16,'interpreter','latex')
       title('error in best approximation','fontsize',16,'interpreter','latex')
    end
    input('hit return to continue')
 end
