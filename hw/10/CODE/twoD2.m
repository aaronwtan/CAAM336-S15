 npts = 40;
 x = linspace(0,1,npts); y = linspace(0,1,npts);
 [X,Y] = meshgrid(x,y);
 for n=1:15
    figure(1), clf
    U = zeros(npts,npts);
    for j=1:n
       for k=1:n
          cjk = (2*(-1+(-1)^j)*(-1+(-1)^k))/(j*k*pi^2);
          cjk = (-1)^j*((-1)^k-1)*(k^2*pi^2-8)/(2*j*k^3*pi^4);
          cjk = -(-1)^j*((-1)^k-1)*(3*k^2*pi^2-32)/(8*j*k^3*pi^4);
          cjk = (1+(-1)^j)*(1+(-1)^k)*(k^2*pi^2-24)/(8*j*k^3*pi^4); %  (x-1/2)^3 (y-1/2)
          lamjk = pi^2*(j^2+k^2);
          psijk = 2*sin(j*pi*X).*sin(k*pi*Y);
          U = U + (cjk/lamjk)*psijk;
       end
    end
    surf(X,Y,U), drawnow
    set(gca,'fontsize',16)
    xlabel('x')
    ylabel('y')
    zlabel('u(x,y)')
    title(sprintf(' Partial Fourier Series, N = %d', n))
    if ismember(n,[1 2 3 10]), 
       eval(sprintf('print -depsc2 twoD2%d', n))
    end
    pause
 end
