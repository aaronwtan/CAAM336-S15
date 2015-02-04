% make some points with a = 1, b = 2

a = 1; b = 2;
x = [0; .1; .3; .5; .7; .9];
y = a*x + b + .1*randn(6,1);

plot(x,y,'.')

% basis = {x,e} = {v1, v2}
v1 = x; 
v2 = ones(6,1);

% make Gram matrix G_ij = (v_j, v_i) and vector f_i = (v_i, y)
G(1,1) = v1'*v1;
G(2,1) = v2'*v1;
G(1,2) = v1'*v2;
G(2,2) = v2'*v2;

f = zeros(2,1);
f(1) = v1'*y;
f(2) = v2'*y;

% solve for slope + intercept
ab = G\f;
a = ab(1); b = ab(2);

% xp = x for plotting
xp = linspace(0,1,25);
hold on;plot(xp,a*xp + b,'r--')