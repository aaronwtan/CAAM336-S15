clear
dudx_exact = exp(.5); % exact derivative of u at x = .5

h = .1:.1:6;
for i = 1:length(h)
    dx = h(i);
    dudx_FD = (exp(.5+dx)-exp(.5-dx))/(2*dx);    
    error(i) = abs(dudx_FD-dudx_exact);
end

plot(log(h),log(error),'.-')
hold on;
plot(log(h),2*log(h),'r.-')
xlabel('log of h','fontsize',14)
set(gca,'fontsize',14)
legend('log of error','log of h^2')