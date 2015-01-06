 xx = linspace(0,1,1000)';    % fine grid between x=0 and x=1
 uN = 1+xx;        % inhomogeneous boundary conditions
 for k=1:20
    figure(1), clf
    plot(xx, 1+xx + sin(pi*xx)/(pi^2) - (xx.^3)/6 + (1/2+1/pi)*xx,'b-','linewidth',2), hold on
    lamk = ((k-1/2)^2)*(pi^2);
    uN = uN + 2*(-1)^k*(pi/(lamk*(lamk-pi^2))-1/(lamk^2))*sin(sqrt(lamk)*xx);
    plot(xx, uN, 'r--','linewidth',2)
    legend('true solution', 'approximation',2)
    set(gca,'fontsize',16)
    xlabel('x')
    title(sprintf('approximation from first %d terms in the series', k))
    if ismember(k,[1 2 3 20]), 
        eval(sprintf('print -depsc2 bvpsin_%d',k))
    end
    pause
 end
