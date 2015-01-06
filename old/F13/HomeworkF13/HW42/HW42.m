clear
clc
npts = 50;
x = linspace(0,1,npts);
y = linspace(0,1,npts);
[X,Y] = meshgrid(x,y);
tvec = [0 .005 .1 2];
for m=1:length(tvec)
    t = tvec(m);
    figure(1)
    clf
    U = zeros(npts,npts);
    n=15;
    for j=1:n
        for k=1:n
            cjk = (1+(-1)^j)*(1+(-1)^k)*(j^2*pi^2-24)/(8*j^3*k*pi^4); %  (x-1/2)^3 (y-1/2)
            lamjk = pi^2*(j^2+k^2);
            psijk = 2*sin(j*pi*X).*sin(k*pi*Y);
            U = U + (exp(-t)-exp(-lamjk*t))/(lamjk-1)*cjk*psijk;
        end
    end
    surf(X,Y,U)
    set(gca,'fontsize',16)
    xlabel('x')
    ylabel('y')
    zlabel('u_{15}(x,y,t)')
    title(sprintf(' t = %g', t))
    zlim([-.00016 .00016])
    eval(sprintf('print -depsc2 heat2d%d',m))
 end