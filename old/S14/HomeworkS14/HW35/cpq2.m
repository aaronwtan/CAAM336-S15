function psi_j=cpq2(x,j,N)

h=1/(N+1);
xj=j*h;
xjm1=xj-h;
fohs=4/h^2;

psi_j=((x>=xjm1)&(x<xj)).*(x-xjm1).*(xj-x)*fohs;