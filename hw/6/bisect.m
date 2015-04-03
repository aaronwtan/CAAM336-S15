function xstar = bisect(f,a,b)

% function xstar = bisect(f,a,b)
% Compute a root of the function f using bisection.
% f:    a function name, e.g., bisect('sin',3,4), or bisect('myfun',0,1)
% a, b: a starting bracket:  f(a)*f(b) < 0.

fa = feval(f,a);
fb = feval(f,b);         % evaluate f at the bracket endpoints
delta = (b-a);           % width of initial bracket
k = 0; fc = inf;         % initialize loop control variables

c = (a+b)/2; 
while (delta/(2^k)>1e-18) && abs(fc)>1e-18
    c = (a+b)/2;
    fc = feval(f,c);   % evaluate function at bracket midpoint
    if fa*fc < 0
        b=c;
        fb = fc;     % update new bracket
    else
        a=c;
        fa=fc;
    end
    k = k+1;
%    fprintf(' %3d  %20.14f  %16.8e\n', k, c, fc);
end
xstar = c; 