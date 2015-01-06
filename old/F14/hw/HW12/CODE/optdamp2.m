
 t = 1.5;
 dvec = [2.5 3.2 20];
 xx = linspace(0,1,500)';

 ak0 = zeros(10,1);
 bk0 = zeros(10,1);
 k = [1:20]';
 bk0 = -6*sqrt(2)*(1+(-1).^k).*k./((k.^2-9).^2*pi^2);
 bk0(3) = sqrt(2)/4;


 figure(1), clf
 cvec = 'krb';
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
    ylim([-.002 .002])
    title(sprintf('time = %3.2f', t))
 end
 legend('d=2.5','d=3.2','d=20',2)
 print -depsc2 optdamp2
