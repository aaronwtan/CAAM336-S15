function uN0=initialinterpolant(x,N)

h=1/(N+1);
xj=(1:N+1)*h;

u0xj=initial(xj);

uN0=zeros(size(x));
for j=1:N+1
    uN0=uN0+u0xj(j)*hat(x,j,N);
end