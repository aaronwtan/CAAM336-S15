function phi_k = hat(x,k,N)
% function phi_k = hat(x,k,N)
%
% evaluates the hat function phi_k(x), where N denotes the
% size of the mesh, so that phi_k is non?zero on ((k?1)*h,(k+1)*h
% with h = 1/(N+1).
h = 1/(N+1);
xk = [0:N+1]*h;
if k==0
    phi_k = ((x>=xk(1))&(x<xk(2))).*((xk(2)-x)/h);
elseif k==N+1
    phi_k = ((x>=xk(N+1))&(x<=xk(N+2))).*((x-xk(N+1))/h);
else
    phi_k = ((x>=xk(k))&(x<xk(k+1))).*((x-xk(k))/h) ...
        + ((x>=xk(k+1))&(x<xk(k+2))).*((xk(k+2)-x)/h);
end