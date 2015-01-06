clear
clc

f=[1; 0; 1];
w1=[1; 0; -1];
w2=[0; 1; -1];

G=zeros(2);
G(1,1)=w1.'*w1;
G(2,2)=w2.'*w2;
G(1,2)=w1.'*w2;
G(2,1)=G(1,2);

b=zeros(2,1);
b(1)=f.'*w1;
b(2)=f.'*w2;

c=G\b;
best=c(1)*w1+c(2)*w2;

figure(1)
clf
fill3([-1 1 1 -1],[-1 -1 1 1],[2 0 -2 0],'g')
hold on
plot3(f(1),f(2),f(3),'r.','markersize',30)
xlabel('x')
xlabel('y')
xlabel('z')
input('hit return')
plot3(best(1),best(2),best(3),'b.','markersize',30)
input('hit return')
plot3([best(1) f(1)],[best(2) f(2)],[best(3) f(3)],'k','linewidth',2)
fprintf('\n (f-w, w_1) = %12.8e\n\n', (f-best).'*w1)
fprintf('\n (f-w, w_1) = %12.8e\n\n', (f-best).'*w2)