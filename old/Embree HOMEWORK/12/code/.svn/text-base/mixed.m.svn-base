% solution of the homogeneous wave equation with mixed boundary conditions

 xx = linspace(0,1,100)';
 nmax = 100;

 t = linspace(0,10,100);
 t = 0:.1:10;
 U = zeros(length(t), length(xx));
 figure(1), clf
 for k=1:length(t)
    u = zeros(size(xx));
    for n=1:nmax
       lam = (n-.5)^2*pi^2;
     %  d_n = sqrt(2)*4*((-1)^n)/(pi^2)*(pi/(4*n^2-4*n-3) - 1/(1-2*n)^2);
       d_n = sqrt(2)*((-1).^(n+1))*(1/lam+pi/(pi^2-lam));
       phi_n = sqrt(2)*sin(sqrt(lam)*xx);
       u = u + d_n/sqrt(lam)*sin(sqrt(lam)*t(k))*phi_n;
    end
    plot(xx,u, 'b-','linewidth',2)
    U(k,:) = u;
    set(gca,'fontsize',14)
    title(sprintf('t = %f', t(k)))
    axis([0 1 -1.5 1.5])
    drawnow
    if min(abs(t(k)-[0 .5 1 1.5 2])) < 1e-8,
         eval(sprintf('print -depsc2 mixed_%d',t(k)*2));
    end
 end

 figure(2), clf
 surf(xx,t,U)
 set(gca,'fontsize',14)
 xlabel('x'), ylabel('t')
 title(sprintf('Solution of u_{tt} = u_{xx}'))
 print -depsc2 mixed_3d

