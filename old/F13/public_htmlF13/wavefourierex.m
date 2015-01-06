% solution of the homogeneous wave equation with countinuous initial data

 xx = linspace(0,1,100)';
 nmax = 50;

 t = [0:.05:8];
 U = zeros(length(t), length(xx));
 figure(1), clf
 fprintf('please press <return> to advance the time\n')
 for k=1:length(t)
    u = zeros(size(xx));
    for n=1:nmax
       b_n = sqrt(2)*50*sin(9*n*pi/10)/(9*n^2*pi^2);
       psi_n = sqrt(2)*sin(n*pi*xx);
       u = u + b_n*cos(n*pi*t(k))*psi_n;
    end
    plot(xx,u, 'b-','linewidth',2)
    U(k,:) = u;
    set(gca,'fontsize',14)
    title(sprintf('t = %f', t(k)))
    axis([0 1 -.6 .6])
    pause 
 end

 figure(2), clf
 surf(xx,t,U)
 set(gca,'fontsize',14)
 xlabel('x'), ylabel('t')
 title(sprintf('Solution of u_{tt} = u_{xx}'))
 pause

