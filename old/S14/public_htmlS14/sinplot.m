clear
clc
p=1000;
x=linspace(0,1,p);
colors='rgbk';
n=[1 2 4 8];
figure(1)
clf
for i=1:size(n,2);
    fn=sin(n(i)*pi*x);
    plot(x,fn,colors(i));
    hold on
    legendStr{i}=['$n=' num2str(n(i)) '$'];
end
xlabel('$x$','interpreter','latex','fontsize',16);
ylabel('$sin(n\pi x)$','interpreter','latex','fontsize',16);
title('$sin(n\pi x)$ for $n=1,2,4,8$','interpreter','latex','fontsize',16);
legend(legendStr,'interpreter','latex','Location','best');
saveas(figure(1),'sinfig.eps','epsc')