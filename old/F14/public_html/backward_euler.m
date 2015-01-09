% finite difference code for Backward Euler, solving du/dt - du^2/dx^2 = 0 
% on the line [0,1] with boundary conditions u(0,t) = u(1,t) = 0

N = 32; % number of interior unknowns
h = 1/(N+1); % spacing between points
x = (0:N+1)/(N+1);
x = x(:);

kappa = 1;
A = -2*diag(ones(N,1)) + diag(ones(N-1,1),1) + diag(ones(N-1,1),-1);
A = -kappa*A/h^2;

% identity matrix
I = eye(N);

% u = sin(pi*x); % "bump" initial condition
u = sin(pi*x) + sin(2*pi*x) + sin(3*pi*x) + sin(4*pi*x); % wiggly initial condition

minu = min(u); maxu = max(u); % for axis/plotting
u = u(2:end-1); % chop off endpoints x_0 and x_{N+1}

plot(x,[0;u;0]);
title('Initial condition \psi(x)','fontsize',14)
pause

dt = 100; 
for j = 0:1000    
    u = (I + dt*A)\u;
    plot(x,[0;u;0]);
    axis([0 1 minu maxu])
    title(['time t = ',num2str(j*dt)],'fontsize',14)
    pause
end
