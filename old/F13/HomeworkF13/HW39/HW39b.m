clear
clc
col = 'rgbcmyk';
x = linspace(0,1,200);
tvec=[0 0.1 0.2 0.3 0.5 1 2];
figure(1)
clf
for j=1:length(tvec)
    U = zeros(size(x));
    t=tvec(j);
    U=U+t/2;
    for n=1:20
        U=U + 4*(2*cos(n*pi/2)-cos(n*pi)-1)*(1-exp(-n^2*pi^2*t))*cos(n*pi*x)/(n^4*pi^4);
    end
    legendStr{j}=['$t=' num2str(t) '$'];
    plot(x,U,col(j))
    hold on
end
legend(legendStr,'interpreter','latex','location','eastoutside')
xlabel('$x$','interpreter','latex')
ylabel('Approximations to $\tilde{u}(x,t)$','interpreter','latex')
saveas(figure(1),'hw39b.eps','epsc')