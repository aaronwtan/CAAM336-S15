clear
clc
npts = 50;
x = linspace(0,1,npts);
y = linspace(0,1,npts);
[X,Y] = meshgrid(x,y);
for n=1:10
    figure(1)
    clf
    U = zeros(npts,npts);
    for j=1:n
        for k=1:n
            U = U + 4*(-1)^(j+1)/(j*k*pi^2)*sin(j*pi*X).*sin(k*pi*Y)/(j^2+k^2)/(pi^2);
        end
    end
    surf(X,Y,U), drawnow
    set(gca,'fontsize',16)
    xlabel('x')
    ylabel('y')
    zlabel(['u_{' num2str(n) '}(x,y)'])
    if ismember(n,[1 2 3 10]), 
        eval(sprintf('print -depsc2 twoD%d', n))
    end
    pause
end