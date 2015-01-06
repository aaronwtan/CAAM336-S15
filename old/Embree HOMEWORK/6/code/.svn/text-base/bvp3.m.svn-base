
 N = 20;
 x = linspace(0,1,500);
 f = (x<.5);

 figure(1), clf
 plot(x,f,'b-','linewidth',2);
 hold on

 fk = zeros(size(x));
 for k=1:N
    ck =  (sqrt(2)*sin((2*k-1)*pi/4))/((k-.5)*pi);
    fk = fk + ck*(sqrt(2)*cos((k-.5)*pi*x));
    plot(x,fk,'r-')
 end

 figure(2), clf
 uk = zeros(size(x));
 for k=1:N
    ck =  (sqrt(2)*sin((2*k-1)*pi/4))/((k-.5)*pi);
    uk = uk + ck/((k-.5)^2*pi^2)*(sqrt(2)*cos((k-.5)*pi*x));
    plot(x,uk,'r-'), hold on
 end

 figure(3), clf
 ukprime = (uk(3:end)-2*uk(2:end-1)+uk(1:end-2))/((x(2)-x(1))^2);
 plot(x(2:end-1), -ukprime, 'b-','linewidth',2)
