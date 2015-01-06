clear
clc
colors='rgbcmy';
x = linspace(0,1,1000);

figure(3)
clf
uk = x/2-1/4;
for k=1:6
    uk = uk + 32*(2*(-1).^(k+1)-1)./(k.^5*pi^5)*sin(k*pi*x);
    plot(x,uk,colors(k))
    hold on
    legendStr{k}=['$\tilde{u}_{' num2str(k) '}(x)$'];
end
xlabel('x')
legend(legendStr,'interpreter','latex','location','best');
saveas(figure(3),'hw26g','epsc')