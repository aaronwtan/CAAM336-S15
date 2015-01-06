x = linspace(0,1,50);
y = linspace(0,1,50);
[X,Y] = meshgrid(x,y);
psi11 = 2*sin(pi*X).*sin(pi*Y);
surf(X,Y,psi11)