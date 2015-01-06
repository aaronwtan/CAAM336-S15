 function demo1(id)

 if nargin<1, id = input('enter demo number (1-6): '); end

 switch id

 case 1    % u'(t) = u(t): ODE, first order, linear, homogeneous
     figure(1), clf
     lambda = 1;
     t =  linspace(0,5,500);
     plot(t, exp(lambda*t), 'b-','linewidth',2)
     xlabel('$t$','interpreter','latex','fontsize',16)
     ylabel('$u(t)$','interpreter','latex','fontsize',16)
     title('$u''(t) = \lambda u(t)$, $\lambda=1$','interpreter','latex','fontsize',16)

  case 2   % u'(t) = -u(t): ODE, first order, linear, homogeneous
     figure(1), clf
     lambda = -1;
     t =  linspace(0,5,500);
     plot(t, exp(lambda*t), 'b-','linewidth',2)
     xlabel('$t$','interpreter','latex','fontsize',16)
     ylabel('$u(t)$','interpreter','latex','fontsize',16)
     title('$u''(t) = \lambda u(t)$, $\lambda=-1$','interpreter','latex','fontsize',16)

  case 3   % u_t(x,t) + c*u_x(x,t) = 0: PDE, first order, linear, homogeneous: wave equation
     x = linspace(-2,5,300);
     t = 0:.05:5;
     figure(1), clf
     U = zeros(length(t),length(x));
     for j=1:length(t),
        plot(x, exp(-(x-t(j)).^2), 'b-','linewidth',2)
        axis([-2 5 -.1 1.1])
        xlabel('$x$','interpreter','latex','fontsize',16)
        ylabel('$u(x,t)$','interpreter','latex','fontsize',16)
        title('$u_t(x,t) + u_x(x,t) = 0$','interpreter','latex','fontsize',16)
        text(-1.75,1,sprintf('$t = %4.2f$',t(j)),'interpreter','latex','fontsize',16)
        if j==1, input('hit return to start'), else, pause(.05), end;
        U(j,:) = exp(-(x-t(j)).^2);
		  end
     input('hit return to continue')
     figure(2), clf
     plt=waterfall(x,t(1:5:end),U(1:5:end,:));
     set(plt,'Cdatamapping','direct') 
     xlim([min(x) max(x)]); ylim([min(t) max(t)]); zlim([0 2])
     view(-36.5,32);
     xlabel('$x$','interpreter','latex','fontsize',16)
     ylabel('$t$','interpreter','latex','fontsize',16)
     zlabel('$u(x,t)$','interpreter','latex','fontsize',16)
     title('$u_t(x,t) + u_x(x,t) = 0$','interpreter','latex','fontsize',16)

  case 4  % u''(t) = -u(t)
     figure(1), clf
     t = linspace(0,20,500);
     plot(t, 2*cos(t)+sin(t),'b-','linewidth',2)
     xlabel('$t$','interpreter','latex','fontsize',16)
     ylabel('$u(t)$','interpreter','latex','fontsize',16)
     title('$u''''(t) = -u(t)$, $u(0)=2$, $u''(0)=1$','interpreter','latex','fontsize',16)
  
  case 5  % u'(t) = u(t)^2 (blow-up in finite time)
     figure(1), clf
     t = linspace(0,1.9999,500);
     plot(t, 1./(2-t),'b-','linewidth',2), hold on
     xlim([0 2.5]), ylim([0 50])
     plot([2 2],ylim,'r--','linewidth',2)
     xlabel('$t$','interpreter','latex','fontsize',16)
     ylabel('$u(t)$','interpreter','latex','fontsize',16)
     title('$u''(t) = u(t)^2$, $u(0)=1/2$','interpreter','latex','fontsize',16)
 
  case 6  % u_t = .25*u_xxx + 1.5*u*u_x (KdV equation, solitons)
          % see http://kasmana.people.cofc.edu/SOLITONPICS/ for this solution
     figure(1), clf
     x = linspace(-15,15,500)';
     t = linspace(-5,5); N = length(x);
     h = x(2)-x(1);
     D = (-2*eye(N)+diag(ones(N-1,1),-1)+diag(ones(N-1,1),1))/(h^2);
     k1  = 1.5; k2  = 1;
     eps = (k2-k1)/(k1+k2);
     
     idx = find(abs(x)<=10);
     figure(1), clf
     U = zeros(length(t),length(idx));
     c = 1; a = 0;
     for j=1:length(t)
        eta1 = k1*x+(k1^3)*t(j);
        eta2 = k2*x+(k2^3)*t(j);
        tau = exp(-eta1-eta2)+exp(eta1-eta2)+exp(eta2-eta1)+eps^2*exp(eta1+eta2);
        u = 2*D*log(tau); 
		  plot(x(idx), u(idx), 'b-','linewidth',2), axis([min(x(idx)) max(x(idx)) -2 10])
        xlabel('$x$','interpreter','latex','fontsize',16)
        ylabel('$u(x,t)$','interpreter','latex','fontsize',16)
        title('$u_t(x,t) = (1/4) u_{xxx}(x,t) + (3/2)u(x,t) u_x(x,t)$','interpreter','latex','fontsize',16)
        text(-8,9,sprintf('$t = %4.2f$',t(j)),'interpreter','latex','fontsize',16)
        if j==1, input('hit return to start'), else, pause(.05), end;
        U(j,:) = u(idx);
     end
     input('hit return to continue')
     figure(2), clf
     plt=waterfall(x(idx),t(1:2:end),U(1:2:end,:));
     set(plt,'Cdatamapping','direct') 
     xlim(max(x(idx))*[-1 1]), ylim([min(t) max(t)]), zlim([-2 8])
     view(-15,75);
     xlabel('$x$','interpreter','latex','fontsize',16)
     ylabel('$t$','interpreter','latex','fontsize',16)
     zlabel('$u(x,t)$','interpreter','latex','fontsize',16)
     title('$u_t(x,t) = (1/4) u_{xxx}(x,t) + (3/2)u(x,t) u_x(x,t)$','interpreter','latex','fontsize',16)
  end 
