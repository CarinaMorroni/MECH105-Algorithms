function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

% falsePosition finds the root of a function using false position method
%
% Outputs:
% root - the estimated root location
% fx - the function evaluated at the root location
% ea - the approximate relative error
% iter - how many iterations were performed
%
% Inputs:
% func - the function being evaluated
% xl - the lower guess
% xu - the upper guess
% es - the desired relative error (defaults to 0.0001%)
% maxit - the maximum number of iterations to use (defaults to 200)
% varargin - any additional parameters used by the function

if nargin < 3 || nargin > 6
    error("Enter a correct amount of input variables");
else if nargin == 3
        es = 0.0001;
        maxit = 200;
    else if nargin == 4
        maxit = 200;
        end
    end
end

if func(xl) * func(xu) >= 0
    error("The upper and lower guesses do not surround the root. Choose different initial guesses.")
end

% set approximate relative error initially to 100%
ea = 100;
% variable xold is to calculate error
xold = 0;
iter = -1;

while ea > es
    root = xu - ((func(xu).*(xl-xu))./(func(xl)-func(xu)));
    
    if root ~=0
        ea = (root - xold)./ root * 100;
    else
        ea = 0;
    end
    
    if func(root) .* func(xl) < 0
        xu = root;
    else
        xl = root;
    end
    
    xold = root;
    iter = iter + 1;
end

fx = func(root);

end