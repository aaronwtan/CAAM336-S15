syms x n;
phin=sin(n*pi*x);
a_n=simplify((int(phin,0,1)/int(phin^2,0,1)))