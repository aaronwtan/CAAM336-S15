
 N = 12; 
 dt = 1/4;

 h = 1/(N+1);
 x = h*[1:N];

 M = (h/6)*(4*eye(N)+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1));
 K = (1/h)*(2*eye(N)-diag(ones(N-1,1),1)-diag(ones(N-1,1),-1));

 tfinal = 1;

 k = [1:N]';
 f = 100*h^2*k;       % (f,phi_k) = 100*exp(-t)*h^2*k:  
                      % compute it once, but add the "exp(-t)" part at each step
 a0 = zeros(N,1);     % initial condition

 akp1 = a0;           % a_{k+1} will be computed in this variable
 L = chol(M)';
 for k=0:tfinal/dt-1
    t = (k+1)*dt;
    akp1 = (M+dt*K)\(M*akp1+dt*(exp(-t)*f));  % compute solution at t_{k+1}
 end

% compute the solution on a coarse grid
 uN = zeros(size(x));
 for j=1:N
   uN = uN + akp1(j)*hat(x,j,N);
 end
 xcoarse = [0 x 1];
 uNcoarse = [0 uN 0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 N = 10*N;
 dt = dt/10;

 h = 1/(N+1);
 x = h*[1:N];

 M = (h/6)*(4*eye(N)+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1));
 K = (1/h)*(2*eye(N)-diag(ones(N-1,1),1)-diag(ones(N-1,1),-1));

 tfinal = 1;

 k = [1:N]';
 f = 100*h^2*k;       % (f,phi_k) = 100*exp(-t)*h^2*k:  
                      % compute it once, but add the "exp(-t)" part at each step
 a0 = zeros(N,1);     % initial condition

 akp1 = a0;           % a_{k+1} will be computed in this variable
 L = chol(M)';
 for k=0:tfinal/dt-1
    t = (k+1)*dt;
    akp1 = (M+dt*K)\(M*akp1+dt*(exp(-t)*f));  % compute solution at t_{k+1}
 end

% plot the solution on a fine grid.

 uN = zeros(size(xx));
 for j=1:N
   uN = uN + akp1(j)*hat(xx,j,N);
 end

 figure(1), clf 
 pltfine=plot(xx,uN,'k-','linewidth',2); hold on
 pltcoarse= plot(xcoarse,uNcoarse,'b.-','markersize',25,...
                 'linewidth',1,'linestyle','--');
 axis([0 1 -1 4])
 set(gca,'fontsize',18)
 xlabel('x')
 ylabel('u_N(x,t)')
 legend([pltfine pltcoarse], 'N=120, \Delta t=1/40', 'N=12, \Delta t=1/4', 2)
 title(sprintf('Backward Euler solution at time t=1', t))
 print -depsc2 femex1sol
