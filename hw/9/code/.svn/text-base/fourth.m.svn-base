
 tvec = [0 .00001 .00002 .00004];

 x = linspace(0,1,500);
 an0 = inline('sqrt(2)*216*(n^4-18*n^2+216)*((-1)^n-1)/((n^3-36*n)^3*pi^3)');
 an0 = inline('sqrt(2)*432*(n^4-18*n^2+216)/((36*n-n^3)^3*pi^3)');
 lam = inline('n^2*pi^2 + n^4*pi^4');
 col = 'rgb';
 str = 'abcd';
 for j=1:length(tvec)
    figure(1), clf
    t = tvec(j);
    u = zeros(size(x));
    for n=1:2:7
        u = u+exp(-lam(n)*t)*an0(n)*(sqrt(2)*sin(n*pi*x));
        [tf,loc] = ismember(n,[1 5 7]);
        if tf, 
           plot(x,u,'-','color',col(loc),'linewidth',2), hold on
        end 
    end
    legend('1 term','5 terms', '7 terms')
    set(legend,'interpreter','latex')
    xlabel('$x$','fontsize',20,'interpreter','latex')
    ylabel('$u(x,t)$','fontsize',20,'interpreter','latex')
    title(sprintf('time = %g',t),'fontsize',20,'interpreter','latex')
    eval(sprintf('print -depsc2 fourth_%s',str(j)))
    pause(.1)
 end

% surface plot
  
 tvec = linspace(0, .00004, 50);
 x    = linspace(0, 1, 100); 
 U = zeros(length(tvec),length(x),3);
 for j=1:length(tvec)
    t = tvec(j);
    u = zeros(size(x));
    for n=1:2:7
       u = u+exp(-lam(n)*t)*an0(n)*(sqrt(2)*sin(n*pi*x));
       [tf,loc] = ismember(n,[1 5 7]);
       if tf, U(j,:,loc) = u; end 
    end
 end
 figure(1), clf
 plt=waterfall(x,tvec,U(:,:,1));
 set(plt,'edgecolor','k')
 axis([0 1 0 .00004 0 .2])
 xlabel('$x$','fontsize',20,'interpreter','latex')
 ylabel('$t$','fontsize',20,'interpreter','latex')
 title('$u(x,t)$, 1 term in Fourier series','fontsize',20,'interpreter','latex')
 print -depsc2 fourth_wf1

 figure(1), clf
 plt=waterfall(x,tvec,U(:,:,2));
 set(plt,'edgecolor','k')
 axis([0 1 0 .00004 0 .2])
 xlabel('$x$','fontsize',20,'interpreter','latex')
 ylabel('$t$','fontsize',20,'interpreter','latex')
 title('$u(x,t)$, 5 terms in Fourier series','fontsize',20,'interpreter','latex')
 print -depsc2 fourth_wf5

 figure(1), clf
 plt=waterfall(x,tvec,U(:,:,3));
 set(plt,'edgecolor','k')
 axis([0 1 0 .00004 0 .2])
 xlabel('$x$','fontsize',20,'interpreter','latex')
 ylabel('$t$','fontsize',20,'interpreter','latex')
 title('$u(x,t)$, 7 terms in Fourier series','fontsize',20,'interpreter','latex')
 print -depsc2 fourth_wf7
