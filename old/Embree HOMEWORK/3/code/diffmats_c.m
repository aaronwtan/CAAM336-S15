
 Nvec = [4 8 16 32 64 128];
 Nvec = [8 32 128 512];
 u0 = 1;
 u1prime = -5;
 figure(1), clf
 for j=1:length(Nvec)
    N = Nvec(j);
    h = 1/(N+1);
    x = h*[1:N]'; 
    A = (-2*eye(N+1)+diag(ones(N,1),1)+diag(ones(N,1),-1))/(h^2);
    A(N+1,N-1:N+1) = [0 -1 1]/h^2;
    A(N+1,N-1:N+1) = [1 -4 3]/(2*h^2);
    f = 25*pi^2*cos(5*pi*x);
    f(1) = f(1) - u0/(h^2);
    f = [f;u1prime/h];
    u = A\f;
% plot the function, adding in the inhomogeneous value at the left boundary;
% this tacks extra entries on to the x and u vectors:
    subplot(2,2,j)
    plot([0;x;1],[u0;u],'k-','linewidth',2), hold on
%    axis([0 1 0 3.5])
    axis([0 1 -4 3])
    xlabel('x')
    ylabel('u(x)')
%    set(gca,'ytick',[0:1:3])
    text(.05,-3.5,sprintf('N = %d',N))
 end

 print -depsc2 diffmats_c
