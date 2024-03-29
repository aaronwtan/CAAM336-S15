%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial condition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 x = linspace(-5,5,1001);
 psi = x>0;

 col = 'kbrg';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% wave equation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 tvec = [0 .5 1 2];
 figure(1), clf
 for k=1:length(tvec)
    t = tvec(k);
    if t==0, 
       plot(x,psi,'k-','linewidth',2); hold on
    else
       uxt = .5*(x-t>0)+.5*(x+t>0);
       plot(x,uxt,'-','color',col(k),'linewidth',2); hold on
    end
 end
 ylim([-.05 1.05])
 legend('$t=0$','$t=.5$','$t=1$','$t=2$',2)
 set(legend,'interpreter','latex')
 xlabel('$x$','fontsize',14','interpreter','latex')
 ylabel('$u(x,t)$','fontsize',14','interpreter','latex')
 title('Solution of the Wave Equation','fontsize',14','interpreter','latex')
 print -depsc2 heat_v_wave1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% heat equation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 tvec = [0 .01 .1 1];
 figure(2), clf
 for k=1:length(tvec)
    t = tvec(k);
    if t==0, 
       plot(x,psi,'k-','linewidth',2); hold on
    else
       uxt = (1/2)*erfc(-x/(2*sqrt(t)));
       plot(x,uxt,'-','color',col(k),'linewidth',2); hold on
    end
 end
 legend('$t=0$','$t=.01$','$t=.1$','$t=1$',2)
 set(legend,'interpreter','latex')
 ylim([-.05 1.05])
 xlabel('$x$','fontsize',14','interpreter','latex')
 ylabel('$u(x,t)$','fontsize',14','interpreter','latex')
 title('Solution of the Heat Equation','fontsize',14','interpreter','latex')
 print -depsc2 heat_v_wave2
