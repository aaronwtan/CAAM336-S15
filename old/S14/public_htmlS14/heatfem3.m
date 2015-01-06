% Demo of solving the heat equation u_t = u_xx + 1
% with u(0,t) = u(1,t) = 0, with u(x,0) = u0(x)
% using the finite element method in space, 
% and the Forward Euler method in time.

 n  = input('Enter n: ');
 dt = input('Enter dt (<=.01): ');
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

% load vector, f(t)_k = (f(x,t),phi_k(x))
 f = h*ones(size(x));

% initial value of coefficients in u_n(x,t) = sum alf_k(t) phi_k(x)
 alf0 = u0;
 alf_fe = alf0;                  % Forward Euler solution

 tvec = 0:dt:.01;
 
 U = zeros(length(tvec),length(x)+2);
 Ufe = zeros(length(tvec),length(x)+2);

 for m=1:length(tvec)
    figure(1), clf
    t = tvec(m);
% compute Forward Euler solution in time after the initial time t=0
    if m>1
       alf_fe = alf_fe + dt*(M\(-K*alf_fe+f));
    end
    Ufe(m,:) = [0 alf_fe' 0];
    plot([0;x;1], [0;alf_fe;0],'r.-','linewidth',2,'markersize',20);
    xlabel('x','fontsize',16)
    ylabel('t','fontsize',16)
    title(sprintf('t = %g',t),'fontsize',16)
    axis([0 1 -.1 .3])
    drawnow
    if m==1, input('hit return to start\n'), else, pause(0.02), end
 end
 figure(2), clf
 plt= waterfall([0;x;1],tvec,Ufe);
 set(plt,'edgecolor','k')       % make the lines black
 xlabel('x','fontsize',16)
 ylabel('t','fontsize',16)
 zlabel('u_n(x,t)','fontsize',16)
 title('Finite Elements in Space, Forward Euler in Time')
 ylim([min(tvec) max(tvec)])
