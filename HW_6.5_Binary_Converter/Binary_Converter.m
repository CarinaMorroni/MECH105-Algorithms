function [base2] = binaryConverter(base10)
%binary A simple function to convert a base10 number to binary
%   Inputs:
%       base10 - A number in base10
%   Outputs:
%       base2 - The base10 number converted to binary

if base10 == 0;
    base2 = 0;

else
n = floor(log2(base10));
base2 = zeros(1,n+1);
ten = base10;

for k = 1 : n+1
    if (ten - 2.^n) >= 0 
        base2(1,k) = 1;
        ten = ten - 2.^n;

    end
    
    n = n-1;
end

end
end