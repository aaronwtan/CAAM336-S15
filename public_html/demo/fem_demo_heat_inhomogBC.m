% demo of the finite element method for the problem du/dt - d2u/d2x = f
% with time-varying boundary conditions

N = 32;
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
f = zeros(N+2,1);%1*ones(N+2,1);

% solve for expansion coefficients of Galerkin approximation
uL = @(t) 0; %sin(10*pi*t);
uR = @(t) 1; %cos(10*pi*t);

T = .01;
dt = .001;
u = x(:)>.5; % initial condition
% plot(x(:),u,'.-')
% pause
for t = 0:dt:T    
    
    A = (M + dt*K);
    b = M*u;
    
    % enforce Dirichlet BCs
    uD = zeros(N+2,1);
    uD(1) = uL(t); % left endpoint
    uD(N+2) = uR(t);  % right endpoint        
    
    b = b - A*uD;
    
    b(1) = uL(t); 
    b(N+2) = uR(t);
    A(1,:) = 0;A(:,1) = 0; A(1,1) = 1;    
    A(N+2,:) = 0;A(:,N+2) = 0; A(N+2,N+2) = 1;        
    
    u = A\b; % Backward Euler
    
    color_line3(x(:),t*ones(size(u(:))),u(:),u(:),'.')

    title(sprintf('Time = %d',t))
    
%     axis([0 1 -5 5])
%     drawnow    
end