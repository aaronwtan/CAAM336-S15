% approximate f(x) = 1-x with sines

N = 20;
x = linspace(0,1,150);

% make best approximation 
fN = 0;
for j = 1:N
    beta_j = 2/(j*pi);
    fN = fN + sin(j*pi*x) * beta_j;
end

% plot best approximation
figure
plot(x,fN,'o-','linewidth',2);hold on

% plot true f 
f = (1-x);
plot(x,f,'r','linewidth',2);

% plot error
figure
plot(x,f - fN,'linewidth',2)