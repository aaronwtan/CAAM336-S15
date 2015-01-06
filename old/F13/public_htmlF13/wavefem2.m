% Demo of solving the wave equation u_tt = u_xx
% with u(0,t) = u(1,t) = 0, with u(x,0) = u0(x)
% and zero initial velocity, using the finite element
% method in space, and the Forward Euler method in time.

 n = input('Enter n: ');
 dt = input('Enter dt: ');
 h = 1/(n+1);
 x = h*[1:n]';

% build mass and stiffness matrices
 M=sparse(n,n);
 M=M+sparse(1:n-1,2:n,h/6,n,n);
 M=M+M.';
 M=M+sparse(1:n,1:n,2*h/3,n,n);
 
 K=sparse(n,n);
 K=K+sparse(1:n-1,2:n,-1/h,n,n);
 K=K+K.';
 K=K+sparse(1:n,1:n,2/h,n,n);

% initial condition
 u0 = (x-x.^2).*sin(3*pi*x).^2;
 v0 = zeros(size(x));

% initial value of coefficients in u_n(x,t) = sum alf_k(t) phi_k(x)
 alf0  = u0;
 beta0 = v0;

 tvec = [0:dt:4];
 
 MinvK = M\K;
 A = [zeros(n) eye(n); -MinvK zeros(n)];
 U0 = [alf0;beta0];
 UU = zeros(length(tvec),length(x)+2);
 UUe = zeros(length(tvec),length(x)+2);
 normUUe = zeros(1,length(tvec));

 for m=1:length(tvec)
    figure(1), clf
    t = tvec(m);
    U = expm(A*t)*U0;     % compute exact solution in time
    if m==1, Ue = U0;
    else,    Ue = Ue + dt*A*Ue;    % forward Euler
    end
    UU(m,:) = [0 U(1:n)' 0];
    UUe(m,:) = [0 Ue(1:n)' 0];
    subplot(3,1,1:2)
    plot([0;x;1], [0;Ue(1:n);0],'b.-','linewidth',2,'markersize',20);
    xlabel('x','fontsize',16)
    ylabel('t','fontsize',16)
    title(sprintf('t = %5.3f',t),'fontsize',16)
    axis([0 1 -.3 .3])
    subplot(3,1,3)
    plot([0;x;1], abs([0;Ue(1:n)-U(1:n);0]),'r.-','linewidth',2,'markersize',20);
    ylabel('Forward Euler error','fontsize',16)
    xlabel('x','fontsize',16)
    drawnow
    if m==1, input('hit return to start\n'), else, pause(0.02), end
    normUUe(m)=sqrt(sum(UUe(m,:).*UUe(m,:)));
 end
 
 figure(2), clf
 plt= waterfall([0;x;1],tvec,UUe);
 set(plt,'edgecolor','k')       % make the lines black
 xlabel('x','fontsize',16)
 ylabel('t','fontsize',16)
 zlabel('u(x,t)','fontsize',16)
 ylim([min(tvec) max(tvec)])
 title('Forward Euler', 'fontsize', 16)

 figure(3), clf
 plt= waterfall([0;x;1],tvec,abs(UUe-UU));
 set(plt,'edgecolor','k')       % make the lines black
 xlabel('x','fontsize',16)
 ylabel('t','fontsize',16)
 zlabel('u(x,t)','fontsize',16)
 ylim([min(tvec) max(tvec)])
 title('Forward Euler Error', 'fontsize', 16)

 figure(4), clf
 semilogy(1:length(tvec),normUUe)
 xlabel('m','fontsize',16)
 ylabel('$\|\alpha^{(m)}\|$','interpreter','latex','fontsize',16)