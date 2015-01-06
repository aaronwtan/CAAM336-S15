 Nvec = [8 16 32 64 128 256 512];

 
 for jj=1:length(Nvec);
    N = Nvec(jj);
    h = 1/(N+1);
    A = 2*eye(N)-diag(ones(N-1,1),-1)-diag(ones(N-1,1),1);
    A(1,1:2) = [2-4/(2*h+3) -1+1/(2*h+3)];
    A = A/(h^2);
    ew = sort(eig(A));
    fprintf(' %3d & %15.10f &  %15.10f   &  %15.10f &  %15.10f &  %15.10f \\\\ \n', ...
      N, ew(1), ew(2),ew(3),ew(4),ew(5));
end
