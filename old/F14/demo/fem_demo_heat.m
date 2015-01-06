% demo of the finite element method for the problem du/dt - d2u/d2x = f
% with zero Dirichlet boundary conditions 

N = 8; % num interior points
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

% construct the load vector 
f = 0*ones(N,1);
b = M*f; 

% solve for expansion coefficients of Galerkin approximation
T = 1;
dt = .01;
u = x(:)>.5; % initial condition

plot([0;x(:);1],[0;u;0],'.-'); hold on;
% xp = linspace(0,1,100);
% plot(xp,sin(pi*xp),'r');
title('initial condition')
pause
hold off

for t = 0:dt:T
    u = (M + dt*K)\(M*u + dt*b); % Backward Euler
%     u = u + dt*(M\(-K*u + b)); % Forward Euler
    
    plot([0;x(:);1],[0;u;0],'.-')
%     hold on
%     xp = linspace(0,1,100);
%     plot(xp,.5*xp.*(1-xp),'r');
    title(sprintf('Time = %d',t))
    if t < dt
        minu = 0;maxu = max(u);
    end
    axis([0 1 minu maxu])
%     drawnow
pause 
    
end