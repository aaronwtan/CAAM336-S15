clear
clc
colors='rgbcmy';
x = linspace(0,1,1000);

figure(3)
clf
uk = x;
for k=1:6
    uk = uk + 64*(1-cos(((2*k-1)/4)*pi))./((2*k-1).^4*pi^4)*cos(((2*k-1)/2)*pi*x);
    plot(x,uk,colors(k))
    hold on
    legendStr{k}=['$\tilde{u}_{' num2str(k) '}(x)$'];
end
xlabel('x')
legend(legendStr,'interpreter','latex','location','best');
saveas(figure(3),'hw72e','epsc')