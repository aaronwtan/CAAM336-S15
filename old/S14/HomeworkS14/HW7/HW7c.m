c = .897;
kappa = 2.37;
rho = 2.70;
l = 10;
theta = pi/l;
t = 0:4:20;
x = linspace(0,l,100);
figure(1), clf
for j=1:length(t)
    u = exp(-kappa*theta^2*t(j)/(rho*c))*sin(theta*x); % compute u(:,t(j))
    plot(x,u,'k-','linewidth',2), hold on
    text(4.75, max(u)-.03, sprintf('t = %d', t(j)))
end
axis([0 10 0 1.1])
set(gca,'fontsize',14)
xlabel('x')
ylabel('u(x,t)')
print -depsc2 checksol1