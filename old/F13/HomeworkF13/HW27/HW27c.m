clear
clc
colors='rgbcmy';
x = linspace(0,1,1000);

figure(1)
clf
legendStr{1}=['$f(x)$'];
plot(x,(x.^2).*(1-x),'k-')
hold on
fk = zeros(size(x));
for k=1:6
    fk = fk + 2*(4*(-1).^(k+1)-2)./(k.^3*pi^3)*sin(k*pi*x);
    plot(x,fk,colors(k))
    legendStr{k+1}=['$f_{' num2str(k) '}(x)$'];
end
xlabel('x')
legend(legendStr,'interpreter','latex','location','best');
saveas(figure(1),'hw27c','epsc')