clear
clc
figure(1)
clf
x=linspace(-1,1,1000);
f=exp(x);
f1=(exp(1)-exp(-1))/2+x-x;
f2=f1+3*exp(-1)*x;
f3=f2+5*(exp(1)-7*exp(-1))*(3*x.^2-1)/4;
plot(x,f,'-k')
hold on
plot(x,f1,'-r')
plot(x,f2,'-b')
plot(x,f3,'-g')
xlabel('x')
legend('f(x)','f_1(x)','f_2(x)','f_3(x)','location','best')
saveas(figure(1),'hw16d.eps','epsc')