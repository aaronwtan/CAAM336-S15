clear
clc
tvec = [0 .00001 .00002 .00004];
x = linspace(0,1,500);
an0 = inline('sqrt(2)*432*(n^4-18*n^2+216)/((36*n-n^3)^3*pi^3)');
lam = inline('n^2*pi^2 + n^4*pi^4');
col = 'rgbck';
str = 'abcd';
for j=1:length(tvec)
    figure(1)
    clf
    t = tvec(j);
    u = zeros(size(x));
    for n=1:2:9
        u = u+exp(-lam(n)*t)*an0(n)*(sqrt(2)*sin(n*pi*x));
        [tf,loc] = ismember(n,[1 3 5 7 9]);
        if tf
            plot(x,u,'-','color',col(loc),'linewidth',2)
            hold on
        end 
    end
    legend('N = 1','N = 3','N = 5','N = 7','N = 9')
    xlabel('x','fontsize',20)
    ylabel('u_N(x,t)','fontsize',20)
    title(sprintf('time t = %g',t),'fontsize',20)
    eval(sprintf('print -depsc2 fourth_%s',str(j)))
    pause(.1)
end