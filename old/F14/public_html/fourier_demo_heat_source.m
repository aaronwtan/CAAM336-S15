% heat equation spectral method demo: solves
% du/dt - d2u/dx2 = 0
% u(0,t) = u(1,t) = 0
% u(x,0) = psi(x), determined by choice of a(j)

x = linspace(0,1,250);
N = 150; % number of terms in the Fourier series
dt = .001;
for t = 0:dt:10
    u = 0;
    for j = 1:N
        aj = sqrt(2)*(1-(-1)^j)/(j*pi)*(exp(-(j*pi)^2*t)-1)/(-(j*pi)^2);
        u = u + aj*sqrt(2)*sin(j*pi*x);
    end
    clf
    plot(x,u);hold on
    plot(x,.5*x.*(1-x),'r.-');
    xlabel('x');ylabel('u(x,t)')    
    axis([0 1 0 .15])
    title(sprintf('Time t = %e',t))
    pause
    drawnow
end
