% demo of the finite element method for the problem
%   -d/dx((1+x^2) du/dx)  = x, 0 < x < 1, u(0) = u(1) = 0.

Nvec = [4 8 16 32];   % vector of N values we shall use

color ='rgbk';

% each pass of the following loop handles a new N value...
for j=1:length(Nvec)
    N = Nvec(j);
    h = 1/(N+1);
    x = [1:N]*h;
    
    % construct the stiffness matrix (integrals done by hand)
    maindiag = 2/h + 2*h/3 + 2*h*([1:N].^2);
    offdiag  = -1/h - h*(([1:N-1].^2) + [1:N-1] + 1/3);
    K = diag(maindiag) + diag(offdiag,1) + diag(offdiag,-1);
    
    % construct the load vector (integrals done by hand)
    f = h^2*[1:N]';
    f(1)=f(1) + 1/h + (h/3);
    f(N)=f(N) + 2*h/3 + 4/h - 2;

    % solve for expansion coefficients of Galerkin approximation
    c = K\f;
    
    % plot the true solution
    xx = linspace(0,1,1000)';     % finely spaced points between 0 and 1.                
    
    % plot the approximation solution
    uN = zeros(size(xx));
    for k=1:N
        uN = uN + c(k)*hat(xx,k,N);
    end
    uN = uN + (xx < h).*(h-xx)/h;
    uN = uN + 2*(xx > (1-h)).*(xx-(1-h))/h;
    
    figure(1);hold on
    plot(xx, uN, color(j),'linewidth',2)
    set(gca,'fontsize',16)
    xlabel('x')
    axis([0 1 1 2])
    
    % ================================================================== 
    
    % use now g(x) = 1+x, recompute f and add a(g,\phi_i) terms
    f = h^2*[1:N]'; 
    f = f + 2*[1:N]'*h^2;
    
    % solve for expansion coefficients of Galerkin approximation
    c = K\f;

    % plot the approximation solution
    uN = zeros(size(xx));
    for k=1:N
        uN = uN + c(k)*hat(xx,k,N);
    end
    g = @(x) 1+x;
    uN = uN + g(xx);
    
    figure(2);hold on
    plot(xx, uN, color(j),'linewidth',2)
    set(gca,'fontsize',16)
    xlabel('x')
    tag{j} = sprintf('N = %d', N);    
    axis([0 1 1 2])
end
figure(1)
legend(tag)
title('g(x) = \phi_0(x) + 2\phi_{N+1}(x)')
print('-dpng',gcf,'p1a')
figure(2)
title('g(x) = 1 + x')
legend(tag)
print('-dpng',gcf,'p1c')
