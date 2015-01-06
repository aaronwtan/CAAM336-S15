% Demonstration of projection onto an m-dimensional subspace of C[-1,1]
% Basis functions: w_j = x^(j-1).

 f_fun  = @(x) (exp(x) + .1*sin(20*pi*x));                    % the function we want to approximate

 m = 3;                                                       % code becomes inaccurate as m increases
 G = zeros(m);
 b = zeros(m,1);

 for j=1:m, for k=1:m
    G(j,k) = quad(@(x) (x.^(j-1)).*(x.^(k-1)),-1,1,1e-12);    % G(j,k) = (w_j, w_k)
 end, end

 for j=1:m
    b(j)    = quad(@(x) (x.^(j-1)).*f_fun(x),-1,1,1e-12);         % b(j) = (w_j, f)    
 end

 c = G\b;

 figure(1), clf
 xx = linspace(-1,1,1000);
 for j=1:m
    plot(xx, xx.^(j-1),'k-','linewidth',2); hold on
    axis([-1 1 -1.25 1.25])
    pause
 end

 figure(2), clf
 plot(xx, f_fun(xx),'r-','linewidth',2)
 hold on
 set(gca,'fontsize',16)
 legend('f(x)',2)

 input('hit return to display best approximation ')

% construct the best approximation
 
 w = zeros(size(xx));
 for j=1:m
    w = w+c(j)*xx.^(j-1);
 end

 plot(xx,w,'b-','linewidth',2)
 legend('f(x)','w(x)',2)

