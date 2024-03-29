% fourier series demo - approximating functions with linear combinations of
% sines of different frequencies. 

% warning: demo may crap out for N > 25 due to the sines being very high
% frequency (hard to approximate with "quad")

N = 100; 
x = 0:.01:1;
f = @(x) x.*(1-x); % function to approximate by Fourier series - 0 boundary values
% f = @(x) 1-x; % function to approximate by Fourier series: nonzero boundary values
% f = @(x) ???; plug in your own function here and try.

val = zeros(size(x));
for n = 1:N
    % matlab function for approximating an integral, does poorly when n is
    % too large (> 20 ish).
    
    %cn = quad(@(x) sqrt(2)*sin(n*pi*x).*f(x),0,1,1e-12); 
    %cn = sqrt(2)/(pi*n);
    cn = 2*sqrt(2)*(1-(-1)^n)/(n*pi)^3;
    
    val = val + cn*sin(n*pi*x)*sqrt(2);  % sum up terms
    
    clf % clear figure
    subplot(1,2,1)    
    plot(x,val,'--');
    hold on;
    plot(x,f(x),'r-')
    legend('Fourier approximation', 'Exact f(x)')
    title(sprintf('Fourier series vs true f(x) with %i terms',n))    
    axis([0 1 -.1 1.1])
    
    subplot(1,2,2)
    plot(x,f(x)-val)
    title(sprintf('Error with %i terms',n))
    pause
end
