clear
clc
figure(1)
clf
for j=0:5
    x = linspace((j-1/2)*pi,(j+1/2)*pi,500);
    x = x(2:end-1); 
    tanplt = plot(x,-tan(x),'b-','linewidth',2);
    hold on
end 
x = linspace(0,5*pi,100);
linplt = plot(x,x,'r-','linewidth',2);
axis([0 5*pi -5*pi 5*pi])
xlabel('$x$','interpreter','latex','fontsize',14)

lgd = legend([tanplt,linplt],'$\ -\tan(x)$', '$x$',...
			 'location','northoutside','orientation','horizontal');
set(lgd,'interpreter','latex')
set(gca,'fontsize',14)

guess = [2 5 7.98 11 14.21]';
bracket = [1.6 2.5; 
4.8 5; 
7.9 8.1; 
11 11.2;
14.15 14.3];

ew = zeros(size(guess));
for k=1:length(guess)
    ew(k) = bisect(@(x) x+tan(x),bracket(k,1),bracket(k,2));
    plot(ew(k),ew(k),'k.','markersize',20)
end
print -depsc2 eigroot