% Question 2

xx = linspace(0,1,50);
yy = linspace(0,1,50);
[X,Y] = meshgrid(xx,yy);


T = [0 .005 .1 1];

for q = 2:2
    t = T(q);
    u = zeros(length(X),length(Y));
    for j = 1:2
        for k = 1:2
            lam = (j.^2 + k.^2).*pi.^2;
            eint = (exp(t.*(lam-1))-1)/(lam - 1);
            R_xy = ((j.^2.*pi.^2 - 24).*((-1).^j + 1).*((-1).^k + 1))/(8.*j.^3.*k.*pi.^4);
            psi_jk = 2.*sin(j.*pi.*X).*sin(k.*pi.*Y);
            u = u + exp(-lam.*t).*R_xy.*eint.*psi_jk;
            
%            figure(q)
%            surf(X,Y,u)
%            xlabel('x')
%            ylabel('y')
%            zlabel('u(x,y)')
%            title(sprintf('t = %d', t))
        end
    end
end
