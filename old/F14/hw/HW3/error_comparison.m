% finite difference code for Backward Euler, solving du/dt - du^2/dx^2 = 0
% on the line [0,1] with boundary conditions u(0,t) = u(1,t) = 0

N = 16; % number of interior unknowns
h = 1/(N+1); % spacing between points
x = (0:N+1)/(N+1);
x = x(:);

kappa = 1;
A = -2*diag(ones(N,1)) + diag(ones(N-1,1),1) + diag(ones(N-1,1),-1);
A = -kappa*A/h^2;

% identity matrix
I = eye(N);

% u = sin(pi*x); % "bump" initial condition
u = sin(pi*x);

uexact = @(x,t) exp(-kappa*pi^2*t)*sin(pi*x);

minu = min(u); maxu = max(u); % for axis/plotting
u = u(2:end-1); % chop off endpoints x_0 and x_{N+1}

plot(x,[0;u;0]);
title('Initial condition \psi(x)','fontsize',14)
pause

dt = .01;
for j = 0:100
    u = (I + dt*A)\u;
    t = j*dt;
    %     clf
    %     plot(x,[0;u;0]);hold on
    %     plot(x,[0;expm(-A*t)*sin(pi*x(2:end-1));0],'k.-');hold on
    %     plot(x,uexact(x,t),'ro-');
    %     axis([0 1 minu maxu])
    ih = N/2 + 1;
    xh = x(ih + 1); % offset to account for x0
    semilogy(t,abs(uexact(xh,t)-u(ih)),'.');hold on
    uhODE = expm(-A*t)*sin(pi*x(2:end-1));
    plot(t,abs(uexact(xh,t)-uhODE(ih)),'r.'); 
    
    title(['time t = ',num2str(j*dt)],'fontsize',14)    
end
