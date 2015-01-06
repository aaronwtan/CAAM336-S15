clear
clc

figure(1)
clf
x=linspace(0,1,1000).';
u=-x.^4+4*x.^3-2*x.^2-1;
plot(x, u, '-k')
hold on

Nvec=2.^(1:15)-1;
energyerr=zeros(size(Nvec));
energyerrhD=zeros(size(Nvec));
for j=1:length(Nvec)               
    N=Nvec(j);
    h=1/(N+1);
    
    K=sparse(N+1,N+1);
    K=K+sparse(1:N,2:N+1,-1/h,N+1,N+1);
    K=K+K.';
    K=K+sparse(1,1,1/h,N+1,N+1);
    K=K+sparse(2:N+1,2:N+1,2/h,N+1,N+1);
    
    KhD=K(2:N+1,2:N+1);
    
    f=zeros(N+1,1);
    f(1)=h*(h^2-4*h+2);
    f(2:N+1)=2*h*(h^2+6*((1:N)*h).^2-12*((1:N)*h)+2);
    
    fhD=f(2:N+1);
    
    c=K\f;
    
    chD=KhD\fhD;

    energyerr(j)=sqrt(296/105-(c.')*K*c);
    energyerrhD(j)=sqrt(296/105-(chD.')*KhD*chD);
    
    if N==3
       uN = zeros(size(x));
       for k=1:N+1
           uN = uN + c(k)*hat(x,k-1,N);
       end
       plot(x, uN, '-b')
       uNhD = zeros(size(x));
       for k=1:N
           uNhD = uNhD + chD(k)*hat(x,k,N);
       end
       plot(x, uNhD, '-r')
    end
    if N==7
        uN = zeros(size(x));
        for k=1:N+1
            uN = uN + c(k)*hat(x,k-1,N);
        end
        plot(x, uN, '-g')
        uNhD = zeros(size(x));
        for k=1:N
            uNhD = uNhD + chD(k)*hat(x,k,N);
        end
        plot(x, uNhD, '-m')
    end
end

title('$u$, $u_3$, $u_3^*$, $u_7$ and $u_7^*$ with $\alpha=\beta=0$','interpreter','latex','FontSize',12)
xlabel('$x$','interpreter','latex','FontSize',12)
legendstr{1}='$u(x)$';
legendstr{2}='$u_3(x)$';
legendstr{3}='$u_3^*(x)$';
legendstr{4}='$u_7(x)$';
legendstr{5}='$u_7^*(x)$';
legend(legendstr,'interpreter','latex','FontSize',12,'location','best')
saveas(figure(1),'hw36a.eps','epsc')

figure(2)
clf
loglog(Nvec,energyerr,'-ok')
hold on
loglog(Nvec,energyerrhD,'-ob')
title('$|||u-u_N|||$ and $|||u-u_N^*|||$ with $\alpha=\beta=0$','interpreter','latex','FontSize',12)
xlabel('$N$','interpreter','latex','FontSize',12)
legendstr2{1}='$|||u-u_N|||$';
legendstr2{2}='$|||u-u_N^*|||$';
legend(legendstr2,'interpreter','latex','FontSize',12,'location','best')
saveas(figure(2),'hw36b.eps','epsc')