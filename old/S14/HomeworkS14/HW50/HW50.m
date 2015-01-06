clear
clc

Nvec = [15 31];
DeltatvecFE=[1e-5 1e-4];
plotvalsFE=[100 1000 10000 20000];
plotvalsFE=[plotvalsFE; plotvalsFE/10];
DeltatvecBE=[1e-3];
plotvalsBE=[1 10 100 200];
colors='rgbc';
legendstr{1}='t=0';
figcount=1;

for j=1:length(Nvec)               
   N = Nvec(j);
   h = 1/(N+1);

   K=sparse(N+1,N+1);
   K=K+sparse(1:N,2:N+1,-1/h-(cos(pi*(1:N)*h)-cos(pi*(2:N+1)*h))/(pi*h^2),N+1,N+1);
   K=K+K.';
   K=K+sparse(1:N,1:N,2/h+(cos(pi*(0:N-1)*h)-cos(pi*(2:N+1)*h))/(pi*h^2),N+1,N+1);
   K=K+sparse(N+1,N+1,1/h+(cos(pi*N*h)-cos(pi*(N+1)*h))/(pi*h^2),N+1,N+1);

   M=sparse(N+1,N+1);
   M=M+sparse(1:N,2:N+1,h/6,N+1,N+1);
   M=M+M.';
   M=M+sparse(1:N,1:N,2*h/3,N+1,N+1);
   M=M+sparse(N+1,N+1,h/3,N+1,N+1);
   
   x=linspace(0,1,1000)';
   
   for jj=1:length(DeltatvecFE)
       Deltat=DeltatvecFE(jj);
       plotcount=1;
       alpha=initialinterpolant((1:N+1)*h,N).';
       figure(figcount)
       clf
       uN = zeros(size(x));
       for l=1:N+1
           uN=uN+alpha(l)*hat(x,l,N);
       end
       plot(x,uN,'k')
       hold on
       for k=1:max(plotvalsFE(jj,:))
           s=M\(-K*alpha);
           alpha=alpha+Deltat*s;
           if k==plotvalsFE(jj,plotcount);
               uN = zeros(size(x));
               for l=1:N+1
                   uN=uN+alpha(l)*hat(x,l,N);
               end
               plot(x, uN, colors(plotcount))
               plotcount=plotcount+1;
           end
       end
       for k=1:length(plotvalsFE(jj,:))
           legendstr{k+1}=['$t=$' num2str(plotvalsFE(jj,k)*Deltat)];
       end
       legend(legendstr,'interpreter','latex','location','best')
       xlabel('$x$','interpreter','latex')
       titlestr{1}='Approximations to $u_N(x,t)$ obtained using the forward Euler method';
       titlestr{2}=['with $N=$' num2str(N) ' and $\Delta t=$' num2str(Deltat,'%f')];
       title({titlestr{1};titlestr{2}},'interpreter','latex')
       figcount=figcount+1;
   end
   
   for jj=1:length(DeltatvecBE)
       Deltat=DeltatvecBE(jj);
       plotcount=1;
       alpha=initialinterpolant((1:N+1)*h,N).';
       figure(figcount)
       clf
       uN = zeros(size(x));
       for l=1:N+1
           uN=uN+alpha(l)*hat(x,l,N);
       end
       plot(x,uN,'k')
       hold on
       for k=1:max(plotvalsBE(jj,:))
           alpha=(M+Deltat*K)\(M*alpha);
           if k==plotvalsBE(jj,plotcount);
               uN = zeros(size(x));
               for l=1:N+1
                   uN=uN+alpha(l)*hat(x,l,N);
               end
               plot(x, uN, colors(plotcount))
               plotcount=plotcount+1;
           end
       end
       for k=1:length(plotvalsBE(jj,:))
           legendstr{k+1}=['$t=$' num2str(plotvalsBE(jj,k)*Deltat)];
       end
       legend(legendstr,'interpreter','latex','location','best')
       xlabel('$x$','interpreter','latex')
       titlestr{1}='Approximations to $u_N(x,t)$ obtained using the backward Euler method';
       titlestr{2}=['with $N=$' num2str(N) ' and $\Delta t=$' num2str(Deltat,'%f')];
       title({titlestr{1};titlestr{2}},'interpreter','latex')
       figcount=figcount+1;
   end
   
end
saveas(figure(1),'hw50c15.eps','epsc')
saveas(figure(2),'hw50d15.eps','epsc')
saveas(figure(3),'hw50f15.eps','epsc')
saveas(figure(4),'hw50c31.eps','epsc')
saveas(figure(5),'hw50d31.eps','epsc')
saveas(figure(6),'hw50f31.eps','epsc')