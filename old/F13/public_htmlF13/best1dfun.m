% Demonstration of projection onto a 1-dimensional subspace of C[0,1]

 w1_fun = @(x) sin(pi*x);                             % approximating space W = span{w_1}
% f_fun  = @(x) exp(x);                                % the function we want to approximate
 f_fun = @(x) (4*x.*(1-x)+.1*sin(20*pi*x));           % the function we want to approximate

 c =  quad(@(x) w1_fun(x).*f_fun(x),0,1,1e-12) ...
        /quad(@(x) w1_fun(x).*w1_fun(x),0,1,1e-12);   % c = (w1,f)/(w1,w1)

 figure(1), clf
 xx = linspace(0,1,1000);
 plot(xx,w1_fun(xx),'k-','linewidth',2)
 hold on

 plot(xx, f_fun(xx),'r-','linewidth',2)
 set(gca,'fontsize',16)
 legend('w_1','f',2)

 input('hit return to display best approximation ')

 plot(xx,c*w1_fun(xx),'b-','linewidth',2)
 legend('w_1(x)','f(x)','w(x)',2)

 fprintf('\n (f-w, w_1) = %12.8e\n\n', ...
      quad(@(x) (c*w1_fun(x)-f_fun(x)).*w1_fun(x), 0,1,1e-12))
   
