% Demo of solving the heat equation u_t = u_xx
% with u(0,t) = u(1,t) = 0, with u(x,0) = u0(x)
% using the finite element method in space, with
% the exact solution in time.

 n = input('Enter n: ');
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

% initial value of coefficients in u_n(x,t) = sum alf_k(t) phi_k(x)
 alf0 = u0;

 tvec=linspace(0,.2,50);
 
 MinvK = M\K;
 U = zeros(length(tvec),length(x)+2);

 for m=1:length(tvec)
    figure(1), clf
    t = tvec(m);
    alf = expm(-MinvK*t)*alf0;     % compute exact solution in time
    U(m,:) = [0 alf' 0];
    plot([0;x;1], [0;alf;0],'b.-','linewidth',2,'markersize',20);
    xlabel('x','fontsize',16)
    ylabel('t','fontsize',16)
    title(sprintf('t = %g',t),'fontsize',16)
    axis([0 1 -.1 .3])
    drawnow
    if m==1, input('hit return to start\n'), else, pause(0.02), end
 end
 figure(2), clf
 plt= waterfall([0;x;1],tvec,U);
 set(plt,'edgecolor','k')       % make the lines black
 xlabel('x','fontsize',16)
 ylabel('t','fontsize',16)
 zlabel('u_n(x,t)','fontsize',16)
 ylim([min(tvec) max(tvec)])
