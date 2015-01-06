%% Heat equation u_t=u_xx - finite difference scheme - Crank Nicolson method 

%%
%   This program integrates the heat equation  u_t - u_xx = 0
%   on the interval [0,1] using finite difference approximation 
%   via Crank Nicolson method. The implicit set of equations are solved at
%   each time step



clear all, clc, clf
%% Initial and Boundary conditions
M=32;
dx = (1-0)/(M+1);
dt = dx;

% number of time iterations
K =100; 

% final time of the computation
Tf = K*dt; 

% initial conditions
u0 = @(x) sin(pi*x);



% the mesh ratio
r = dt/(2*dx^2);

tvals=0:dt:Tf;
xvals=0:dx:1;

ue= sin(pi*xvals);

N=length(tvals);
J=length(xvals);
% Note: the original index j runs from j = 1 ( x = 0) to j = J ( x = 1).


u=zeros(J,N);

u(:,1)=u0(xvals);


E = ones(J ,1);
D = spdiags([-E 2*E -E],[-1,0,1],J,J);
I = speye(J);

A = I+ r*D;
B = I- r*D;

A(1,:) = 0; A(1,1) = 1;
A(J,:) = 0; A(J,J) = 1;



%% Time iteration

n=0;
for m = 1:K-1
    n=n+1; % counter for iteration
    rhs=B*u(:,n);
    rhs([1,J])=0;
    u(:,n+1) = A\rhs;
    u(1,n+1) = 0;
	u(J,n+1) = 0;
end 




%% Plot the final results

figure(1)
plot(xvals,u(:,1),'k');hold on %soluton at t=0
xlabel x; ylabel u;  
title(strcat('mesh size dx= ',num2str(dx),...
    ', ratio r=dt/2*(dx)^2= ',num2str(r)))
plot(xvals,u(:,11),'r');hold on
plot(xvals,u(:,51),'g');hold on
legend('t=0', 't=10','t=50')
hold off



figure(2)
surf(xvals, tvals, u')
xlabel x; ylabel t; zlabel u  
title(strcat('mesh size dx= ',num2str(dx),...
    ', ratio r=dt/2*(dx)^2= ',num2str(r)))

figure(3)
plot(xvals,abs(exp(-pi^2*tvals(1))*ue-u(:,1)'),'b');hold on %soluton at t=0
xlabel  x; ylabel |error|;  
title(strcat('mesh size dx= ',num2str(dx),...
    ', ratio r=dt/2*(dx)^2= ',num2str(r)))
plot(xvals,abs(exp(-pi^2*tvals(11))*ue-u(:,11)'),'r');hold on
plot(xvals,abs(exp(-pi^2*tvals(51))*ue-u(:,51)'),'g');hold on
legend('t=0', 't=10','t=50')
hold off

figure(4)
semilogy(xvals,abs(exp(-pi^2*tvals(1))*ue-u(:,1)'),'b');hold on %soluton at t=0
xlabel x; ylabel error;  
title(strcat('mesh size dx= ',num2str(dx),...
    ', ratio r=dt/2*(dx)^2= ',num2str(r)))
semilogy(xvals,abs(exp(-pi^2*tvals(11))*ue-u(:,11)'),'r');hold on
semilogy(xvals,abs(exp(-pi^2*tvals(51))*ue-u(:,51)'),'g');hold on
legend('t=0', 't=10','t=50')
hold off


