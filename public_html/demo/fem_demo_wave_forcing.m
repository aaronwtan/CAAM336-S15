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

% solve using matrix exponential
O = zeros(N);
A = [O -eye(N);
    M\K O];
U0 = [zeros(N,1);zeros(N,1)];

dt = .01;

tVec = 0:dt:10;
I = eye(2*N);
% f = ones(N,1);

f = sin(2*pi*x(:)); 

F = [zeros(N,1);M\f];
U = U0;
for t = tVec
    U = (I + dt/2*A)\(dt/2*F + (I - dt/2*A)*U); % using Crank Nicolson
    u = U(1:N);
    plot([0;x(:);1],[0;u(:);0],'.-')
    axis([0 1 -10 10])
    drawnow
end