% heat equation spectral method demo: solves
% du/dt - d2u/dx2 = 0
% u(0,t) = u(1,t) = 0
% u(x,0) = psi(x), determined by choice of a(j)

x = linspace(0,1,500);
N = 150; % number of terms in the Fourier series
dt = .001;
for t = 0:dt:1
    u = 0;
    for j = 1:N
        aj = 2*sqrt(2)*cos(pi*(j/2 - 1/4))/(pi*(2*j - 1)); % corresponds to f(x) = 0 if x < .5, f(x) = 1 if x > .5
        u = u + exp(-(j*pi)^2*t)*aj*sqrt(2)*sin((2*j-1)/2*pi*x);
    end
    
    plot(x,u);
    xlabel('x');ylabel('u(x,t)')
    if abs(t)<1e-12 % set axes
        minu = min(u);maxu = max(u);
    end
    axis([0 1 minu maxu])
    title(sprintf('Time t = %e',t))
%     pause
    drawnow
end
