function phi_j=cpq1(x,j,N)

h=1/(N+1);
xj=j*h;
xjm1=xj-h;
xjp1=xj+h;
hs=h^2;

phi_j=((x>=xjm1)&(x<xj)).*(x-xjm1).*(2*x-xjm1-xj)/hs+...
    ((x>=xj)&(x<xjp1)).*(xj+xjp1-2*x).*(xjp1-x)/hs;