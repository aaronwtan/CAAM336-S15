<<<<<<< HEAD
 function phi_k = hat(x,k,n)

% function phi_k = hat(x,k,n)
%
% evaluates the hat function phi_k(x), where n denotes the
% size of the mesh, so that phi_k is non-zero on ((k-1)*h,(k+1)*h)
% with h = 1/(n+1). 

 h = 1/(n+1);
 xk = [0:n+1]*h;

 if k==0,       phi_k =  ((x>=xk(1))&(x<xk(2))).*((xk(2)-x)/h);
 elseif k==n+1, phi_k =  ((x>=xk(n+1))&(x<=xk(n+2))).*((x-xk(n+1))/h);
 else,          phi_k =  ((x>=xk(k))&(x<xk(k+1))).*((x-xk(k))/h) ...
                       + ((x>=xk(k+1))&(x<xk(k+2))).*((xk(k+2)-x)/h);
 end
=======
 function phi_k = hat(x,k,N)

 h = 1/(N+1);
 xk = [0:N+1]*h;

 phi_k =  ((x>=xk(k))&(x<xk(k+1))).*((x-xk(k))/h) ...
        + ((x>=xk(k+1))&(x<xk(k+2))).*((xk(k+2)-x)/h);
>>>>>>> 968ffb7097f899e6c73f1266fffb0d9442591e10
 
