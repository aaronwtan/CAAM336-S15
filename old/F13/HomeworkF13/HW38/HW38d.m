clear
clc
col = 'rgbcmyk';
x = linspace(0,1,200);
tvec=[0 0.1 0.2 0.3 0.5 1 2];
figure(1)
clf
for j=1:length(tvec)
    U = x;
    t=tvec(j);
    for n=1:20
        U=U + 4*(2*sin(n*pi/2)/(n*pi)+(3*cos(n*pi)-2*sin(n*pi/2)/(n*pi))*exp(-n^2*pi^2*t))*sin(n*pi*x)/(n^3*pi^3);
    end
    legendStr{j}=['$t=' num2str(t) '$'];
    plot(x,U,col(j))
    hold on
end
legend(legendStr,'interpreter','latex','location','best')
xlabel('$x$','interpreter','latex')
ylabel('Approximations to $u(x,t)$','interpreter','latex')
saveas(figure(1),'hw38d.eps','epsc')