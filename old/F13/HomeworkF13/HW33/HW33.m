clear
clc
figure(1)
clf
figure(2)
clf

markercolor='-or-og-ob-oc-om-ok-*r-*g-*b-*c-*m-*k';

mvec=2.^(0:1:11);
Nvec=2.^(0:1:13)-1;

for i=1:length(mvec)
    m=mvec(i);
    energyerr=zeros(size(Nvec));
    for j=1:length(Nvec)               
        N=Nvec(j);
        h=1/(N+1);
        
        % construct the stiffness matrix
        K=sparse(N,N);
        K=K+sparse(1:N-1,2:N,-1/h,N,N);
        K=K+K.';
        K=K+sparse(1:N,1:N,2/h,N,N);
        
        % construct the load vector
        f=(2*sqrt(2)/h)*(1-cos(h*m*pi))*sin((1:N).'*h*m*pi);
        
        % solve for the coefficients
        c=K\f;
        
        energyerr(j)=sqrt(m^2*pi^2-(c.')*K*c);
    end
    
    % plot the energy norm of the error
    figure(1)
    loglog(Nvec,energyerr,markercolor(3*i-2:3*i))
    hold on
    
    % plot the percentage error
    figure(2)
    loglog(Nvec,100*energyerr/(m*pi),markercolor(3*i-2:3*i))
    hold on
    
    legendStr{i}=['$m=' num2str(m) '$'];
end

  figure(1)
  axis([1 10^8 10^(-4) 10^4])
  axis square
  legend(legendStr,'interpreter','latex','FontSize',14,'Location','East')
  xlabel('$N$','interpreter','latex','FontSize',14)
  ylabel('$|||u_m-u_{m,N}|||$','interpreter','latex','FontSize',14)
  saveas(figure(1),'hw33b.eps','epsc')
  
  figure(2)
  axis square
  legend(legendStr,'interpreter','latex','FontSize',14,'Location','Southwest')
  xlabel('$N$','interpreter','latex','FontSize',14)
  ylabel('$|||u_m-u_{m,N}|||/|||u_m|||$','interpreter','latex','FontSize',14)
  saveas(figure(2),'hw33c.eps','epsc')