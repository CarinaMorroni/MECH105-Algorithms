function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% check that inputs are same length
if length(x) ~= length(y)
    error('Vector "x" and vector "y" should be the same length');
end

% check that x values are equally spaced
x_spaced = linspace(x(1), x(length(x)), length(x));
for p = 1:length(x)
if x(p) ~= x_spaced(p)
    error('"x" values must be equally spaced');
end
end

sum = 0;

a = 1;
b = 2;
c = 3;

n = length(x) - 1;

if rem(length(x), 2) == 0      
    % warn user that trap rule will be used - even number of terms (odd number
    % intervals)
    warning('Trapezoidal Rule will be used for last interval');
    trap = (x(length(x)) - x(length(x)-1))/2.*((y(length(y)-1) + y(length(y))));
    
    if length(y) > 2
        for c = 3:2:(length(y)-1)
            sum = sum + (y(a) + 4*y(b) + y(c));
            a = a + 2;
            b = b + 2;
            c = c + 2;
        end
        h = x(length(x)-1) - x(1);
        simpson = (h/(3*(n-1))) * sum;
    else
        simpson = 0;
    end
    
    I = simpson + trap;
    
else                 % odd number terms (even number intervals)
    
    for c = 3:2:length(y)
        sum = sum + (y(a) + 4*y(b) + y(c));
        a = a + 2;
        b = b + 2;
        c = c + 2;
    end   
    
    h = x(length(x)) - x(1);
    I = (h/(3*n)) * sum;
end

end