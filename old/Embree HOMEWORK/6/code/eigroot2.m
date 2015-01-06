
 N = input('N? ')
 h = 1/(N+1);
 x = h*[1:N]';
 A = 2*eye(N)-diag(ones(N-1,1),-1)-diag(ones(N-1,1),1);

 A(1,1:2) = [2-4/(2*h+3) -1+1/(2*h+3)];
 A = A/(h^2);

 f = ones(N,1);

 u = A\f;
 uu = -x.^2/2 + x/4 + 1/4;

 u0 = ((4/3)*u(1)-(1/3)*u(2))/(1+h)
 u0 = (4*u(1)-u(2))/(2*h+3)
 uu0 = ((4/3)*uu(1)-(1/3)*uu(2))/(1+h)
 uu0 = (4*uu(1)-uu(2))/(2*h+3)

 figure(1), clf
 plot(x, uu, 'b-','linewidth',2)
 hold on
 plot(x, u, 'r-','linewidth',2)

% ew = sort(eig(A));
% 
% ew(1:5)/pi^2
%
% lam1 = ew(1);
% 
% sqrt(lam1)-tan(sqrt(lam1))
