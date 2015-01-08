% solves the steady heat equation with u(0) = u(1) = 0, f = 1

K = 8; % number of subdivisions
N = K - 1; % number of points
x = linspace(0,1,N + 2); % points on a line
h = 1/K; % spacing between points

kappa = 1; % try changing this!  what happens?
A = -2*diag(ones(N,1)) + diag(ones(N-1,1),1) + diag(ones(N-1,1),-1); % constructs the finite difference matrix\
A = (-kappa/h^2)*A; % scale the matrix
 
f = ones(N,1);
u = A\f;

% plot solution
figure
plot(x,[0 ; u ; 0],'bo-')
xlabel('x')
ylabel('u(x)')
title('Finite Difference approximation to u''(x) = 1')
