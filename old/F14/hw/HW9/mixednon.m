% demo of the finite element method for the problem 
%   -u'' + u = x(1-x), 0 < x < 1, u(0) = 0, u'(1) = 1


Nvec = [4 8 16];   % vector of N values we shall use
maxerr = zeros(size(Nvec));          % vector to hold the max errors for each N

% each pass of the following loop handles a new N value...
for j=1:length(Nvec)               
   N = Nvec(j);
   h = 1/(N+1);
   x = [1:N]*h;

% construct the stiffness matrix (integrals done by hand)
   K = (2/h)*eye(N+1) - (1/h)*diag(ones(N,1),1) - (1/h)*diag(ones(N,1),-1);
   K(N+1,N+1) = 1/h;
   K;
   
   % construct the mass matrix (integrals done by hand)
   M = (2*h/3)*eye(N+1) + (h/6)*diag(ones(N,1),1) + (h/6)*diag(ones(N,1),-1);
   M(N+1,N+1) = h/3;
   M;
   % construct the matrix A
   A=K+M;

% Compute vector f containtin (f,phi_j), where f(x) = x(1-x)

 f = zeros(N+1,1);   
 i = [1:N]';

  f = [-((h^2)*(2*h - 12*i + 12*h*(i.^2)))/12;
     -((h^2)*(h - 2))/12+1];
 
   c = A\f;
   c;

% % plot the true solution
%    xx = linspace(0,1,500)';     % finely spaced points between 0 and 1.
%    %u = (1-xx.^2)/2;      % true solution
%    u = -xx.^2+ xx-2 + (exp(1)*(2*exp(1)-1)*exp(-xx))/(1+exp(2)) +((exp(1)+2)*exp(xx))/(1+exp(2));      % true solution
% 
%    figure(1), clf
%    
%    plot(xx, u, 'b-','linewidth',2)
%    hold on

% plot the approximation solution
   uN = zeros(size(xx));
   for k=0:N
      uN = uN + c(k+1)*hat(xx,k+1,N);
   end 
   figure(1), clf
   plot(xx, uN, 'r-','linewidth',2)
   set(gca,'fontsize',16)
   xlabel('x')
   legend( 'u_N(x)',4)
   title(sprintf('N = %d', N))
   
   
   input('hit return to continue')
end
