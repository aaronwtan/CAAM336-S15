% demo of the finite element method for the problem 
%   -u'' = sin(pi*x), 0 < x < 1, u(0) = u(1) = 0.
clear
clc

Nvec = 2.^(1:1:11)-1;   % vector of N values we shall use

% each pass of the following loop handles a new N value...
for j=1:length(Nvec)               
   N = Nvec(j);
   h = 1/(N+1);
   x = (1:N)*h;

% construct the stiffness matrix (integrals done by hand)
   K = sparse(N,N);
   K = K+sparse(1:N-1,2:N,-1/h,N,N);
   K = K+K.';
   K = K+sparse(1:N,1:N,2/h,N,N);

% construct the load vector (integrals done by hand)
   f = (2/(h*pi*pi))*(1-cos(h*pi))*sin((1:N).'*h*pi); 

% solve for expansion coefficients of Galerkin approximation
   c = K\f;

% plot the true solution
   xx = linspace(0,1,1000)';     % finely spaced points between 0 and 1.
   u = sin(pi*xx)/(pi*pi);      % true solution

   figure(1)
   clf
   subplot(2,1,1)
   plot(xx, u, 'b-','linewidth',2)
   hold on

% plot the approximation solution
   uN = zeros(size(xx));
   for k=1:N
      uN = uN + c(k)*hat(xx,k,N);
   end 
   plot(xx, uN, 'r-','linewidth',2)
   set(gca,'fontsize',16)
   xlabel('$x$','interpreter','latex')
   legend('$u(x)$', '$u_N(x)$',2,'orientation','horizontal')
   set(legend,'interpreter','latex')

   title(sprintf('$N = %d$', N),'interpreter','latex')
  
% plot the error in the solution for this N 
   subplot(2,1,2)
   plot(xx, u-uN, 'r-','linewidth',2)
   set(gca,'fontsize',16)
   xlabel('$x$','interpreter','latex')
   ylabel('$u(x) - u_N(x)$','interpreter','latex')
   
   input('hit return to continue')
end