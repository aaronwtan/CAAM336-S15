clear
clc
colors='rgbcmy';
x = linspace(0,1,1000);

figure(1)
clf
legendStr{1}=['$f(x)$'];
plot(x,-(x-1/2)+(x-1/2).*sign(x-1/2),'k-')
hold on
fk = zeros(size(x));
for k=1:6
    fk = fk + 16*(1-cos(((2*k-1)/4)*pi))./((2*k-1).^2*pi^2)*cos(((2*k-1)/2)*pi*x);
    plot(x,fk,colors(k))
    legendStr{k+1}=['$f_{' num2str(k) '}(x)$'];
end
xlabel('x')
legend(legendStr,'interpreter','latex','location','best');
saveas(figure(1),'hw72c','epsc')