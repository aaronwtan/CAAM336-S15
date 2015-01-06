% demo of the finite element method for the problem du/dt - d2u/d2x = f
% with zero Neumann boundary conditions 

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
f = 0*sin(2*pi*x(:));%1*ones(N+2,1);
b = M*f; 

% solve for expansion coefficients of Galerkin approximation
T = 1;
dt = .001;
u = x(:)>.5; % initial condition
plot(x(:),u,'.-')
title(sprintf('Time = %d',t))
pause
for t = 0:dt:T    
    u = (M + dt*K)\(M*u + dt*b); % Backward Euler
%     u = u + dt*(M\(-K*u + b)); % Forward Euler
    
    plot(x(:),u,'.-')

    title(sprintf('Time = %d',t))
    
    axis([0 1 0 2])
%     pause
    drawnow    
end