
 x = linspace(0,1,500);

 N = 180;

 figure(1), clf
 axes('position', [.125 .15 .75 .3])
 plot(x, hat(x,50,N),'k-','linewidth',3);
 set(gca,'fontsize',14)
 axis([0 1 -.01 1.25])
 set(gca,'xtick',[0:10]/10)
 set(gca,'ytick',[0 .5 1])
 set(gca,'xticklabel','0||||||||||1')
 box off
 print -depsc2 plothat
 
 

 
