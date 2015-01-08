% % Solves -d/dx((1+x)du/dx) =1   u(0)=u(1)=0 using piecewise linear FEM
% Compares to the true solution
N = input('size of fem subspace  ');
% use uniform grid
h = 1/(N);
x=linspace(0,1,N+1)';
k=(1+x);
% build stiffness matrix (the Gram matrix with respect to energy inner product)
K=zeros(N-1,N-1);
for ii=1:N-1 
 K(ii,ii)=2*(ii*h+1)/h; 
end 
% Here is the loop that computes the subdiagonal and super diagonal. Recall that K is symmetric, which 
% means that we do not need to compute the subdiagonal once we have the superdiagonal: 
for ii=1:N-2 
  K(ii,ii+1)= -(h+2*(ii*h)+2)/(2*h);  
  K(ii+1,ii)=K(ii,ii+1); 
end 
 K
% right hand side
f=zeros(N-1,1);
f=f+h;
% solve for unknown coefficients of solutions
u=K\f;
% coefficients are just the nodal values of the solution, can plot directly
xnodes=0:h:1;
% add on the zero boundary values
u= [ 0 ; u ; 0];
% plot true solution on a fine grid so it looks smooth
finex=0:0.01:1;
plot(xnodes,u,finex,log(1+finex)./log(2)-finex);
legend('fem solution', 'true solution');
