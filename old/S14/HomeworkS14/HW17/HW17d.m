clear
clc
figure(1)
clf
x=linspace(-1,1,1000);
f=cos(pi*x);
f1=x-x;
f2=f1+0;
f3=f2-15*(3*x.^2-1)/(2*pi^2);
plot(x,f,'-k')
hold on
plot(x,f1,'-r')
plot(x,f2,'-b')
plot(x,f3,'-g')
xlabel('x')
legend('f(x)','f_1(x)','f_2(x)','f_3(x)','location','best')
saveas(figure(1),'hw17d.eps','epsc')