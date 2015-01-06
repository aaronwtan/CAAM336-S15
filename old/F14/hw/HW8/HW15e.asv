xx = linspace(0,1,500).';
for N = [3 9]
    h = 1/(N+1);
    x = (0:N+1)*h;
    % set up the matrix from the inner products computed in part (d)
    A = 2*h/3*eye(N) + h/6*diag(ones(N-1,1),1) + h/6*diag(ones(N-1,1),-1);  
    % set up the right-hand side vector from the inner products computed in part (c)
    b = 2/(h*pi^2)*(1-cos(h*pi))*sin(h*pi*(1:N).');
    % solve for the coefficients 
    c = A\b;
    % compute the approximation on fine grid on [0,1]
    fN = zeros(length(xx),1);
    for j=1:N
        fN = fN + c(j)*hat(xx,j,N);
    end
    % plot the function f and the approximation
    figure(2)
    clf
    plot(xx, sin(pi*xx), 'b-','linewidth',2)
    hold on
    plot(xx, fN, 'r--','linewidth',2)
    xlabel('$x$','interpreter','latex','fontsize',16)
    legendStr{1}=['$f(x)$'];
    legendStr{2}=['$f_{' num2str(N) '}(x)$'];
    legend(legendStr,'interpreter','latex','fontsize',16)
    %set(gca,'fontsize',16)
    if (N==3)
        saveas(figure(2),'f_3.eps','epsc')
    elseif (N==9)
        saveas(figure(2),'f_9.eps','epsc')
    end
end