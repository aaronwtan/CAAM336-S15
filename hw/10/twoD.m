 npts = 20;
 x = linspace(0,1,npts); y = linspace(0,1,npts);
 [X,Y] = meshgrid(x,y);
 for n=1:10
    figure(1), clf
    U = zeros(N,N);
    for j=1:n
       for k=1:n
          U = U + 4*(-1)^(j+1)/(j*k*pi^2)*sin(j*pi*X).*sin(k*pi*Y)/(j^2+k^2)/(pi^2);
       end
    end
    surf(X,Y,U), drawnow
    set(gca,'fontsize',16)
    xlabel('x')
    ylabel('y')
    zlabel('u(x,y)')
    title(sprintf(' Partial Fourier Series, N = %d', n))
    if ismember(n,[1 2 3 10]), 
       eval(sprintf('print -depsc2 twoD%d', n))
    end
    pause
 end
