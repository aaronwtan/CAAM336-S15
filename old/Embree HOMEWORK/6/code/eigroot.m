 figure(1), clf
 
 for j=0:5
    x = linspace((j-1/2)*pi,(j+1/2)*pi,500);
    x = x(2:end-1); 
    tanplt = plot(x,-tan(x),'b-','linewidth',2);
    hold on
 end 
 x = linspace(0,5*pi,100);
 linplt = plot(x,x,'r-','linewidth',2);
 ylim([-5*pi 5*pi])
 xlim([0 5*pi])

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
 fprintf('   sqrt(lambda)          lambda     (n-1/2)^2 pi^2 \n', ew(k), ew(k)^2)
 for k=1:length(guess)
%     ew(k) = fzero(@(x) x+tan(x),guess(k));
     ew(k) = bisect(@(x) x+tan(x),bracket(k,1),bracket(k,2));
     plot(ew(k),ew(k),'k.','markersize',20)
     fprintf(' %15.10f   %15.10f  %15.10f\n', ew(k), ew(k)^2, (k-1/2)^2*pi^2)
 end
 print -depsc2 eigroot
