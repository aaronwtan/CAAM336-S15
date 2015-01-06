
 N = 40;
 x = linspace(0,1,N); y = linspace(0,1,N);
 [X,Y] = meshgrid(x,y);
 nmax = 10;

 t = 0:.05:4;
 for m=1:length(t)
    figure(1), clf
    U = zeros(N,N);
    for j=1:nmax
       for k=1:nmax 
          lamjk = (j^2+k^2)*(pi^2);
          phijk = sin(j*pi*X).*sin(k*pi*Y);
% **** replace the next line with the correct formula ****
          U = .01*t(m)*phijk;
       end
    end
    surf(X,Y,U)
    axis([0 1 0 1 -.035 .035]), caxis([-.035 .035])
    set(gca,'fontsize',14)
    xlabel('x'), ylabel('y'), zlabel('u(x,y,t)')
    title(sprintf('t = %10.5f\n', t(m)))
    view(-20, 30)
    pause(0.1)
 end
