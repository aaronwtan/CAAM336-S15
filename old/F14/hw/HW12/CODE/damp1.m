 tvec = [.15 .30 .60 1.20 2.40];
 xx = linspace(0,1,500)';

 ak0 = zeros(10,1);
 bk0 = zeros(10,1);
 k = [1:20]';
 bk0 = -6*sqrt(2)*(1+(-1).^k).*k./((k.^2-9).^2*pi^2);
 bk0(3) = sqrt(2)/4;

 d = 1;

 col = 'kmcrb';
 figure(1), clf
 for m=1:length(tvec)
    t = tvec(m)
    u = zeros(size(xx));
    for k=1:length(bk0)
        psik = sqrt(2)*sin(k*pi*xx);
        dis = sqrt(d^2-k^2*pi^2);
        ak = bk0(k)*(exp((-d+dis)*t)-exp((-d-dis)*t))/(2*dis);
        u = u+ak*psik;
    end 
    plot(xx,u,'-','linewidth',2,'color',col(m)), hold on
    ylim([-.1 .1])
    pause
 end
 legend('t=0.15','t=0.30','t=0.60','t=1.20','t=2.40',2)
 set(gca,'fontsize',14)
 xlabel('x','fontsize',16)
 ylabel('u(x,t)','fontsize',16)
 print -depsc2 damp1.eps
