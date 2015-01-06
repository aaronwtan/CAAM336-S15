 A = [-1 10; 0 -2]; 
 x0 = [1;1];

 tfinal = 5;
 dt = .05;
 I = eye(2);
 x_trap = x0; 
 normx = 1; 
 for k=1:tfinal/dt
     x_trap  = (I-.5*dt*A)\(I+.5*dt*A)*x_trap;  % trapezoid rule
     normx = [normx;norm(x_trap)]; 
 end
 figure(1), clf
 semilogy(0:dt:tfinal, normx, 'b.-','linewidth',2,'markersize',20) 
 xlim([0 tfinal])
 set(gca,'fontsize',14)
 xlabel('$t = k{\Delta}t$','fontsize',14,'interpreter','latex')
 ylabel('$\| {\bf x}_k \|$','fontsize',14,'interpreter','latex')
 title('Norm of iterates of the Trapezoid Rule method, $\Delta{t} = 0.05$',...
       'fontsize',14,'interpreter','latex')
 print -depsc2 traprule1.eps
