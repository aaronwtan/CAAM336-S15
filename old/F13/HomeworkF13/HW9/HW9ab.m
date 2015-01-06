clear
clc
Nvec = [4 8 16 32 64 128];
err = zeros(size(Nvec));
colors='rgbcmk';
figure(1)
clf
suptitle('Approximations to u(x)')
figure(2)
clf
for j=1:length(Nvec)
    N = Nvec(j);
    h = 1/(N+1);
    x = h*(1:N).'; 
    A = (-2*eye(N)+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1))/(h^2);
    f = 25*pi^2*cos(5*pi*x);
    u = A\f;
    % plot the function, adding in the homogeneous values at the boundary;
    % this tacks on extra entries for the x and u vectors:
    figure(1)
    subplot(3,2,j)
    plot([0;x;1],[0;u;0],'k-','linewidth',2)
    hold on
    axis([0 1 -2.5 2.5])
    xlabel('x')
    text(.05,-2.05,sprintf('N = %d',N))
    figure(2)
    plot([0;x;1],[0;u;0],colors(j))
    hold on
    legendStr{j}=['N=' num2str(N)];
    % compute error
    true_u = 1-2*x-cos(5*pi*x);
    err(j) = max(abs(true_u - u));
end
figure(1)
print -depsc2 separate_a.eps
figure(2)
axis([0 1 -2 2])
xlabel('x')
title('Approximations to u(x)')
legend(legendStr,'Location','best');
print -depsc2 together_a.eps

% error plot
figure(3)
clf
loglog(Nvec, err, 'k.-','linewidth',1.5,'markersize',20)
hold on
loglog(Nvec, (Nvec+1).^(-2), 'k--', 'linewidth',1.5)
legend('Error', 'perfect h^2 convergence')
set(gca,'fontsize',14)
xlabel('N')
print -depsc2 error_b.eps