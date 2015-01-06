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
    for n=1:20
        U=U + 8*sin(n*pi/2)*(1-exp(-n^2*pi^2*t))*sin(n*pi*x)/(n^4*pi^4);
    end
    legendStr{j}=['$t=' num2str(t) '$'];
    plot(x,U,col(j))
    hold on
end
legend(legendStr,'interpreter','latex','location','best')
xlabel('$x$','interpreter','latex')
ylabel('Approximations to $\tilde{u}(x,t)$','interpreter','latex')
saveas(figure(1),'hw38b.eps','epsc')