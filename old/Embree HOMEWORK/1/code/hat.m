 function phi_k = hat(x,k,N)
% evalute hat functions, including k=0 and k=N+1.

 h = 1/(N+1);
 xk = [0:N+1]*h;

 if k==0,       phi_k = ((x>=0)&(x<h)).*((h-x)/h);
 elseif k==N+1, phi_k = ((x>=1-h)&(x<1)).*((x-(1-h))/h);
 else,          phi_k =  ((x>=xk(k))&(x<xk(k+1))).*((x-xk(k))/h) ...
                       + ((x>=xk(k+1))&(x<xk(k+2))).*((xk(k+2)-x)/h);
 end
