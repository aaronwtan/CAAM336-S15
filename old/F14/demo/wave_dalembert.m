x = linspace(-10,10,1000);

c = 5; % wave speed
u0 = @(x) exp(-x.^2); % Gaussian initial distribution
% u0 = @(x) (x > -.5) & (x < .5); % discontinuous initial condition

tVec = 0:.1:5;
uMat = [];
figure
for t = tVec
    u = .5*u0(x - c*t) + .5*u0(x + c*t);
    
%     plot(x,u)

%     pause;
%     drawnow
    
    uMat = [uMat; u];
    plot3(x,t*ones(size(x)),.5*u0(x - c*t) + .5*u0(x + c*t));hold on
%         axis([-10 10 0 1])    
    drawnow
    
end

surf(x,tVec,uMat)
shading interp