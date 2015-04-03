% HW 2, Problem 3c. 
% solves the steady heat equation u''(x) = 1 with u(0) = 0, u'(1) = 0

clear

uexact = @(x) .5*x.*(2-x);

C = hsv(4); % neat trick: makes a matrix whose values determine colors.

Nlist = [16 32 64 128]; % number of interior points 

i = 1;
for N = Nlist     
    h = 1/(N+1); % spacing between points
    x = (1:N)*h; x = x(:); 
    
    A = -2*diag(ones(N,1)) + diag(ones(N-1,1),1) + diag(ones(N-1,1),-1);
    A(N,N-1:N) = [1 -1]; % modify last row of matrix for no-flux boundary condition
    A = -A/h^2;
    b = ones(N,1); % f(x) = 1
    u = A\b;
    
    figure(1)
    x = [0;x;1];
    plot(x,[0;u;u(N)],'.-','color',C(i,:),'linewidth',3);
    hold on % append value at x(N+1) = x(N)    
        
    err(i) = max(abs(uexact(x)-[0;u;u(N)]));
    hvec(i) = h;
    i = i+1;    
end

figure(1)
title('Finite difference solutions compared to the exact solution','fontsize',14)
plot(x,uexact(x),'k-')
xlabel('x');ylabel('u(x)')
legend('N = 16','N = 32','N = 64', 'N = 128','Exact')
print(gcf,'-dpng','p3c_sol') % print out graphs to file

figure(2)
title('Error between finite difference and exact solutions','fontsize',14)
plot(log(hvec),log(err),'o-','linewidth',2);hold on
plot(log(hvec),log(hvec),'r--','linewidth',2);hold on
xlabel('log(h)')
ylabel('log(error)')
legend('Error','Line of slope 1')
print(gcf,'-dpng','p3c_error') % print out graphs to file
