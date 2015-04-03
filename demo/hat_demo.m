function hat_demo

xx = linspace(0,1,500)';
 for N = [3 9]
    h = 1/(N+1);
    x = [0:N+1]*h;

% set up the matrix from the inner products computed in part (c)
    A = 2*h/3*eye(N) + h/6*diag(ones(N-1,1),1) + h/6*diag(ones(N-1,1),-1);  

% set up the right-hand side vector from the inner products in part (d)
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

% plot the error
    figure(3), clf
    plot(xx, sin(pi*xx)-fN, 'r-','linewidth',2)
    set(gca,'fontsize',16)
    xlabel('x'), title(sprintf('Error, N = %d', N))
    ylabel('sin(\pi x) - f_N')
end

function phi_k = hat(x,k,n)

% function phi_k = hat(x,k,n)
%
% evaluates the hat function phi_k(x), where n denotes the
% size of the mesh, so that phi_k is non-zero on ((k-1)*h,(k+1)*h)
% with h = 1/(n+1).

 h = 1/(n+1);
 xk = [0:n+1]*h;

 if k==0,       phi_k =  ((x>=xk(1))&(x<xk(2))).*((xk(2)-x)/h);
 elseif k==n+1, phi_k =  ((x>=xk(n+1))&(x<=xk(n+2))).*((x-xk(n+1))/h);
 else,          phi_k =  ((x>=xk(k))&(x<xk(k+1))).*((x-xk(k))/h) ...
                       + ((x>=xk(k+1))&(x<xk(k+2))).*((xk(k+2)-x)/h);
 end

 
