% solves the steady heat equation w/u(0) = u(1) = 0 and manufactured
% solution (the exact solution is u(x) = sin(4*pi*x))

K = 8; % number of subdivisions - try changing this!
N = K - 1; % number of points
x = linspace(0,1,N + 2); % points on a line
h = 1/K; % spacing between points

kappa = 1; 
A = -2*diag(ones(N,1)) + diag(ones(N-1,1),1) + diag(ones(N-1,1),-1); % constructs the finite difference matrix\
A = (-kappa/h^2)*A; % scale the matrix
 
f = kappa*(4*pi)^2*sin(4*pi*x(2:end-1)); % source function for exact solution u = sin(4*pi*x)
f = f(:); % makes f a column vector
u = A\f;

% plot solution
figure
plot(x,[0 ; u ; 0],'bo-')

hold on;

% overlay exact solution
plot(0:.01:1,sin(4*pi*(0:.01:1)),'r') 
xlabel('x')
ylabel('u(x)')
title('Finite Difference approximation and exact solution')

figure
plot(x,[0 ; u ; 0]- sin(4*pi*x(:)),'bo-')
xlabel('x')
ylabel('u_{exact}(x_i)-u(x_i)')
title('Error between FD approximation and exact solution')