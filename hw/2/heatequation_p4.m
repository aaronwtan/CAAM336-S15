%%HW 2, Problem 4a. CAAM 336, Fall 2014
%% Heat equation u_t=u_xx - explicit finite difference scheme on the interval 0<x<1 with boundary
%% conditions u(0,t)=0, u(1,t)=0 and given initial condition u(x,0) =1-2*(x-1/2).*sign(x-1/2)



% number of interior unknowns
M=17;
% time step and spatial step size
dt = 0.0001;
dx =(1-0)/(M+1);

% number of time iterations
K =51; 

% final time of the computation
Tf = N*dt; 

% the mesh ratio
r = dt/dx^2;  

tvals = 0:dt:Tf;
xvals = 0:dx:1;

N=length(tvals);
J=length(xvals);

u0 = @(x) 1-2*(x-1/2).*sign(x-1/2);

u = zeros(J,N);
u(:,1) = u0(xvals);


for n = 1:K-1
	u(2:J-1,n+1) = r*u(3:J,n) + (1-2*r)*u(2:J-1,n)+r*u(1:J-2,n);
	u(1,n+1) = 0;
	u(J,n+1) = 0;       
end


figure(1)
plot(xvals,u(:,1),'k');hold on %soluton at t=0
xlabel x; ylabel u;  
title(strcat('mesh size dx= ',num2str(dx),...
    ', ratio r=dt/(dx)^2= ',num2str(r)))
plot(xvals,u(:,11),'r');hold on
plot(xvals,u(:,51),'g');hold on
%plot(xvals,u(:,100),'b');hold on
legend('t=0', 't=10','t=50','t=100')
hold off

figure(2)
surf(xvals, tvals, u')
xlabel x; ylabel t; zlabel u  
title(strcat('mesh size dx= ',num2str(dx),...
    ', ratio r=dt/(dx)^2= ',num2str(r)))


