%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diff2.m
% Example of the second differentiation matrix.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 ufun    = inline('sin(10*x)','x');          % define the function u(x)
 uprime  = inline('10*cos(10*x)','x');       % define the function u'(x)
 u2prime = inline('-100*sin(10*x)','x');       % define the function u''(x)

 N = input('enter N: ');  % sample the function at N+2 points on [0,1]
 h = 1/(N+1);             % spacing between grid points
 x = linspace(0,1,N+2)';  % points at which we will sample the function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% construct the matrix D2 (N-by-N+2 matrix)

 D2 = zeros(N+2,N+2);
 D2 = (-2*eye(N+2) + diag(ones(N+1,1),-1) + diag(ones(N+1,1),1))/(h^2); 
 D2 = D2(2:N+1,:); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% take the (approximate) derivative
  
 u = ufun(x);               % the vector u samples sin(x) at our grid points.
 D2u = D2*u;                % take the approximate second derivative of u

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
 title('finite differences for the second derivative', 'fontsize',20)

 subplot(2,1,2)                                 % bottom plot
 plot(xx,u2prime(xx),'-','color', .5*[1 1 1],... % plot true derivative as a gray line
     'linewidth',2);
 hold on 
 plot(x(2:N+1), D2u, 'r.-','markersize',20,'linewidth',1);      % plot approximate derivative as red dots 
 set(gca,'fontsize',14)                         % increase font size
 xlabel('x'), ylabel('d^2u/dx^2(x)')                % axis labels
