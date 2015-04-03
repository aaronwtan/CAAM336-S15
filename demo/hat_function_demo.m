% hat demo

N = 128;
h = 1/(N+1);
x = [1:N]*h;

f = @(x) x.^2.*(1-x) + sin(2*pi*x);

c = f(x);


xx = linspace(0,1,500)';     % finely spaced points between 0 and 1.

plot(xx,f(xx),'-')
hold on;plot(x,c,'r.')


% plot the approximation solution
fN = zeros(size(xx));
for j=1:N
    fN = fN + c(j)*hat(xx,j,N);
end

plot(xx,fN,'r-')