% Use Fourier series to solve 
% the homogeneous heat equation
%     du      d^2 u    
%     --  =   ----   
%     dt      dx^2
% with homogeneous Dirichlet boundary conditions
%     u(0,t) = u(1,t) = 0
% and initial condition u(x,0) = u0(x).
%
% Here we take: u0(x) = sin(2*pi*x)^2

 tfinal = 0.5;
 x = linspace(0,1,100);

 u0 = sin(2*pi*x).^2;    %  initial condition
 U = [u0];

% plot the solution -- as approximated the first 1, 3, and 5 terms in the 
% series solution for u(x,t) -- as time evolves. 

 t = 0:.001:tfinal;
 col = 'brk';

% compute Fourier coefficients for the initial condition, u0
 an0 = zeros(5,1);
 for n=1:length(an0)
    if mod(n,2)==1,       % an(0)=0 for even n for this u0(x)
       an0(n) = sqrt(2)*(-16)/(n^3*pi - 16*n*pi); 
    end
 end

 for j=1:length(t)
    figure(1), clf
    uj = zeros(size(x));
    for n=1:5      
       uj = uj + exp(-pi^2*n^2*t(j))*an0(n)*(sqrt(2)*sin(n*pi*x));
       [tf,loc] = ismember(n,[1 3 5]);
       if tf         % plot solution when n = 1, 3, 5
          plot(x, uj, '-','linewidth',2,'color',col(loc)), hold on
       end
    end 
    U = [U;uj];
    hold on
    axis([0 1 0 1.3])
    legend('first term', 'first 3 terms', 'first 5 terms', 2)
    set(gca,'fontsize',16)
    xlabel('$x$','interpreter','latex')
    ylabel('$u(x,t)$','interpreter','latex')
    title(sprintf('$t = %4.3f$', t(j)),'interpreter','latex')
    pause(.1)
 end

% display solution (first 5 terms) with a color gradient

 figure(2), clf
 ax1 = axes('position', [.1 .35 .85 .55]);
 ax2 = axes('position', [.1 .05 .85 .2]);
 
 for j=1:length(t)
    axes(ax1)
    plot(x,U(j,:),'b-','linewidth',2)
    axis([0 1 0 1.3])
    xlabel('$x$','interpreter','latex','fontsize',20)
    ylabel('$u(x,t)$','interpreter','latex','fontsize',20)
    title(sprintf('$t = %f$', t(j)),'interpreter','latex','fontsize',20)
    axes(ax2)
    pcolor(kron(x,[1;1]),[0 .1],kron(U(j,:),[1;1]))
    axis equal
    caxis([0 .5])
    shading interp
    axis([-0.0 1.0 -0.02 .12])
    set(gca,'ytick',[])
    if j==1, input('hit return to start simulation...'), else, pause(0.1), end
 end
