
 Nvec = [4 8 16 32 64 128];
 u0 = 1;
 u1 = 2;
 figure(1), clf
 for j=1:length(Nvec)
    N = Nvec(j);
    h = 1/(N+1);
    x = h*[1:N]'; 
    A = (-2*eye(N)+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1))/(h^2);
    f = 25*pi^2*cos(5*pi*x);
    f(1) = f(1)-u0/(h^2);
    f(N) = f(N)-u1/(h^2);
    u = A\f;
% plot the function, adding in the inhomogeneous values at the boundary;
% this tacks on extra entries for the x and u vectors:
    subplot(3,2,j)
    plot([0;x;1],[u0;u;u1],'k-','linewidth',2), hold on
    axis([0 1 0 3.5])
    xlabel('x')
    ylabel('u(x)')
    set(gca,'ytick',[0:1:3])
    text(.05,.35,sprintf('N = %d',N))
 end
 print -depsc2 diffmats_b
