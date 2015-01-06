
% f(x) = x^2;

 N = 20;

 fstr = '(x.^2).*(1-x)';
 cn = zeros(N,1);
 Cn = zeros(N,1);
 figure(1), clf
 x = linspace(0,1,500)';
 f = inline(fstr);
 plot(x,f(x), 'k-','linewidth',2), hold on
 Sn = zeros(size(x));
 for k=1:N
    eval(sprintf('fsin = inline(''(%s)*sqrt(2).*sin(%d*pi*x)'');',fstr,k));
    cn(k) = quad(fsin,0,1,1e-10);
    Cn(k) = sqrt(2)*(-2+(2-k^2*pi^2)*(-1)^(k))/(k^3*pi^3);
    Sn = Sn + cn(k)*sqrt(2)*sin(k*pi*x);
    plot(x,Sn,'b-')
 end

 figure(2), clf
  semilogy([1:N], abs(cn),'k-','linewidth',2)
 
