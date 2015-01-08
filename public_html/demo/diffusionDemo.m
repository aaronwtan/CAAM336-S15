% demo showing differing decay rates of each of the eigenvector
% components for a diffusion problem.

clear
close all

N = 64;
e = ones(N,1);
A = (N+1)^2*(2*diag(e) - diag(e(1:N-1),1) - diag(e(1:N-1),-1));
[V D] = eig(A);
x = linspace(0,1,N+2)';
x = x(2:N+1);
x0 = exp(-(x-.4).^2*1e2);
% x0 = double(x>.2 & x<.7); % heaviside function

ax = axis;
tvec = 0:.001:.025;
xp = [0; x; 1];

% show diffusive behavior
for t = tvec
    x0(1) = 0;x0(N) = 0;
    plot(xp,[0; expm(-t*A)*x0; 0]);
    axis(ax);
    title(['Time t = ', num2str(t)],'fontsize',16)
    
    pause
end

lam = diag(D);
inds = [1 2 3 4 6 8];

% draw different components
figure
plot(xp,[0;x0;0],'b.-')
hold on
plot(xp,[0;V(:,inds)*V(:,inds)'*x0;0],'r.-')
legend('Exact x_0','Truncated sum of P_i x_0')
% break

C = hsv(length(inds));
figure
for t = tvec
    clf
    hold on
    i = 1;
    for index = inds
        v = V(:,index);
        plot3(xp,index*ones(size(xp)),[0 ;exp(-t*lam(index))*v*v'*x0;0],'.-','color',C(i,:));
        axis([0 1 0 max(inds) -.5 .5])
        i = i+1;
    end
    %     view(3)
    view(0,0);
    title(['Time t = ', num2str(t)],'fontsize',16)
    pause
end

figure
hold on
names = {};
for i = 1:length(inds)
    plot(tvec,exp(-tvec*lam(inds(i))),'.-','color',C(i,:))
    names{i} = ['\lambda_' num2str(i)];
end
ylabel('e^{-t\lambda_i}','fontsize',16)
xlabel('Time t','fontsize',16)
legend(names)
