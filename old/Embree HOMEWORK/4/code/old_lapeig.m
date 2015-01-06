 N = 128;

 h = 1/(N+1);
 
 A = (1/h^2)*(2*eye(N)-diag(ones(N-1,1),1)-diag(ones(N-1,1),-1));
 
 [V,D] = eig(A);

 ew = diag(D);
 true = ([1:N]').^2*pi^2;

 figure(5), clf
 semilogy(abs(ew-true),'k.') 

 x = [1:N]'/(N+1);
 xx = linspace(0,1,500);

 for k=1:4
    figure(k), clf
    plot(xx, sin(k*pi*xx)/sqrt(N/2),'k-')
    hold on
    plot(x, V(:,k) ,'k.','markersize',20)
 end
