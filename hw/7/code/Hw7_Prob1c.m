function Hw7_Prob1c

iter = 1;
C = hsv(3);
for ep = [1 .25 .1];
    N = 32;
    h = 1/(N+1);
    x = [1:N]*h;
    
    M = (2/3)*diag(ones(N,1)) + (1/6)*diag(ones(N-1,1),1) + (1/6)*diag(ones(N-1,1),-1);
    M = h*M;
    
    K = 2*diag(ones(N,1)) - diag(ones(N-1,1),1) - diag(ones(N-1,1),-1);
    K = (1/h)*K;
    
    A = M + ep*K;
    
    b = h*ones(N,1);
    
    c = A\b;
    
    xx = linspace(0,1,500)';     % finely spaced points between 0 and 1.
    hold on
    % plot the approximation solution
    uN = zeros(size(xx));
    for j=1:N
        uN = uN + c(j)*hat(xx,j,N);
    end
    plot(xx,uN,'color',C(iter,:),'linewidth',2)
    iter = iter + 1;
end
legend('\epsilon = 1','\epsilon = .25','\epsilon = .1')
set(gca,'fontsize',14)
xlabel('x','fontsize',15)
ylabel('Solution u(x)','fontsize',15)
print(gcf,'-depsc','../ep1.eps')

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