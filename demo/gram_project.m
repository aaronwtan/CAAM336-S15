% define function to represent
f = exp(2*x);

% projection coefficients 
% G_ij = integral of (vj*vi) over [0,1]
G = [1 1/2 1/3;
    1/2 1/3 1/4;
    1/3 1/4 1/5];

% b_i = integral of (f*vi) over [0,1]
b = [.5*(exp(2)-1);
    .25*(exp(2)+1);
    .25*(exp(2)-1)];

% solve for alpha
alpha = G\b;

% plotting
x = linspace(-1,1,25);
plot(x,exp(2*x),'linewidth',2); hold on

% define basis functions
v1 = 1;
v2 = x;
v3 = x.^2;

plot(x,alpha(1)*v1 + alpha(2)*v2 + alpha(3)*v3,'r--','linewidth',2)
