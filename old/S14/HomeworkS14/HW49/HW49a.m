clear
clc

x=linspace(0,1,100000);

figure(1)
clf
plot(x,initial(x),'-k')
set(gca,'XTick',[0 0.25 0.5 0.75 1])
xlabel('$x$','interpreter','latex','FontSize',12)
legendstr{1}='$u_0(x)$';
legend(legendstr,'interpreter','latex','FontSize',12,'location','best')
saveas(figure(1),'hw49a.eps','epsc')