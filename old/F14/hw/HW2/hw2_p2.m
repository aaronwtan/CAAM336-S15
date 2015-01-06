% HW 2, Problem 2c. CAAM 336, Fall 2014
% solves the steady heat equation u''(x) = (2 pi)^2 sin(2 pi x) 
% with u(0) = 1, u(1) = 2
clear

uexact = @(x) sin(2*pi*x) + x + 1;

i = 1;
C = hsv(4); % neat trick: makes a matrix whose values determine colors.
Nlist = [8 16 32 64]; % number of interior points 
for N = Nlist 
    K = N+1; % number of line segments
    h = 1/K; % spacing between points
    x = (0:N+1)/(N+1);
    x = x(:); % makes x a column vector.
    
    A = -2*diag(ones(N,1)) + diag(ones(N-1,1),1) + diag(ones(N-1,1),-1);    
    A = -A/h^2;
    b = (2*pi)^2*sin(2*pi*x(2:end-1)); 
    b(1) = b(1) + 1/h^2; % modify b for inhomogeneous BCs
    b(N) = b(N) + 2/h^2; % modify b for inhomogeneous BCs
    u = A\b;
    
    figure(1)
    plot(x,[1;u;2],'.-','color',C(i,:),'linewidth',2); 
    hold on 
    
    figure(2)
    err = uexact(x)-[1;u;2];
    plot(x,err,'o-','color',C(i,:),'linewidth',2);hold on     
   
    i = i+1;    
end
figure(1)
title('Finite difference solutions compared to the exact solution','fontsize',14)
plot(x,uexact(x),'ks-')
legend('N = 8','N = 16','N = 32','N = 64','Exact')
print(gcf,'-dpng','p2c_sol') % print out graphs to file
figure(2)
title('Error between finite difference and exact solutions','fontsize',14)
legend('N = 8','N = 16','N = 32','N = 64','Exact')
print(gcf,'-dpng','p2c_error') % print out graphs to file
