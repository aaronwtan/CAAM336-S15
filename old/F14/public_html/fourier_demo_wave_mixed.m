% Fourier demo of a plucked string (mixed boundary conditions)

x = linspace(0,1,500);
N = 8;
psi = @(x) (x < 1/4).*(4*x) + (x>=1/4);
plot(x,psi(x))
title('Initial condition')
axis([0 1 -2 2])
pause

for t = 0:.05:10
    u = 0;
    for j = 1:N
        sqrtlambdaj = (2*j-1)/2*pi;
        aj = (2^(1/2)*(16*sin((pi*(j - 1/2))/4) + 2*pi*cos(pi*(j - 1/2)) - 4*pi*j*cos(pi*(j - 1/2))))/(pi^2*(2*j - 1)^2); % nonsmooth psi
        u = u + cos(sqrtlambdaj*t)*aj*sqrt(2)*sin(sqrtlambdaj*x);
    end
    hold on;plot(x,u,'r-');        
    axis([0 1 -2 2])
    pause
    title('Solution u(x,t)')
    drawnow
end
