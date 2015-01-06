% demo of the finite element method for the problem d2u/dt2 - d2u/d2x = 0
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
% initial condition psi(x)
u = 10*x(:).*exp(-x(:).^2*100);
u = u(:);

plot([0;x(:);1],[0;u;0],'.-'); hold on;
title('Initial condition')
axis([0 1 -2 2])
pause
hold off

% solve using matrix exponential 
O = zeros(N);
A = [O -eye(N);
     M\K O];
U0 = [u;zeros(N,1)];
 
uMat = [];
dt = .01;
tVec = 0:dt:2;
for t = tVec
    U = expm(-A*t)*U0;
    u = U(1:N);
    plot([0;x(:);1],[0;u;0],'.-');
    uMat = [uMat; [0;u;0]'];
    axis([0 1 -2 2])
    drawnow
end

surf([0;x(:);1],tVec,uMat)
shading interp