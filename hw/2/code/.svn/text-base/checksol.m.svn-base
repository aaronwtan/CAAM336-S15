
 c = .385;
 kappa = 3.86;
 rho = 8.96;
 l = 10;
 theta = pi/l;

% first style: snapshots at t = 0, 4, 8, ..., 20

 t = 0:4:20;
 x = linspace(0,l,100);

 figure(1), clf
 for j=1:length(t)
    u = exp(-kappa*theta^2*t(j)/(rho*c))*sin(theta*x);  % compute u(:,t(j))
    plot(x,u,'k-','linewidth',2), hold on
    text(4.75, max(u)-.03, sprintf('t = %d', t(j)))
 end
 axis([0 10 0 1.1])
 set(gca,'fontsize',14)
 xlabel('x')
 ylabel('u(x,t)')
 print -depsc2 checksol1

% generate data for 3-d plots

 x = linspace(0,l,100);
 t = linspace(0,20,50);
 U = zeros(length(t), length(x));
 for j=1:length(t)
    U(j,:) = exp(-kappa*theta^2*t(j)/(rho*c))*sin(theta*x);
 end

% mesh plot
 figure(2), clf
 mesh(x,t,U,'edgecolor','k')
 view(-55,20)
 set(gca,'fontsize',14)
 xlabel('x'), ylabel('t'), zlabel('u(x,t)')
 print -depsc2 checksol2

% surf plot
 figure(3), clf
 surf(x,t,U)
 view(-55,20)
 set(gca,'fontsize',14)
 xlabel('x'), ylabel('t'), zlabel('u(x,t)')
 print -depsc2 checksol3

% waterfall plot
 figure(4), clf
 plt = waterfall(x,t,U);
 set(plt,'edgecolor','k')       % make the lines black
 view(-55,20)
 set(gca,'fontsize',14)
 xlabel('x'), ylabel('t'), zlabel('u(x,t)')
 print -depsc2 checksol4

% contour plot
 figure(5), clf
 [cs,h] = contourf(x,t,U,[.05:.05:.95],'k-');
 set(gca,'fontsize',14)
 xlabel('x'), ylabel('t')
 colorbar 
 print -depsc2 checksol5
