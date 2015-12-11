function [m, I, J] = findmin(X)
% find the min in nonnegative value of X
X(X<=0) = Inf;
m = min(X(:));
[I,J] = find(X==m);