
 N = 4;
 h = 1/(N+1);
 x = [0:N+1]*h;

 figure(1), clf
 divax
 xx = linspace(0,1,500)';
 plot(xx,evalhat(xx,3,N), 'k-','linewidth',4);
 set(gca,'xtick',[0:.2:1],'ytick',[0 .5 1],'xticklabel','|||||')
 axis([0 1 -.01 1.2])
 set(gca,'fontsize',16)
 print -depsc2 hats.eps

 N = 9;
 h = 1/(N+1);
 x = [0:N+1]*h;

 A = 2*h/3*eye(N) + h/6*diag(ones(N-1,1),1) + h/6*diag(ones(N-1,1),-1);  
 b = 2/(h*pi^2)*(1-cos(h*pi))*sin(h*pi*[1:N]');
 
 c = A\b;
 
 S = zeros(length(xx),1);
 for j=1:N
    S = S + c(j)*evalhat(xx,j,N);
 end
 figure(2), clf
 plot(xx, sin(pi*xx), 'b-','linewidth',2), hold on
 plot(xx, S, 'r-','linewidth',2)

 figure(3), clf
 plot(xx, sin(pi*xx)-S, 'b-','linewidth',2)
