% approximate f(x) = x(1-x) with sines

N = 3;
x = linspace(0,1,150);

% make best approximation 
fN = 0;
for j = 1:N
    beta_j = 4*(1+(-1)^(j+1))/(j^3*pi^3);
    fN = fN + sin(j*pi*x) * beta_j;
end

% plot best approximation
figure
plot(x,fN,'o-','linewidth',2);hold on

% plot true f 
f = x.*(1-x);
plot(x,f,'r','linewidth',2);

% plot error
figure
plot(x,f - fN,'linewidth',2)