% demo of the finite element method vs Finite difference

N = 8;
h = 1/(N+1);
x = [1:N]*h;

k = 8;
% construct the stiffness matrix (integrals done by hand)
maindiag = 2/h*ones(N,1);
offdiag  = -1/h*ones(N-1,1);
K = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

f = @(x) (k*pi)^2*sin(k*pi*x);

useFiniteDifference = false;
if useFiniteDifference
    % construct the load vector (integrals done by hand)
    b = h*f(x(:)); % FD load for solution #2
else
    % construct the FE load vector by quadrature
    
    for i = 1:N
        b(i) = quadgk(@(x) hat(x,i,N).*f(x),0,1);  % comment this line out for the FD
    end
end

% solve for expansion coefficients of Galerkin approximation
c = K\b;

% plot the true solution
xx = linspace(0,1,500)';     % finely spaced points between 0 and 1.
u = -exp(xx) + (exp(1)-1)*xx + 1;      % true solution #1
u = sin(k*pi*xx);                      % true solution #2

figure(1), clf
plot(xx, u, 'b-','linewidth',2)
hold on

% plot the approximation solution
uN = zeros(size(xx));
for k=1:N
    uN = uN + c(k)*hat(xx,k,N);
end
plot(xx, uN, 'r-','linewidth',2)

set(gca,'fontsize',16)
xlabel('x')
legend('true solution', 'u_N(x)')
title(sprintf('N = %d', N))

figure(2)
% plot the error in the solution for this N
plot(xx, u-uN, 'r-','linewidth',2)
set(gca,'fontsize',16)
xlabel('x')
ylabel(' u(x) - u_N(x)')

% approximate the maximum error for this value of N
maxerr = max(abs(u - uN));
title(['Max error = ' num2str(maxerr)])