% approximate solution to 
% 
% -u''(x) = 1
% u(0) = 0
% u(1) = 1
% 
% using the spectral method.

N = 15;
x = linspace(0,1,250);

% make best approximation 
fN = 0;
for j = 1:N
    beta_j = 4*sin(j*pi/2)^2/(pi*j);
    fN = fN + sin(j*pi*x) * beta_j;
end

% plot best approximation
figure
plot(x,fN,'-','linewidth',2);hold on

% plot true f 
f = ones(size(x));
plot(x,f,'r','linewidth',2);
set(gca,'fontsize',14)
title('f(x) = 1 and its approximation f_N','fontsize',14)

% plot error
figure
plot(x,f - fN,'linewidth',2)
set(gca,'fontsize',14)
title('Error between f and f_N','fontsize',14)

%% spectral method

vN = 0;
for j = 1:N
    beta_j = 4*sin(j*pi/2)^2/(pi*j);   
    lambda_j = (j*pi)^2;
    vN = vN + sin(j*pi*x) * beta_j/lambda_j;    
end

uN = vN + x;

figure
plot(x,uN,'linewidth',2)
% hold on
% plot(x,.5*x.*(2-x),'r--','linewidth',2)
% legend('Spectral','Exact')
set(gca,'fontsize',14)
title('u(x) = 1 and spectral method solution u_N','fontsize',14)

%% plot error

figure
plot(x,uN-.5*x.*(2-x),'r','linewidth',2)
title('Error u-u_N','fontsize',14)
set(gca,'fontsize',14)

title('Spectral method error','fontsize',14)
