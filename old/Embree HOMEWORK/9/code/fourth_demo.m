
 tvec = [0];

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
    print -depsc2 fourth_demo
 end
