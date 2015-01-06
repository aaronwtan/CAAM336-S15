% Fourier demo of a plucked string (Dirichlet boundary conditions)
% c = 1

x = linspace(0,1,500);
N = 25;
for t = 0:.02:25
    u = 0;
    for j = 1:N
        aj = (4*2^(1/2)*(4*sin((pi*j)/4)))/(3*pi^2*j^2);
        u = u + cos(j*pi*t)*aj*sqrt(2)*sin(j*pi*x);
    end
    subplot(1,2,1)
    plot(x,u);
    axis([0 1 -1 1])
    title('Solution u(x,t)')
    
    subplot(1,2,2)        
    aj = 4*2^(1/2)*(4*sin((pi*(1:N)')/4))./(3*pi^2*(1:N)'.^2);
    coeffs = cos((1:N)'*pi*t).*aj*sqrt(2);
    uMat = diag(coeffs)*sin((1:N)'*pi*x);
    plot(x,uMat)
    axis([0 1 -.25 .25])    
    title('Fourier modes of solution')
    drawnow    
end
