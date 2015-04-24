% heat equation spectral method demo: solves
% du/dt - d2u/dx2 = 0
% u(0,t) = u(1,t) = 0
% u(x,0) = psi(x), determined by choice of a(j)

x = linspace(0,1,500);
N = 25; % number of terms in the Fourier series
dt = .0001;
for t = 0:dt:1
    
    % compute spectral method summation of u(x) 
    u = 0;
    for j = 1:N
%         aj = sqrt(2)/(j*pi)^3 * (1 - (-1)^j);  % u(x,0) = x(1-x)
%         aj = 4*sqrt(2)*sin((pi*j)/2)/(pi^2*j^2); % hat function
        aj = sqrt(2)*(cos((pi*j)/4) - cos(3/4*j*pi))/(pi*j); % u(x,0) = heaviside function 1
        u = u + exp(-(j*pi)^2*t)*aj*sqrt(2)*sin(j*pi*x);        
    end
    
    plot(x,u);
    xlabel('x');ylabel('u(x,t)')
    if abs(t)<1e-12 % set axes
        minu = min(u); maxu = max(u);
    end
    axis([0 1 minu maxu])
    title(sprintf('Time t = %e',t))
    pause
%     drawnow
end
