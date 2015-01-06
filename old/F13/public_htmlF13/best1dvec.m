% Demonstration of projection onto a 1-dimensional subspace of R^2

 w1 = [2;1];                % approximating space W = span{w_1}
 
 f = [1;1.2];               % the vector we want to approximate

 c = (w1'*f)/(w1'*w1);      % c = (w1,f)/(w1,w1)
 w = c*w1;                  % best approximation to f from W



 figure(1), clf
 plot([0 w1(1)],[0 w1(2)],'k-','linewidth',2)
 hold on
 plot(w1(1),w1(2),'k.','markersize',30)

 plot(f(1),f(2),'r.','markersize',30)

 axis equal, axis([0 2.5 0 2.5]);
 input('hit return to display best approximation ')

 plot(w(1),w(2),'b.','markersize',30)

 input('hit return to display error')
 plot([w(1) f(1)],[w(2) f(2)],'r-','linewidth',2)

  fprintf('\n (f-w, w_1) = %12.8e\n\n', (f-w)'*w1)
 
