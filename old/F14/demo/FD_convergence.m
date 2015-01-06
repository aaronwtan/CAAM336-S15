% solves the steady heat equation u''(x) = f with u(0) = 0, u(1) = 0
clear
uexact = @(x) sin(2*pi*x);
i = 1;

C = hsv(4);
Nlist = [8 16 32 64]; 
for N = Nlist 
    K = N+1; % number of line segments
    h = 1/K; % spacing between points    
    x = linspace(0,1,K+1)'; 
    
    A = -2*diag(ones(N,1)) + diag(ones(N-1,1),1) + diag(ones(N-1,1),-1);
    A = -A/h^2;
    b = (2*pi)^2*sin(2*pi*x(2:end-1)); 
    u = A\b;
    
    figure(1)
    plot(x,[0;u;0],'.-','color',C(i,:));hold on % value at x(N+1) = x(N)
    title('Finite difference solution','fontsize',14)
    figure(2)
    err = uexact(x)-[0;u;0];
    plot(x,err,'.-','color',C(i,:));hold on 
    title('Error between finite difference solution and exact solution','fontsize',14)
    
    hsize(i) = h; % store mesh size
    error(i) = max(err);
    i = i+1;    
end
figure(1)
legend('N = 8', 'N = 16', 'N = 32', 'N = 64')
figure(2)
legend('N = 8', 'N = 16', 'N = 32', 'N = 64')

figure 
plot(log(hsize),log(error),'.-');hold on
loglog(log(hsize),log(hsize.^2),'r.-') 
xlabel('Log of grid spacing h','fontsize',14)
legend('Log of finite difference error','Log of h^2')
title('h^2 convergence of finite difference error','fontsize',14)