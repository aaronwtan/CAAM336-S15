% demo of the finite element method for the problem 
%   -d/dx((1+x^2) du/dx)  = 2x, 0 < x < 1, u(0) = u(1) = 0.
% which has exact solution u(x) = (4/pi)*atan(x) - x.

Nvec = [4 8 16 32 64 128 256 512];   % vector of N values we shall use
maxerr = zeros(size(Nvec));          % vector to hold the max errors for each N

% each pass of the following loop handles a new N value...
for j=1:length(Nvec)               
   N = Nvec(j);
   h = 1/(N+1);
   x = [1:N]*h;

% construct the stiffness matrix (integrals done by hand)
   maindiag = 2/h + 2*h/3 + 2*h*([1:N].^2);
   offdiag  = -1/h - h*(([1:N-1].^2) + [1:N-1] + 1/3);
   K = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);

% construct the load vector (integrals done by hand)
   f = 2*h^2*[1:N]';

% solve for expansion coefficients of Galerkin approximation
   c = K\f;

% plot the true solution
   xx = linspace(0,1,1000)';     % finely spaced points between 0 and 1.
   u = (4/pi)*atan(xx)-xx;      % true solution

   figure(1), clf
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
   xlabel('x')
   legend('true solution', 'u_N(x)','location','south')
   title(sprintf('N = %d', N))
  
% plot the error in the solution for this N 
   subplot(2,1,2)
   plot(xx, u-uN, 'r-','linewidth',2)
   set(gca,'fontsize',16)
   xlabel('x')
   ylabel(' u(x) - u_N(x)')

% approximate the maximum error for this value of N
   maxerr(j) = max(abs(u - uN));
   
   input('hit return to continue')
end

% plot the maximum error
  figure(2), clf
  loglog(Nvec, maxerr, 'r.-', 'linewidth',2, 'markersize',20)
  hold on
  loglog(Nvec, Nvec.^(-2), 'b--', 'linewidth',2)
  legend('computed error', 'O(h^2) error') 
  set(gca,'fontsize',16);
  xlabel('N')
  ylabel('Maximum error in u_N')

  print -depsc2 femb.eps 
