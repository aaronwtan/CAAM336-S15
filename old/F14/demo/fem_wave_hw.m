% demo of the finite element method for the problem d2u/dt2 - d2u/d2x = 0
% with zero Dirichlet boundary conditions

N = 63; % num interior points
h = 1/(N+1);
x = [1:N+1]*h;

% construct the stiffness matrix (integrals done by hand)
k1 = 1; k2 = 1;
maindiag = 2*ones(N+1,1);
offdiag  = -ones(N,1);
K = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

% adjust for Neumann BC on right
K(N+1,N) = -1;K(N,N+1) = -1;
K(N+1,N+1) = 1;
K = K/h;

% construct mass matrix
middle = ceil(N/2); % middle point index
k1 = .25;
k2 = 1;
maindiag = 2*h/3*ones(N+1,1);
maindiag(1:middle) = k1*maindiag(1:middle);
maindiag(middle) = h/3*(k1+k2);
maindiag(middle+1:N+1) = k2*maindiag(middle+1:N+1);

offdiag  = (h/6)*ones(N,1);
offdiag(1:middle) = k1*offdiag(1:middle);
offdiag(middle+1:N) = k2*offdiag(middle+1:N);

M = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);
% adjust for Neumann BC
M(N+1,N+1) = M(N+1,N+1)/2;

u = x(:).*exp(-(x(:)).^2*100);
u = u(:);

% solve using matrix exponential
U0 = [zeros(N+1,1);u];
O = zeros(N+1);
A = [O -eye(N+1);
    M\K O];

uMat = [];
tVec = 0:.02:2;
for t = tVec
    U = expm(-A*t)*U0;
    u = U(N+2:end);
    
    uMat = [uMat; [0;u]'];
%     plot([0;x(:)],[0;u],'.-');
%     axis([0 1 -.1 .1])
%     drawnow
end

surf([0;x(:)],tVec,uMat)
shading interp
xlabel('x axis')
ylabel('time')
view(2)
% print(gcf,'-dpng','wavefem_1')
print(gcf,'-dpng','wavefem_2')