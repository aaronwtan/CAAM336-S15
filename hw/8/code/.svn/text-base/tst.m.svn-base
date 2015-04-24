 N = input('enter N:  ');
 dt = input('enter dt: ');
 showtimes = 1;

 h = 1/(N+1);
 x = h*[1:N];

 M = (h/6)*(4*eye(N)+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1));
 K = (1/h)*(2*eye(N)-diag(ones(N-1,1),1)-diag(ones(N-1,1),-1));

 tfinal = 1;
 xx = linspace(0,1,1000)';     % finely spaced points between 0 and 1.

 k = [1:N]';
 f = 100*h^2*k;
 a0 = zeros(N,1);

 ak = a0;
 L = chol(M)';
 for k=0:tfinal/dt-1
    t = k*dt; 
    if k>0
       ft = (t+dt)*f;
       ak = (M+dt*K)\(M*ak+dt*ft);
    end
    uN = zeros(size(xx));
    for j=1:N
      uN = uN + ak(j)*hat(xx,j,N);
    end
    figure(1), clf 
    plot(xx,uN,'b-','linewidth',2)
    axis([0 1 -1.25 7])
    set(gca,'fontsize',18)
    xlabel('x')
    ylabel('u_N(x,t)')
    title(sprintf('time = %f', t+dt))
    drawnow
%    pause
 end
