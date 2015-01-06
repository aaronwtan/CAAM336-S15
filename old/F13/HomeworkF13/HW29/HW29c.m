clear
clc
N=3;
x=linspace(0,1,10000);

figure(1)
clf
colors='rgbcmyk';
for k=1:3
    plot(x,cpq1(x,k,N),colors(k))
    hold on
end
for k=1:4
    plot(x,cpq2(x,k,N),colors(k+3))
end

legend('\phi_1(x)','\phi_2(x)','\phi_3(x)','\psi_1(x)','\psi_2(x)','\psi_3(x)',...
    '\psi_4(x)','Location','EastOutside')
xlabel('x');
saveas(figure(1),'hw29c.eps','psc2')