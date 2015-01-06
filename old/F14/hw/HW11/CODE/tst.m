
 n = 1000;       % number of bins
 s = 10000;      % samples/bin
 h = 1/(s*n);    % spacing between samples

 bins = [0:1/n:1];
 P = zeros(n);
 for k=1:n
    x = [((k-1)/n + h/2) : h : (k/n - h/2)];   % samples
   % y = 2*x-floor(2*x);
    y = 2.1*x-floor(2.1*x);
    dat = histc(y, bins)/s;                    % see where the samples are mapped
    dat(end-1) = dat(end-1)+dat(end);   
    P(:,k) = dat(1:end-1);                     % fill in the entries of P
 end

 figure(1), clf, spy(P)
 [v,lam] = eigs(P,1);
 v = abs(v)/norm(v,1);
 v
 figure(2), clf, plot(1/(2*n):1/n:1-1/(2*n),n*v,'k.')

