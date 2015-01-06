% Use Fourier series to solve 
% the homogeneous heat equation
%     du      d^2 u    
%     --  =   ----   
%     dt      dx^2
% with inhomogeneous Dirichlet boundary conditions
%     u(0,t) = alpha,  u(1,t) = beta
% and initial condition u(x,0) = u0(x).
%
% Here we take: u0(x) = exp(x)*(alpha+(beta/e-alpha)*x),
% which satisfies the boundary conditions, where e=exp(1). 

 e = exp(1);
 alpha = -.5;
 beta  = 1;
 tfinal = 0.2;
 x = linspace(0,1,100);

 u0 = exp(x).*(alpha+(beta/e-alpha)*x);   % initial condition
 U = [u0];

% plot the solution -- as approximated the first 1, 3, and 5 terms in the 
% series solution for u(x,t) -- as time evolves. 

 t = 0:.001:tfinal;
 col = 'brk';

% correction for inhomogenous Dirichlet boundary conditions
 v =  (beta-alpha)*x + alpha;         

% compute Fourier coefficients for the initial condition, u0-v
 an0 = zeros(5,1);
 e = exp(1);
 for n=1:length(an0)
% first, the Fourier coefficient for u0(x)
    an0(n) = sqrt(2)*n*pi*(alpha*(3+n^2*pi^2)-2*beta/e+(beta-2*alpha*e-beta*n^2*pi^2)*(-1)^n)/((1+n^2*pi^2)^2);
% now, subtract the coefficient for the correction, v(x)
    an0(n) = an0(n) - sqrt(2)*(alpha-beta*(-1)^n)/(n*pi);
 end

 for j=1:length(t)
    figure(1), clf
    uj = v;        % start with the correction for the boundary conditions
    for n=1:length(an0)   
       uj = uj + exp(-pi^2*n^2*t(j))*an0(n)*(sqrt(2)*sin(n*pi*x));
       [tf,loc] = ismember(n,[1 2 3]);
       if tf         % plot solution when n = 1, 3, 5
          plot(x, uj, '-','linewidth',2,'color',col(loc)), hold on
       end
    end 
    U = [U;uj];
    hold on
    axis([0 1 -.6 1.1])
    legend('first term', 'first 2 terms', 'first 3 terms', 2)
    set(gca,'fontsize',16)
    xlabel('$x$','interpreter','latex')
    ylabel('$u(x,t)$','interpreter','latex')
    title(sprintf('$t = %4.3f$', t(j)),'interpreter','latex')
    drawnow
 end
