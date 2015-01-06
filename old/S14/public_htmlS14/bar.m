% Heat equation with second order finite difference
% for simulation purposes only!  Better approaches will follow.
% Boundary conditions: u(0) = 0, u(1) = beta

 beta = input('Enter value of temp at right end (e.g., 1.0): ');

 N = 40;
 M = 2*N^2;

 dx = 1/N;
 dt = .75*1/M;
 tfinal = 0.3;
 x = linspace(0,1,N+1);

 vj = .5*sin(x*2*pi).^2+x*beta;

 V = [vj];

 t = 0:dt:tfinal;
 for j=1:length(t)-1
    vj = vj + dt/(dx^2)*([vj(2:end) 0] - 2*vj + [0 vj(1:end-1)]);
    vj(1) = 0; vj(end)=beta;
    V = [V;vj];
 end

 figure(1), clf
 ax1 = axes('position', [.1 .35 .85 .55]);
 ax2 = axes('position', [.1 .05 .85 .2]);
 for j=1:2:length(t)
    axes(ax1)
    plot(x,V(j,:),'b-','linewidth',2)
    axis([0 1 0 max(1,1.5*beta)])
    xlabel('$x$','fontsize',20,'interpreter','latex')
    ylabel('$u(x,t$)','fontsize',20,'interpreter','latex')
    title(sprintf('time = %f', t(j)),'fontsize',20,'interpreter','latex')
    axes(ax2)
    pcolor(kron(x,[1;1]),[0 .1],kron(V(j,:),[1;1]))
    axis equal
    caxis([0 1])
    shading interp
    axis([-0.0 1.0 -0.02 0.12])
    set(gca,'ytick',[])
    if j==1, input('hit return to start simulation...'), else, pause(0.01), end
 end

   axes(ax1); hold on
   plot(x,beta*x,'r--','linewidth',2')
   legend(sprintf('solution at t = %f',t(j)),'solution at steady state',2)
