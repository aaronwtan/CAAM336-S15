 function Sx = step(x,c)

 Sx = (x>=c);

 Sx = zeros(size(x));
 for j=1:length(x)
    if x(j)>=c
       Sx(j) = 1;
    end
 end

