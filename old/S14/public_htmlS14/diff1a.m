%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diff1a.m
% Example of the first differentiation matrix.
% The function u(x) = sin(5*x) is hard-coded below.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 N = input('enter N: ');  % sample the function at N+2 points on [0,1]
 h = 1/(N+1);             % spacing between grid points
 x = linspace(0,1,N+2)';  % points at which we will sample the function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% three equivalent ways of computing the differentiation matrix D

% method 1: obvious way using a loop
 D = zeros(N+1,N+2);
 for j=1:N+1
    D(j,j) = -1/h; 
    D(j,j+1) = 1/h; 
 end

% method 2: alternative using identity matrices 
 D = zeros(N+1,N+2);
 D(1:N+1,1:N+1) = -(1/h)*eye(N+1);
 D(1:N+1,2:N+2) = D(1:N+1,2:N+2) + (1/h)*eye(N+1);

% method 3: slick method: treats the matrix as a column-oriented vector...
 D = zeros(N+1,N+2);
 D(1+(N+2)*[0:N]) = -1/h;
 D(N+2+(N+2)*[0:N]) = 1/h;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% take the (approximate) derivative
 
 u = sin(5*x);              % the vector u samples sin(x) at our grid points.
 Du = D*u;                  % take the approximate derivative of u

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the output

 figure(1), clf
 xx = linspace(0,1,500);                        % fine x grid for plotting purposes
 subplot(2,1,1)                                 % top plot
 plot(xx,sin(5*xx),'-','color', .5*[1 1 1],...  % show true function as a gray line
       'linewidth',2)
 hold on
 plot(x, u, 'b.','markersize',20);              % plot sampled function as blue dots 
 set(gca,'fontsize',14)                         % increase font size
 xlabel('x'), ylabel('u(x)')                    % add axis labels
 axis([0 1 -1.25 1.25]) 
 title('finite differences for the first derivative', 'fontsize',20)

 subplot(2,1,2)                                 % bottom plot
 plot(xx,5*cos(5*xx),'-','color', .5*[1 1 1],...% plot true derivative as a gray line
       'linewidth',2)
 hold on 
 plot(x(1:N+1), Du, 'r.-','markersize',20,'linewidth',1);      % plot approximate derivative as red dots 
 set(gca,'fontsize',14)                         % increase font size
 xlabel('x'), ylabel('du/dx(x)')                % axis labels
 axis([0 1 -6 6]) 

