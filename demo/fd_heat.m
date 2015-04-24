% simulating the heat equation using finite differences and the matrix
% exponential 

N = 64;
h = 1/(N+1);
x = [1:N]*h;
x = x(:); % make column vector

A = 2*diag(ones(N,1)) - diag(ones(N-1,1),1) - diag(ones(N-1,1),-1);
A = (1/h^2)*A;

u0 = exp(-100*(x-.5).^2);
plot([0; x; 1],[0; u0; 0],'.')
set(gca,'fontsize',14)
pause

for t = 0:.000025:2
    u = expm(-A*t)*u0;
    plot([0; x; 1],[0; u; 0],'.')
    axis([0 1 0 1])
    title(['time = ' num2str(t)],'fontsize',14)    
    drawnow
end