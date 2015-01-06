%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ssheateq.m
% Example of the second differentiation matrix for the heat equation.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 ufun    = inline('exp(x).*sin(pi*x)','x');   % define the function u(x)
 ffun    = inline('exp(x).*(2*pi*cos(pi*x)-(pi^2-1)*sin(pi*x))','x');

 N = input('enter N: ');  % sample the function at N+2 points on [0,1]
 h = 1/(N+1);             % spacing between grid points
 x = linspace(0,1,N+2)';  % points at which we will sample the function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% construct the matrix D2 (N-by-N matrix, with homogeneous Dirichlet b.c.'s)

 D2 = zeros(N,N);
 D2 = (-2*eye(N) + diag(ones(N-1,1),-1) + diag(ones(N-1,1),1))/(h^2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solve the differential equation
  
 f = ffun(x(2:N+1));        % the vector f samples f(x) at our grid points.
 u = D2\f;                  % solve the matrix system

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the output

 figure(1), clf
 xx = linspace(0,1,500);                        % fine x grid for plotting purposes
 plot(xx,ufun(xx),'-','color', .5*[1 1 1],...   % show true function as a gray line
     'linewidth',2);
 hold on
 input('hit return to see the solution')

 plot(x, [0;u;0], 'b.-','markersize',20);       % plot sampled function as blue dots 
 set(gca,'fontsize',14)                         % increase font size
 xlabel('x'), ylabel('u(x)')                    % add axis labels

