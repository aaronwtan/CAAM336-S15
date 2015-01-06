clear
clc

alpha=-1;
beta=1;

figure(1)
clf
x=linspace(0,1,1000).';
u=-x.^4+4*x.^3-2*x.^2-alpha*x+alpha+beta-1;
plot(x, u, '-k')
hold on

colors='rgbm';
Nvec=2.^(2:5)-1;
for j=1:length(Nvec)               
    N=Nvec(j);
    h=1/(N+1);
    
    K=sparse(N+1,N+1);
    K=K+sparse(1:N,2:N+1,-1/h,N+1,N+1);
    K=K+K.';
    K=K+sparse(1,1,1/h,N+1,N+1);
    K=K+sparse(2:N+1,2:N+1,2/h,N+1,N+1);
    
    f=zeros(N+1,1);
    f(1)=h*(h^2-4*h+2)+alpha;
    f(2:N+1)=2*h*(h^2+6*((1:N)*h).^2-12*((1:N)*h)+2);
    f(N+1)=f(N+1)+beta/h;
    
    c=K\f;
    
    uN = zeros(size(x));
    for k=1:N+1
        uN = uN + c(k)*hat(x,k-1,N);
    end
    uN = uN + beta*hat(x,N+1,N);
    plot(x, uN, colors(j))
end

title('$u$, $u_3$, $u_7$, $u_{15}$ and $u_{31}$ with $\alpha=-1$ and $\beta=1$','interpreter','latex','FontSize',12)
xlabel('$x$','interpreter','latex','FontSize',12)
legendstr{1}='$u(x)$';
legendstr{2}='$u_3(x)$';
legendstr{3}='$u_7(x)$';
legendstr{4}='$u_{15}(x)$';
legendstr{5}='$u_{31}(x)$';
legend(legendstr,'interpreter','latex','FontSize',12,'location','best')
saveas(figure(1),'hw36c.eps','epsc')