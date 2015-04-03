% make finite difference system

N = 32;
h = 1/(N+1);
x = (1:N)*h;

A = 2*diag(ones(N,1)) - diag(ones(N-1,1),-1) - diag(ones(N-1,1),+1);
A = (1/h^2)*A;
b = exp(-25*(x(:)-.75).^2);  % f(x) = exp(-25 * (x-.75)^2)

% plot(x,b)

u = A\b;
plot([0 x 1],[0;u;0],'-','linewidth',2)
set(gca,'fontsize',15)

%% compute solution using fewer eigenvectors

[V D] = eig(A);

k = 5;

Vk = V(:,1:k);
lam = diag(D); 
lam_k = lam(1:k);
uk = Vk*((Vk'*b)./lam_k);
hold on;plot([0 x 1],[0;uk;0],'r.')
title(sprintf('Error ||u-u_k|| = %f',norm(u-uk)),'fontsize',16)

% % plot error
% hold on;plot([0 x 1],[0;u-uk;0],'b.-')

%% plot eigenvectors

j = 5;
[~,ind] = max(abs(V(:,j)));
scale = sin(j*pi*x(1))/V(1,j); % scale so that the value at x(1) matches that of sin(j*pi*x(1))
plot(x,V(:,j)*scale,'b.')

% xp = linspace(0,1,250);
% hold on;plot(xp,sin(j*pi*xp),'r')
set(gca,'fontsize',15)

title(sprintf('Eigenvalue %d is %f',j, sqrt(D(j,j)/h)),'fontsize',16)