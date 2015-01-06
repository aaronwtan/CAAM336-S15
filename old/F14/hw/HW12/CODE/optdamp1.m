 d = [0 pi/2 pi 3*pi/2];
 col = 'krbm'


 k = 1:10;
 figure(1), clf
 for j=1:length(d)
     ew = [-d(j)+sqrt(d(j)^2-k.^2*pi^2) -d(j)-sqrt(d(j)^2-k.^2*pi^2)];
     plot(real(ew),imag(ew),'.','markersize',20,'color',col(j)), hold on
 end
 axis([-10 1 -30 30]) 
 set(gca,'fontsize',14)
 xlabel('real \lambda','fontsize',16)
 ylabel('imag \lambda','fontsize',16)
 legend('d=0','d=\pi/2','d=\pi','d=3\pi/2',2)
 print -depsc2 optdamp1
