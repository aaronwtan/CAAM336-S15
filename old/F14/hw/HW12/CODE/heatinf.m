% heat equation, Heaviside initial condition

 x = linspace(-5,5,1001);
 u0 = x>0;

 tvec = [0 .01 .1 1];

 figure(1), clf
 for k=1:length(tvec)
    t = tvec(k);
    if t==0, 
       plot(x,u0,'k-','linewidth',2); hold on
    else
       uxt = 1/(2*sqrt(pi*t))*(sqrt(pi)/2)*erfc(-x/(2*sqrt(t)));
       uxt = (1/2)*erfc(-x/(2*sqrt(t)));
       plot(x,uxt,'k-','linewidth',2); hold on
    end
    pause
 end

 tvec = [0 .5 1 2];
 figure(2), clf
 for k=1:length(tvec)
    t = tvec(k);
    if t==0, 
       plot(x,u0,'k-','linewidth',2); hold on
    else
       uxt = .5*(x-t>0)+.5*(x+t>0);
       plot(x,uxt,'k-','linewidth',2); hold on
    end
    pause
 end
