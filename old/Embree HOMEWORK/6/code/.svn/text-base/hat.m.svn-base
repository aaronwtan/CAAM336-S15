 function phi_k = hat(x,k,N)

 h = 1/(N+1);
 xk = [0:N+1]*h;

 phi_k =  ((x>=xk(k))&(x<xk(k+1))).*((x-xk(k))/h) ...
        + ((x>=xk(k+1))&(x<xk(k+2))).*((xk(k+2)-x)/h);
 
