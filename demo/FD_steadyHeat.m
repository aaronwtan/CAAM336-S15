% solution of the steady heat equation 
%
% -u''(x) = f(x)
% u(0) = u(1) = 0
% 
% using the finite difference method. 

% N = 8;
h = 1/(N+1);
kappa = 1;
x = (1:N)*h; % points x_i
x = x(:); % turn x into column vector

% construct matrix
A = diag(2*ones(N,1)) + diag(-1*ones(N-1,1),1) + diag(-1*ones(N-1,1),-1);
A = (kappa/h^2)*A;

% construct b
b = (2*pi)^2*sin(2*pi*x);

% solve for u
u = A\b;

% add on x = 0, x = 1 boundary points
x = [0; x; 1];

% figure
% plot(x,[0; u; 0],'.-') % plot finite difference solution
% hold on
% 
% xf = linspace(0,1,250); % plot exact solution on finer grid
% plot(xf,sin(2*pi*xf),'r-')
% xlabel('x')
% ylabel('u(x)')
% legend('Finite difference solution','Exact solution')
% 
% figure
error = abs([0;u;0] - sin(2*pi*x));
maxerr = max(error);
% plot(x,error,'r.')
% title('Error in finite difference solution at points')
