clear
clc
alpha=-1;
beta=1;
figure(1)
clf
x=linspace(0,1,1000);
u=-x.^4+4*x.^3-2*x.^2+alpha*x+beta-alpha-1;
plot(x, u, '-k')
xlabel('$x$','interpreter','latex','FontSize',12)
ylabel('$u(x)$ ($\alpha=-1$, $\beta=1$)','interpreter','latex','FontSize',12)
saveas(figure(1),'hw5c.eps','epsc')