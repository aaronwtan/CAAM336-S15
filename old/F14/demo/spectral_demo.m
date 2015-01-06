% demo: solving Ax = b using the spectral method

N = 128;
x = (0:N+1)/(N+1);
xN = x(2:end-1)'; % interior points
h = 1/(N+1);

A = 2*diag(ones(N,1)) - diag(ones(N-1,1),1) - diag(ones(N-1,1),-1);
A = (1/h^2)*A;

b = ones(N,1);
% b = ones(N,1) + xN - sin(2*pi*xN);

[V D] = eig(A);

u = zeros(N,1);
for i = 1:N
    v = V(:,i);
    lambda = D(i,i);
    u = u + ((v'*b)/lambda)*v;    
end

subplot(1,2,1)
plot(x,[0;A\b;0]);hold on
plot(x,[0;u;0],'r');
title(['Solution using ' num2str(i) ' eigenvectors.'])

subplot(1,2,2)
error = A\b-u;
plot(x,[0;error;0],'k'); hold on
axis([0 1 -.05 .05])
title(['Maximum error = ' num2str(max(error))])

