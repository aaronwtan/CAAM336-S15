 function Sx = stairs(x,N)

 Sx = zeros(size(x));

 for k=1:length(x)
     Sx(k) = floor(x(k)*N); 
 end

