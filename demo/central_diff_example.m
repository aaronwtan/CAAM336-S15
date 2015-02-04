clear
x = .1;
duh_exact = exp(x); % exact derivative of u at x = .5

hvec = .1:.1:6;
for i = 1:length(hvec)
    h = hvec(i);
    duh_f = (exp(x+h)-exp(x))/h;    
    duh_b = (exp(x)-exp(x-h))/h;    
    duh_c = (exp(x+h)-exp(x-h))/(2*h);    
    error1(i) = abs(duh_f-duh_exact);
    error2(i) = abs(duh_b-duh_exact);
    error3(i) = abs(duh_c-duh_exact);
end

plot(log(hvec),log(error1),'r.-');hold on
plot(log(hvec),log(error2),'b.-')
plot(log(hvec),log(error3),'k.-')
hold on;
plot(log(hvec),2*log(hvec),'--')
xlabel('log of h','fontsize',14)
set(gca,'fontsize',14)
legend('log of error','log of h^2')