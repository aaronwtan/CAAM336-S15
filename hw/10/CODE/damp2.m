 t = 2.5;
 dvec = [0 .5 1 3];
 xx = linspace(0,1,500)';

 ak0 = zeros(10,1);
 bk0 = zeros(10,1);
 k = [1:20]';
 bk0 = -6*sqrt(2)*(1+(-1).^k).*k./((k.^2-9).^2*pi^2);
 bk0(3) = sqrt(2)/4;

 figure(1), clf
 cvec = 'krbm';
 for m=1:length(dvec)
    d = dvec(m)
    u = zeros(size(xx));
    for k=1:length(bk0)
        psik = sqrt(2)*sin(k*pi*xx);
        dis = sqrt(d^2-k^2*pi^2);
        ak = bk0(k)*(exp((-d+dis)*t)-exp((-d-dis)*t))/(2*dis);
        u = u+ak*psik;
    end 
    plot(xx,u,'-','linewidth',2,'color',cvec(m)), hold on
    ylim([-.1 .1])
    title(sprintf('time = %3.2f', t))
 end
 legend('d=0','d.5','d=1','d=3',2)
 print -depsc2 damp2.eps
