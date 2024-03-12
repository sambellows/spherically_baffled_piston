function [p] = legendrep(n, x)
% LEGENDREP legendre polynomials of the first kind
%
% [P] = legendrep(N, x) returns the legendre polynomials evaluated at x
% degree N
%
% Input Parameters:
%   n: scalar or vector of degree values
%   x: ndarray of x values
%
% Returns:
%   P: (N + 1) x size(x) of the legendre polynomials evaluated at every
%       degree at x
%
% (c) 2024 Samuel D. Bellows

if isvector(n)
    m = max(n);   
else
    m = n;
end

% Original dimensions of x
dims = size(x);
x = x(:);
p = zeros(m + 1, length(x));

% P0
p(1, :) = 1;

if m > 0
    % P1
    p(2, :) = x;
    % Bonnet's recursion formula
    for l = 2:m
        k = l - 1;
        p(l + 1, :) = 1 / l * ((2*k + 1) * x'.* p(l, :) - k * p(l - 1,:));  

    end
    
    p = squeeze(reshape(p, [(m + 1), dims]));
end



% Pull out the desired degrees
if isvector(n)
   p = p(n + 1, :); 
end


end