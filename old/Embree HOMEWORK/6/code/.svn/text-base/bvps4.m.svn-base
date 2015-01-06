
 xx = linspace(0,1,1000)';    % fine grid between x=0 and x=1

 uN = zeros(size(xx));        

 u_exact = inline('(-exp(x)+cos(sqrt(10)*x)+(exp(1)*csc(sqrt(10))-cot(sqrt(10)))*sin(sqrt(10)*x))/11');

 for k=1:20
    figure(1), clf
    plot(xx, u_exact(xx),'b-','linewidth',2), hold on
    uN = uN + 2*(1-exp(1)*(-1)^k)*k*pi/((1+k^2*pi^2)*(k^2*pi^2-10))*sin(k*pi*xx);
    plot(xx, uN, 'r--','linewidth',2)
    legend('true solution', 'approximation')
    set(gca,'fontsize',16)
    xlabel('x')
    title(sprintf('approximation from first %d terms in the series', k))
    axis([0 1 -18 0])
    if ismember(k,[1 2 20]), 
        eval(sprintf('print -depsc2 bvps4_%d',k))
    end
    drawnow
%    pause
 end
 figure(2), clf
 plot(xx, u_exact(xx)-uN, 'r-','linewidth',2)
 set(gca,'fontsize',16)
 xlabel('x')
 title('error in the 20-term approximation')
 print -depsc2 bvps4_20_err 
