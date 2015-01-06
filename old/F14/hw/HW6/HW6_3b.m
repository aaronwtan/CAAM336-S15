% Sine series for f(x)=x*(1-x) on [0,1]

clear c;
n=5;
for j=1:n
    c(j)=(2*sqrt(2)/(pi^3))*(1-(-1)^(j))/(j^3);
end;
xgrid=0:0.01:1;
hold off
fn=zeros(size(xgrid));
for j=1:n
    fn=fn+ c(j)*sqrt(2)*sin(j*pi*xgrid);
end

figure(1)
plot(xgrid, xgrid.*(1-xgrid), 'r', xgrid, fn, 'g');
legend('f=exact', 'fn=fourier')







