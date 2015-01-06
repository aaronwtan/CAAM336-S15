% 2-dimensional wave equation 

 N = 40;
 x = linspace(0,1,N); y = linspace(0,1,N);
 [X,Y] = meshgrid(x,y);
 nmax = 10;

 tvec = 0:.05:4;
 for m=1:length(tvec)
    t = tvec(m)
    figure(1), clf
    U = zeros(N,N);
    for j=1:nmax
       for k=1:nmax 
          ajk = 100*(5+7*(-1)^j)*(5+7*(-1)^k)/(j^3*k^3*pi^6);
          lamjk = (j^2+k^2)*(pi^2);
          psijk = 2*sin(j*pi*X).*sin(k*pi*Y);
          U = U + ajk*cos(sqrt(lamjk)*t)*psijk;
       end
    end
    surf(X,Y,U)
    axis([0 1 0 1 -2 2]) %, caxis([-8 8])
    set(gca,'fontsize',14)
    xlabel('x'), ylabel('y'), zlabel('u(x,y,t)')
    title(sprintf('t = %10.5f\n', t))
    view(-20, 30)
    pause
 end
