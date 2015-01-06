%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diff1b.m
% Example of the first differentiation matrix.
% This version makes it easier to switch functions using "inline" functions.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 ufun   = inline('sin(100*x)','x');          % define the function u(x)
 uprime = inline('100*cos(100*x)','x');       % define the function u'(x)

 N = input('enter N: ');  % sample the function at N+2 points on [0,1]
 h = 1/(N+1);             % spacing between grid points
 x = linspace(0,1,N+2)';  % points at which we will sample the function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% construct the matrix D 

 D = zeros(N+1,N+2);
 D(1+(N+2)*[0:N]) = -1/h;
 D(N+2+(N+2)*[0:N]) = 1/h;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% take the (approximate) derivative
  
 u = ufun(x);               % the vector u samples sin(x) at our grid points.
 Du = D*u;                  % take the approximate derivative of u

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the output

 figure(1), clf
 xx = linspace(0,1,500);                        % fine x grid for plotting purposes
 subplot(2,1,1)                                 % top plot
 plot(xx,ufun(xx),'-','color', .5*[1 1 1],...   % show true function as a gray line
     'linewidth',2);
 hold on
 plot(x, u, 'b.','markersize',20);              % plot sampled function as blue dots 
 set(gca,'fontsize',14)                         % increase font size
 xlabel('x'), ylabel('u(x)')                    % add axis labels
 title('finite differences for the first derivative', 'fontsize',20)

 subplot(2,1,2)                                 % bottom plot
 plot(xx,uprime(xx),'-','color', .5*[1 1 1],... % plot true derivative as a gray line
     'linewidth',2);
 hold on 
 plot(x(1:N+1), Du, 'r.-','markersize',20);      % plot approximate derivative as red dots 
 set(gca,'fontsize',14)                         % increase font size
 xlabel('x'), ylabel('du/dx(x)')                % axis labels

