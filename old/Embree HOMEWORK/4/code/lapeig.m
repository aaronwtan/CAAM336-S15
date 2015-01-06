%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 5a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 N = 64;
 h = 1/(N+1);
 A = (1/h^2)*(2*eye(N)-diag(ones(N-1,1),1)-diag(ones(N-1,1),-1));
 
 eigvals    = sort(eig(A));
 trueigvals = ([1:N]').^2*pi^2;

 figure(1), clf
 semilogy([1:N], abs(eigvals-trueigvals), 'k.','markersize',10)
 hold on
 semilogy([1:N], abs(eigvals-trueigvals), 'k-','linewidth',1)
 set(gca,'fontsize',14)
 xlabel('index, k')
 ylabel('error in computed eigenvalues')
 title(sprintf('Error in computed eigenvalues, N=%d',N))
 print -deps2 lapeig_a.eps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 5b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 Nvec = [4 8 16 32 64 128 256 512];

 err = zeros(4, length(Nvec));      % matrix in which to store the errors
 trueigvals  = ([1:4]').^2*pi^2;    % exact values of first four eigenvalues

 for j=1:length(Nvec)
    N = Nvec(j);
    h = 1/(N+1);
    A = (1/h^2)*(2*eye(N)-diag(ones(N-1,1),1)-diag(ones(N-1,1),-1));
    eigvals = sort(eig(A));
    err(:,j) = abs(eigvals(1:4)-trueigvals);
 end


 figure(2), clf
 loglog(Nvec, err(1,:), 'b.-','markersize',20,'linewidth',2), hold on
 loglog(Nvec, err(2,:), 'r.-','markersize',20,'linewidth',2)
 loglog(Nvec, err(3,:), 'k.-','markersize',20,'linewidth',2)
 loglog(Nvec, err(4,:), 'g.-','markersize',20,'linewidth',2)
 legend('first eigenvalue', 'second eigenvalue', 'third eigenvalue',...
        'fourth eigenvalue',3)
 set(gca,'fontsize',14)
 xlabel('N')
 ylabel('error in eigenvalue approximations')
 title('Error in first four computed eigenvalues')
 print -depsc2 lapeig_b.eps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 5c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 N = 64;
 h = 1/(N+1);
 A = (1/h^2)*(2*eye(N)-diag(ones(N-1,1),1)-diag(ones(N-1,1),-1));
 
 [V,D] = eig(A);
 eigvals     = diag(D);
% The next two lines are precautions: MATLAB returns the eigenvalues
% in increasing order for this example.
 [eigvals,indx] = sort(eigvals);    % sort the eigenvalues in increasing order
 V = V(:,indx);                     % and shuffle the columns of V to match.
 
 x = [1:N]'*h; 
 xx = linspace(0,1,500);

 k = 1;
 for k=[1 2 3 4 8 16 32 64]
    vk = V(:,k); 
    vk = vk*sin(k*pi*x(1))/vk(1);   % scale the computed eigenvector 
    figure(2+k),clf 
    plot(xx, sin(k*pi*xx),'r-','linewidth',2), hold on
    plot(x, vk,'k.-','linewidth',2,'markersize',20)
    legend('true eigenfunction', 'approximation',...
            'location','southoutside','orientation','horizontal')
    set(gca,'fontsize',14)
    xlabel('x')
    ylabel('v(x)')
    title(sprintf('Approximation to eigenfunction for k=%d, N=%d',k,N))
    eval(sprintf('print -depsc2 lapeig_c%d', k))
 end

