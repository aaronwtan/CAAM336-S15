% demo of the finite element method for the problem d2u/dt2 - d2u/d2x = f
% with zero Dirichlet boundary conditions

N = 64; % num interior points
h = 1/(N+1);
x = [1:N]*h;

% construct the stiffness matrix (integrals done by hand)
maindiag = 2/h*ones(N,1);
offdiag  = -1/h*ones(N-1,1);
K = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

% construct mass matrix
maindiag = 2*h/3*ones(N,1);
offdiag  = h/6*ones(N-1,1);
M = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

% u = 5*(1-x).^3.*x;
%u = exp(-(x(:)-.5).^2*100);
u = zeros(N,1);
u = u(:);

% plot([0;x(:);1],[0;u;0],'.-'); hold on;
% % xp = linspace(0,1,100);
% % plot(xp,sin(pi*xp),'r');
% title('initial condition')
% pause
% hold off

O = zeros(N);
A = [O -eye(N);
    M\K O];

dt = h;
tVec = 0:dt:25;
I = eye(2*N);
 
% resonant forcing - oscillations grow unboundedly
w = 1;
epsilon = 1e-1;
p = @(x,t) epsilon*x*sin(pi*w*t); % p(x,t)
f = @(x,t) pi^2*w^2*p(x,t);       % f(x,t)

U0 = [zeros(N,1);-pi*w*epsilon*x(:)];  % [ psi(x); gamma(x)]

U = U0;
for t = tVec    
    F = [zeros(N,1); f(x(:),t)];

    % crank nicolson
    U = (I + dt/2*A)\(dt/2*F + (I - dt/2*A)*U);
    u = U(1:N);
    
    plot([0;x(:);1],[0;u(:);0] + p([0;x(:);1],t),'.-')
    
    axis([0 1 -1 1])
    title(['time t = ' num2str(t)])
    drawnow
end