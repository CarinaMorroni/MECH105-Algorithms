function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

format long

% set up the matrices to fill in, for L, U, and P
[m,n] = size(A);
L = tril(ones(m));
U = A;
P = eye(m);

% check errors
if m ~= n
    error('Input matrix must be a square matrix');
end

% other variables I use throughout code
max = 0;


for f = 1:n
    
        
        % pivoting
        
       % h = [abs(A(f,f:m))]
       % disp(h')
       % [maxNum,maxIndex] = max(h)
       % [row,col] = ind2sub(size(h), maxIndex)
       
       max = 0;
       row = f;
       
       for h = f:m
           if abs(U(h,f)) > max
               max = abs(U(h,f))
               row = h
           end
       end
       if row ~= f
           intermediary = [U(f,:)]
           U(f,:) = U(row,:)
           U(row,:) = intermediary
        
           intermediary_P = [P(f,:)]
           P(f,:) = P(row,:)
           P(row,:) = intermediary_P    
       end
        
        for g = (f+1):m
        
        % fill in L matrix
        L(g,f) = U(g,f)./U(f,f)
        
        % forward elimination of elements to form U matrix
        U(g,:) = U(g,:) - ((U(g,f)./U(f,f)) .* U(f,:))
        % B(g) = B(g) - ((U(g,f)./U(f,f)) .* B(f))
    end
end

end