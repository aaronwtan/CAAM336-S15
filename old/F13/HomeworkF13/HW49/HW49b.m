clear
clc

x=linspace(0,1,100000);

figure(1)
clf
plot(x,initial(x),'-k')
hold on
plot(x,initialinterpolant(x,3),'-r')
plot(x,initialinterpolant(x,4),'-g')
plot(x,initialinterpolant(x,5),'-b')
plot(x,initialinterpolant(x,6),'-c')
set(gca,'XTick',[0 0.25 0.5 0.75 1])
xlabel('$x$','interpreter','latex','FontSize',12)
legendstr{1}='$u_0(x)$';
legendstr{2}='$u_{0,3}\,(x)$';
legendstr{3}='$u_{0,4}\,(x)$';
legendstr{4}='$u_{0,5}\,(x)$';
legendstr{5}='$u_{0,6}\,(x)$';
legend(legendstr,'interpreter','latex','FontSize',12,'location','best')
saveas(figure(1),'hw49b1.eps','epsc')

figure(2)
clf
plot(x,initial(x),'-k')
hold on
plot(x,initialinterpolant(x,47),'-r')
plot(x,initialinterpolant(x,48),'-g')
plot(x,initialinterpolant(x,49),'-b')
plot(x,initialinterpolant(x,50),'-c')
set(gca,'XTick',[0 0.25 0.5 0.75 1])
xlabel('$x$','interpreter','latex','FontSize',12)
legendstr{1}='$u_0(x)$';
legendstr{2}='$u_{0,47}\,(x)$';
legendstr{3}='$u_{0,48}\,(x)$';
legendstr{4}='$u_{0,49}\,(x)$';
legendstr{5}='$u_{0,50}\,(x)$';
legend(legendstr,'interpreter','latex','FontSize',12,'location','best')
saveas(figure(2),'hw49b2.eps','epsc')