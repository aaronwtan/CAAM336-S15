
 N = 64;
 h = 1/(N+1);

 A = 6*eye(N)-4*diag(ones(N-1,1),1)+diag(ones(N-2,1),2) ...
             -4*diag(ones(N-1,1),-1)+diag(ones(N-2,1),-2);

 ew = eig(A/h^4);
