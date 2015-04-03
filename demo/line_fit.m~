% make some points with a = 1, b = 2

a = 1; b = 2;
x = [0; .1; .3; .5; .7; .9];
Npoints = length(x);
y = a*x + b + .2*randn(Npoints,1);

plot(x,y,'.','markersize',20)

%%
% basis = {x,e} = {v1, v2}
w1 = x; 
w2 = ones(Npoints,1);

% make Gram matrix G_ij = (v_j, v_i) and vector f_i = (v_i, y)
G(1,1) = w1'*w1;
G(2,1) = w2'*w1;
G(1,2) = w1'*w2;
G(2,2) = w2'*w2;

f = zeros(2,1);
f(1) = w1'*y;
f(2) = w2'*y;

% solve for slope + intercept
ab = G\f;
a = ab(1); b = ab(2);
%%
% xp = x for plotting
xp = linspace(0,1,25);
hold on;plot(xp,a*xp + b,'r--','linewidth',2)