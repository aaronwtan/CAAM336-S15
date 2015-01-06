
 N = input('Enter N: '); fprintf('\n')
 h = 1/(N+1);

 M = (h/6)*(4*eye(N)+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1));
 K = (1/h)*(2*eye(N)-diag(ones(N-1,1),1)-diag(ones(N-1,1),-1));
 invMK = M\K;                         % invMK = inv(M)*K

 if N <= 8
    input('<hit return>') 
    fprintf('M = \n')
    disp(M)
 input('<hit return>') 
    fprintf('K = \n')
    disp(K)
 input('<hit return>') 
    fprintf('inv(M) = \n')
    disp(inv(M))
 input('<hit return>') 
    fprintf('inv(M)*K = \n')
    disp(invMK)
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Show sparsity patterns for M, K, inv(M), inv(M)*K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 figure(1), clf
 subplot(2,2,1)
   spy(M)
   set(gca,'fontsize',14)
   set(gca,'xtick',[1 floor(N/4)*[1 2 3 4]], 'ytick',[1 floor(N/4)*[1 2 3 4]])
   title('nonzero pattern of M')
 subplot(2,2,2)
   spy(K)
   set(gca,'fontsize',14)
   set(gca,'xtick',[1 floor(N/4)*[1 2 3 4]], 'ytick',[1 floor(N/4)*[1 2 3 4]])
   title('nonzero pattern of K')
 subplot(2,2,3)
   spy(inv(M))
   set(gca,'fontsize',14)
   set(gca,'xtick',[1 floor(N/4)*[1 2 3 4]], 'ytick',[1 floor(N/4)*[1 2 3 4]])
   title('nonzero pattern of M^{-1}')
 subplot(2,2,4)
   spy(inv(M)*K)
   set(gca,'fontsize',14)
   set(gca,'xtick',[1 floor(N/4)*[1 2 3 4]], 'ytick',[1 floor(N/4)*[1 2 3 4]])
   title('nonzero pattern of M^{-1}K')

 input('<hit return>') 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 [V,D] = eig(invMK);                  % compute the eigenvalues/eigenvectors
 [ew,indx] = sort(diag(D));           % sort the eigenvalues
 V = V(:,indx);                      % re-order the eigenvectors to match

 xx = linspace(0,1,500);
 h = 1/(N+1); 
 x = [1:N]'*h;

 for k=1:N
     figure(2), clf
     psik = sqrt(2)*sin(k*pi*x);
     plot(xx, sqrt(2)*sin(k*pi*xx),'-','color',[.3 .3 1])
     hold on
     [scl,indx] = max(abs(psik));
     scl = sign(psik(indx))*scl;
     plot(x, V(:,k)*scl/V(indx,k),'r.-','markersize',20)
     title(sprintf('eigenvalue of $M^{-1}K$: $\\lambda_{%d} = %7.3f\\pi^2$',...
        k, ew(k)/pi^2),'fontsize',18,'interpreter','latex')
     leg = legend('exact eigenfunction', 'eigenvector of $M^{-1}K$','location','southoutside','orientation','horizontal')
     set(leg,'interpreter','latex')
     pause
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 figure(3), clf
    ew = sort(eig(-invMK));
    plot([1:N], ew, 'k.','markersize',18)
    set(gca,'fontsize',16)
    xlabel('k')
    ylabel('\lambda_k')
    title('Eigenvalues of -M^{-1}K')

 fprintf('\n Minimim eigenvalue of -inv(M)*K: %10.7e\n', min(ew))
 fprintf(' Maximim eigenvalue of -inv(M)*K: %10.7e\n\n', max(ew));

 figure(4), clf
    ew = sort(eig(invMK));
    plot([1:N], [1:N].^2*pi^2, 'b.','markersize',18)
    hold on
    plot([1:N], ew, 'k.','markersize',18)
    set(gca,'fontsize',16)
    xlabel('k')
    ylabel('\lambda_k')
    title('Eigenvalues of M^{-1}K')
    leg = legend('exact eigenvalue', 'eigenvalue of $M^{-1}K$','location','southoutside','orientation','horizontal');
    set(leg,'interpreter','latex')

 fprintf('\n Minimim eigenvalue of inv(M)*K: %10.7e\n', min(ew))
 fprintf(' Maximim eigenvalue of inv(M)*K: %10.7e\n\n', max(ew));

