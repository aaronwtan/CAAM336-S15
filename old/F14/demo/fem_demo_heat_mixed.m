% demo of the finite element method for the problem du/dt - d2u/d2x = f
% with mixed boundary conditions

N = 8;
h = 1/(N+1);
x = [0:N+1]*h; % redefine x with 0 and 1 at the endpoints

% construct the stiffness matrix (integrals done by hand)
maindiag = [1/h; 2/h*ones(N,1); 1/h];
offdiag  = -1/h*ones(N+1,1);
K = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

% construct mass matrix
maindiag = [h/3; 2*h/3*ones(N,1); h/3];
offdiag  = h/6*ones(N+1,1);
M = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

% construct the load vector 
f = 0*ones(N+2,1);

% solve for expansion coefficients of Galerkin approximation
T = 1;
dt = .001;
u = x(:)>.5; % initial condition

A = (M + dt*K);
uD = zeros(N+2,1);
uL = @(t) 0;
uR = @(t) sin(4*pi*t);
for t = 0:dt:T    
    uD(1) = uL(t);
    uD(N+2) = uR(t);
    
    b = (M*u + dt*M*f - dt*K*uD);    
    b(1) = uD(1);
    b(N+1) = uD(N+1);
    A(1,:) = 0; A(:,1) = 0;A(1,1) = 1;
    A(end,:) = 0; A(:,end) = 0;A(end,end) = 1;
    u = A\b; % Backward Euler
%     u = u + dt*(M\(-K*u + b)); % Forward Euler
    
    plot(x(:),u,'.-')

    title(sprintf('Time = %d',t))
    
    axis([0 1 -2 2])
    drawnow    
end