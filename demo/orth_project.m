syms x
figure

% define orthogonal basis functions
v1 = 1;
v2 = x - .5;
v3 = x^2 - x + 1/6;

% define function to represent
f = exp(2*x);

% projection coefficients
alpha1 = int(f*v1,x,0,1)/int(v1*v1,x,0,1);
alpha2 = int(f*v2,x,0,1)/int(v2*v2,x,0,1);
alpha3 = int(f*v3,x,0,1)/int(v3*v3,x,0,1);

error = f - (alpha1*v1 + alpha2*v2 + alpha3*v3);

% convert to numerical from symbolic
alpha1 = double(alpha1);
alpha2 = double(alpha2);
alpha3 = double(alpha3);

% plotting
x = linspace(0,1,25);
plot(x,exp(2*x),'linewidth',2); hold on

% define basis functions
v1 = 1;
v2 = x - .5;
v3 = x.^2 - x + 1/6;

plot(x,alpha1*v1 + alpha2*v2 + alpha3*v3,'r--','linewidth',2)
