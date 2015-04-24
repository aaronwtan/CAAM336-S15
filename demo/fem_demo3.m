% demo of the finite element method for the problem -u'' = 1
% with non zero BCs
function fem_demo3

N = 32;
h = 1/(N+1);
x = [1:N]*h;

% construct the stiffness matrix (integrals done by hand)

maindiag = 2/h*ones(N,1);
offdiag = -1/h*ones(N-1,1);
K = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

% construct the load vector (integrals done by hand)
M = (2*h/3)*diag(ones(N,1)) + (h/6)*diag(ones(N-1,1),1) + (h/6)*diag(ones(N-1,1),-1);
f = @(x) (x>.5)*100;

%b = ones(N,1)*h; % f for solution #2 and #3
b = M*f(x(:));

b(1) = b(1) + -1/h;
b(N) = b(N) + 1/h;

% solve for expansion coefficients of Galerkin approximation
c = K\b;

%
% plot the true solution
xx = linspace(0,1,500)';     % finely spaced points between 0 and 1.

hold on
% plot the approximation solution
uN = zeros(size(xx));
for j=1:N
    uN = uN + c(j)*hat(xx,j,N);
end
gN = -1*hat0(xx,N) + 1*hatNplus1(xx,N);

plot(xx, uN + gN, 'r-','linewidth',2)

set(gca,'fontsize',16)
xlabel('x')
title(sprintf('N = %d', N))
%%
function val = hat0(xx,N)
h = 1/(N+1); x = [1:N]*h;
val = ((h-xx)/h).*(xx < h);

function val = hatNplus1(xx,N)
h = 1/(N+1); x = [1:N]*h;
val = (xx-x(N))/h.*(1-h<xx);

