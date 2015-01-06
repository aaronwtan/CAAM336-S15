clear
clc

Nvec=2.^(1:1:7)-1;
energyerrhat=zeros(size(Nvec));
energyerr1=zeros(size(Nvec));
energyerr2=zeros(size(Nvec));
energyerr=zeros(size(Nvec));
for j=1:length(Nvec)               
    N=Nvec(j);
    h=1/(N+1);
    
    Khat=sparse(N,N);
    Khat=Khat+sparse(1:N-1,2:N,-1/h,N,N);
    Khat=Khat+Khat.';
    Khat=Khat+sparse(1:N,1:N,2/h,N,N);
    
    P=sparse(N,N);
    P=P+sparse(1:N-1,2:N,1/(3*h),N,N);
    P=P+P.';
    P=P+sparse(1:N,1:N,14/(3*h),N,N);
    
    Q=sparse(N,N+1);
    Q=Q+sparse(1:N,1:N,-8/(3*h),N,N+1);
    Q=Q+sparse(1:N,2:N+1,-8/(3*h),N,N+1);
    
    R=sparse(N+1,N+1);
    R=R+sparse(1:N+1,1:N+1,16/(3*h),N+1,N+1);
    
    K=[P Q; Q.' R];
    
    fhat=(-2*sqrt(35/17)*h*(h^2+6*((1:N)*h).^2-6*(1:N)*h)).';
    
    d=((2/5)*sqrt(35/17)*h*(h^2-10*((1:N)*h).^2+10*((1:N)*h))).';
    
    g=(-(4/5)*sqrt(35/17)*h*(3*h^2-10*h*((1:N+1)*h)+5*h+10*((1:N+1)*h).^2-10*((1:N+1)*h))).';
    
    f=[d; g];
    
    chat=Khat\fhat;
    c1=P\d;
    c2=R\g;
    c=K\f;
    
    energyerrhat(j)=sqrt(1-(chat.')*Khat*chat);
    energyerr1(j)=sqrt(1-(c1.')*P*c1);
    energyerr2(j)=sqrt(1-(c2.')*R*c2);
    energyerr(j)=sqrt(1-(c.')*K*c);
end

figure(1)
clf
loglog(Nvec,energyerrhat,'-ok')
hold on
loglog(Nvec,energyerr1,'-or')
loglog(Nvec,energyerr2,'-og')
loglog(Nvec,energyerr,'-ob')
legendstr{1}='$|||u-\hat{u}_N|||$';
legendstr{2}='$|||u-\tilde{u}_N|||$';
legendstr{3}='$|||u-u_N^*|||$';
legendstr{4}='$|||u-u_N|||$';
legend(legendstr,'interpreter','latex','FontSize',14,'Location','Southwest')
xlabel('$N$','interpreter','latex','FontSize',14)
saveas(figure(1),'hw35a.eps','epsc')

figure(2)
clf
loglog(Nvec,energyerrhat,'-ok')
hold on
loglog(2*Nvec+1,energyerr,'-ob')
legendstr2{1}='$|||u-\hat{u}_N|||$';
legendstr2{2}='$|||u-u_N|||$';
legend(legendstr2,'interpreter','latex','FontSize',14,'Location','Southwest')
xlabel('Dimension of $\hat{V}_N$ ($|||u-\hat{u}_N|||$) and $V_N$ ($|||u-u_N|||$)','interpreter','latex','FontSize',14)
saveas(figure(2),'hw35b.eps','epsc')

reductionhat=zeros(6,1);
reduction=zeros(6,1);
for j=1:length(Nvec)-1
    reductionhat(j)=energyerrhat(j)/energyerrhat(j+1);
    reduction(j)=energyerr(j)/energyerr(j+1);
end
display(reductionhat)
display(reduction)