% demo of the finite element method for the problem
%   -u'' = 1, 0 < x < 1, u(0) = 0, u'(1) = 0.

N = 8;
h = 1/(N+1);
x = [1:N]*h;

k = 1;
% construct the stiffness matrix (integrals done by hand)
maindiag = 2/h*ones(N,1);
offdiag  = -1/h*ones(N-1,1);
K = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

K(N,N+1) = -1/h; K(N+1,N) = -1/h; K(N+1,N+1) = 1/h; % modification for Neumann BC

% construct the load vector (integrals done by hand)
b = ones(N,1)*h; % f for solution #2 and #3
b(N+1) = h/2; % modification for Neumann BC

% solve for expansion coefficients of Galerkin approximation
c = K\b;

% plot the true solution
xx = linspace(0,1,500)';     % finely spaced points between 0 and 1.
u = .5*xx.*(2-xx);      % true solution #2

figure(1), clf
plot(xx, u, 'b-','linewidth',2)
hold on

% plot the approximation solution
uN = zeros(size(xx));
for k=1:N
    uN = uN + c(k)*hat(xx,k,N);
end
uN = uN + c(N+1)*(xx > x(N)).*(xx-x(N))/h; % add bc on right
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