% Demo of solving the heat equation u_t = u_xx 
% with u_x(0,t) = u_x(1,t) = 0, with u(x,0) = u0(x)
% using the finite element method in space, 
% and the Forward Euler method in time.

 n  = input('Enter n: ');
 dt = input('Enter dt (<=.01): ');
 h = 1/(n+1);
 x = h*[0:n+1]';   % include boundary points

% build mass and stiffness matrices
 M=sparse(n+2,n+2);
 M=M+sparse(1:n+1,2:n+2,h/6,n+2,n+2);
 M=M+M.';
 M=M+sparse(2:n+1,2:n+1,2*h/3,n+2,n+2);
 M=M+sparse(1,1,h/3,n+2,n+2);
 M=M+sparse(n+2,n+2,h/3,n+2,n+2);
 
 K=sparse(n+2,n+2);
 K=K+sparse(1:n+1,2:n+2,-1/h,n+2,n+2);
 K=K+K.';
 K=K+sparse(2:n+1,2:n+1,2/h,n+2,n+2);
 K=K+sparse(1,1,1/h,n+2,n+2);
 K=K+sparse(n+2,n+2,1/h,n+2,n+2);
 
% fix corner entries
 M(1,1)     = h/3;
 M(n+2,n+2) = h/3;
 K(1,1)     = 1/h;
 K(n+2,n+2) = 1/h;

% initial condition that obeys the Neumann boundary conditions
 u0 = x.*(1-x).*exp(x)-(x-(exp(1)+1)/2*x.^2);

% load vector, f(t)_k = (f(x,t),phi_k(x))
% f = h*ones(size(x));
 f = zeros(size(x));

% initial value of coefficients in u_n(x,t) = sum alf_k(t) phi_k(x)
 alf0 = u0;
 alf_fe = alf0;                  % Forward Euler solution

 tvec = 0:dt:.05;
 
 MinvK = M\K;
 A = inv(eye(n+2)+dt*MinvK);
 U = zeros(length(tvec),length(x));
 Ufe = zeros(length(tvec),length(x));

 for m=1:length(tvec)
    figure(1), clf
    t = tvec(m);
% compute Forward Euler solution in time after the initial time t=0
    if m>1
 %      alf_fe = alf_fe + dt*(-MinvK*alf_fe+M\f);  
       alf_fe = A*(alf_fe + M\f);   %backward Euler
    end
    Ufe(m,:) = [alf_fe'];
    plot([x], [alf_fe],'r.-','linewidth',2,'markersize',20);
    xlabel('x','fontsize',16)
    ylabel('t','fontsize',16)
    title(sprintf('t = %g',t),'fontsize',16)
    axis([0 1 -.5 1])
    drawnow
    if m==1, input('hit return to start\n'), else, pause(0.02), end
 end
 figure(2), clf
 plt= waterfall(x,tvec,Ufe);
 set(plt,'edgecolor','k')       % make the lines black
 xlabel('x','fontsize',16)
 ylabel('t','fontsize',16)
 zlabel('u_n(x,t)','fontsize',16)
 title('Finite Elements in Space, Forward Euler in Time')
 ylim([min(tvec) max(tvec)])
