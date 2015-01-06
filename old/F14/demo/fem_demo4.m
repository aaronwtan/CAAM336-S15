% 5-point FEM example from class - solves -u''(x) = x with BCs
% u(0) = 1 and either u(1) = 2 or u'(1) = 2;

x = [0 .25 .5 .75 1];
h = .25;

% Dirichlet BCs 
K = (1/h)*[2 -1 0;
          -1 2 -1;
          0 -1 2];
      
b = h^2*[1:3]' + [1/h;0; 0] + 2*[0; 0; 1/h];
a = K\b;

plot(x, [1;a;2],'.-')

% Neumann BCs
K = (1/h)*[2 -1  0  0;
          -1  2 -1  0;
           0 -1  2 -1;
           0  0 -1  1];
       
b4 = (1/h^3)*(1/3 - (1-h)/2 + (1-h)^3/6);
b = h^2*[1;2;3;b4] + [1/h;0;0;0] + 2*[0; 0 ;0 ;1];

a = K\b;
hold on
plot(x, [1;a],'r.-')