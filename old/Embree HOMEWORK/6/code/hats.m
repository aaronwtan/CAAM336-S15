
 N = 4;
 h = 1/(N+1);
 x = [0:N+1]*h;

 figure(1), clf
 divax
 xx = linspace(0,1,500)';
 plot(xx,hat(xx,3,N), 'k-','linewidth',4);
 set(gca,'xtick',[0:.2:1],'ytick',[0 .5 1],'xticklabel','|||||')
 axis([0 1 -.01 1.2])
 set(gca,'fontsize',16)
 print -depsc2 hats.eps

 xx = linspace(0,1,500)';
 for N = [3 9]
    h = 1/(N+1);
    x = [0:N+1]*h;

% set up the matrix from the inner products computed in part (a)
    A = 2*h/3*eye(N) + h/6*diag(ones(N-1,1),1) + h/6*diag(ones(N-1,1),-1);  

% set up the right-hand side vector from the inner products in part (b)
    b = 2/(h*pi^2)*(1-cos(h*pi))*sin(h*pi*[1:N]');

% solve for the coefficients 
    c = A\b;

% compute the approximation on fine grid on [0,1]
    fN = zeros(length(xx),1);
    for j=1:N
       fN = fN + c(j)*hat(xx,j,N);
    end

% plot the function f and the approximation
    figure(2), clf
    plot(xx, sin(pi*xx), 'b-','linewidth',2), hold on
    plot(xx, fN, 'r--','linewidth',2)
    legend('sin(\pi x)', 'f_N')
    set(gca,'fontsize',16)
    xlabel('x'), title(sprintf('N = %d', N))
    eval(sprintf('print -depsc2 hats_%da', N))

% plot the error
    figure(3), clf
    plot(xx, sin(pi*xx)-fN, 'r-','linewidth',2)
    set(gca,'fontsize',16)
    xlabel('x'), title(sprintf('Error, N = %d', N))
    ylabel('sin(\pi x) - f_N')
    eval(sprintf('print -depsc2 hats_%db', N))
end
