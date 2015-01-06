clear
clc
colors='rgbcmy';
x = linspace(0,1,1000);

figure(2)
clf
uk = zeros(size(x));
for k=1:6
    uk = uk + 2*(4*(-1).^(k+1)-2)./(k.^5*pi^5)*sin(k*pi*x);
    plot(x,uk,colors(k))
    hold on
    legendStr{k}=['$u_{' num2str(k) '}(x)$'];
end
xlabel('x')
legend(legendStr,'interpreter','latex','location','best');
saveas(figure(2),'hw27d','epsc')