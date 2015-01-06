
 N = input('N? ')
 h = 1/(N+1);
 x = h*[1:N]';
 A = 2*eye(N)-diag(ones(N-1,1),-1)-diag(ones(N-1,1),1);

 A(1,1:2) = [2-4/(2*h+3) -1+1/(2*h+3)];
 A = A/(h^2);

 f = x;

 u = A\f;

 figure(1), clf
 plot(x, u, 'r-','linewidth',2)

% ew = sort(eig(A));
% 
% ew(1:5)/pi^2
%
% lam1 = ew(1);
% 
% sqrt(lam1)-tan(sqrt(lam1))
