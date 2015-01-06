%% Code for plotting hat functions
N=9;
k=[0 4 5 6 10]; % hat function indices
colors='bgrcmyk';
x=linspace(0,1,1000);
figure; hold on;
ct=0; % initializing counter for loop
for j=k
    ct=ct+1;
    plot(x,hat(x,j,N),colors(ct));
    legendStr{ct}=['$\phi_{' num2str(j) '}(x)$'];
end
xlabel('$x$','interpreter','latex','fontsize',16);
ylabel('$\phi_k(x)$','interpreter','latex','fontsize',16);
title('Hat functions for various $k$','interpreter','latex','fontsize',16);
legend(legendStr,'interpreter','latex');