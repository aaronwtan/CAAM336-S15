clear
clc
p=10000;
x=linspace(0,1,p);
colors='rgbk';
N=[4 16 64 256];
figure(1)
clf
for i=1:size(N,2);
    fn=zeros(1,p);
    for n=1:2:N(i)
        fn=fn+4/(n*pi)*sin(n*pi*x);
    end
    plot(x,fn,colors(i));
    hold on
    legendStr{i}=['$N=' num2str(N(i)) '$'];
end
xlabel('$x$','interpreter','latex','fontsize',16);
ylabel('$f_N(x)$','interpreter','latex','fontsize',16);
title('Approximations $f_N(x)$ to $f(x)=1$','interpreter','latex','fontsize',16);
legend(legendStr,'interpreter','latex','Location','best');
saveas(figure(1),'hw1d.eps','epsc')